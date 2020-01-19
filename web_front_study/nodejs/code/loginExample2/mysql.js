var mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    port: '3306',
    database: 'test'
});

//connection.connect();

var sql = 'select * from user';

// connection.query(sql,function(err,result){
//     if(err){
//         console.log('{SELECT ERROR] - ',err.message);
//         return;
//     }
//     console.log(result);
// });

//connection.end();

module.exports = connection;