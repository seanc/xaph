'use strict';

import exec from 'ssh-exec';
import express from 'express';
import zt from 'zt';
import { createConnection } from 'mysql2';
import { CronJob } from 'cron';

const app = express();
app.set('json spaces', 3);
const command = 'netstat -anp |grep 25565 |wc -l';
const servers = [
  {loc: 'New Jersey', host: 'root@45.63.16.205'},
  {loc: 'Atlanta', host: 'root@45.32.221.72'},
  {loc: 'Los Angeles', host: 'root@45.63.55.7'}
];
const db = createConnection({
  user: 'root',
  password: 'root',
  host: '127.0.0.1',
  database: 'xaph'
});

let queryServers = function() {
  let promises = [];
  for(let server of servers) {
    let promise = new Promise((resolve, reject) => {
      exec(command, server.host, (err, stdout, stderror) => {
        if(err) reject(err); if(stderror) reject(stderror);
        resolve({loc: server.loc, players: parseInt(stdout.trim())});
      });
    });
    promises.push(promise);
  }
  return promises;
}

let addDataPoint = function() {
  let date = new Date().getTime();
  Promise.all(queryServers()).then(servers => {
    for(let server of servers) {
      db.execute('INSERT INTO `servers` VALUES(?, ?, ?, ?)', [null, server.loc, server.players, date], (err, rows) => {
        if(err) return console.log(err);
        zt.log(`Successfully created new data point for ${server.loc}`);
      });
    }
  });
}

let getDataPoints = function() {
  return new Promise((resolve, reject) => {
    let json = [];
    let data = [];
    for(let server of servers) {
      db.execute('SELECT `server`, `timestamp`, `players` FROM `servers` WHERE `server`=? ORDER BY `players` ASC', [server.loc], (err, rows) => {
        for(let row of rows) {
          data.push([
            parseInt(row.timestamp),
            row.players
          ]);
        }
        json.push({
          name: server.loc,
          data: data
        });
      });
    }
    setTimeout(() => resolve(json), 100);
  });
}

let transact = new CronJob('0 0 */2 * *', () => addDataPoint(), null, true, '');

app.get('/', (req, res) => {
  getDataPoints().then(data => res.status(200).jsonp(data));  
});

app.listen(3333, () => zt.log('Listning on port 3333'));