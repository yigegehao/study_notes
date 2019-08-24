var fs = require('fs');
var express = require('express')
var multer = require('multer')

var app = express();
var upload = multer({dest:'upload/'});

app.post('/upload',upload.single('logo'),function(req,res,next){
    res.send({ret_code:'0'});
})
app.get('/index',function(req,res){
    fs.readFile('./index.html',function(err,data){
        if(err){
            console.log(err.message);
        }else{
            res.writeHead(200,{'encoding':'utf-8'});
            res.write(data);
            res.end();
        }
    });
});
app.get('/form',function(req,res,next){
    var form = fs.readFileSync('./upload/aeee78be9b0b23713eaf446d04ecd3ef',{encoding:'utf-8'});
    res.writeHead(200,{'contentType':'image/jpeg'});
    res.send(form);
});

app.listen(3000);