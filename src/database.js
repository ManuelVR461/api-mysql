const mysql = require('mysql');

const mysqlConnect = mysql.createConnection({
    host:'localhost',
    user: 'root',
    password:'',
    database:'dbcompania'
})

mysqlConnect.connect(function (err){
    if(err){
        console.log(err);
        return;
    }else{
        console.log('Connected!');
    }
})

module.exports = mysqlConnect;