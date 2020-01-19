var fs = require('fs');
fs.readFile('./hello.txt', function (err, data) {
        if (err) {
            throw err;
        }
        //data 参数是一个buffer对象
        console.log(data.toString('utf8'));
    }
);

