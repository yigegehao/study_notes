var express = require('express');
var app = express();
var fs = require('fs');
var multer = require('multer');
var upload = multer({
    dest: './uploads',
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now())
    }
});

app.post('/upload', upload.single('image'), function (req, res) {
    res.send("Uploaded");
});
app.get('/index', function (req, res) {
    fs.readFile('./index.html', function (err, data) {
        if (err) {
            console.log(err.message);
        } else {
            res.end(data);
        }
    });
});
app.listen(3000);