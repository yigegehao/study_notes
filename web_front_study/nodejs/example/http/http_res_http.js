var http = require('http');
var fs = require('fs');
var path = require('path');


http.createServer(function (req, res) {
    if (req.url === '/' || req.url === '/index') {
        console.log("-------------------");
        fs.readFile(path.join(__dirname, 'htmls', 'index.html'), function (err, data) {
            if (err) {
                throw err;
            }
            res.write(data);
            res.end();
        });

    } else if (req.url === '/login') {
        res.end("hello login");
    } else if (req.url === '/list') {
        res.end("hello list");
    } else if (req.url === '/imgs/index.png') {
        fs.readFile(path.join(__dirname, 'imgs', 'index.png'), function (err, data) {
            if (err) {
                throw err;
            }
            res.setHeader('Content-Type', 'image/png');
            res.end(data);
        });
    } else {
        res.end("404,not found");
    }
}).listen(9090, function () {
    console.log("http://localhost:9090");
});