const y = 10;
const mysql = require('mysql')
    let connection = mysql.createConnection({
        user:'root',
        password:'x',
        database:'mysql'
    });
    connection.connect((err)=>{
        if(err) throw err;
        connection.query('select *from user',(err,result,fields)=>{
            if(err) throw err;
            console.log(result);
        })
    });
    connection.release();
exports.y = y;