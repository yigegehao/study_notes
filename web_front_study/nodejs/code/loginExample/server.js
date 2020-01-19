var http = require('http');
var express = require("express");
var path = require("path");
var fs = require('fs');
var mysql = require("./mysql");
var app = express();
var user = require('./model/user');
var bodyParser = require('body-parser');
// 创建 application/x-www-form-urlencoded 编码解析
var urlencodedParser = bodyParser.urlencoded({extended: false})
var session = require('client-sessions');

app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');
app.use("/login", function (req, res) {
    var fileName = "./html/login.html";
    fs.readFile(fileName, function (err, data) {
        if (err) {
            console.log(err.message);
        } else {
            res.write(data);
            res.end();
        }
    });
})
//设置seesion
app.use(session({
    cookieName: 'session',
    secret: 'random_string_goes_here', //一个随机字符串，因为客户端的数据都是不安全的，所以需要进行加密
    duration: 30 * 60 * 1000, //session的过期时间，过期了就必须重新设置
    activeDuration: 5 * 60 * 1000, // 激活时间，比如设置为30分钟，那么只要30分钟内用户有服务器的交互，那么就会被重新激活。
}));
//登录校验
app.post("/loginCheck", urlencodedParser, function (req, res) {
    console.log(req.body.name);
    console.log(req.body.passwd);
    user.findAll({
        where: {
            name: req.body.name,
            passwd: req.body.passwd
        }
    }).then(user = > {
        if(user.length == 1
)
    {
        req.session.user == user //将user信息保存到Session中
        //res.redirect('/dashboard')
        //res.end("success");
        var fileName = "./html/success.html";
        fs.readFile(fileName, function (err, data) {
            if (err) {
                console.log(err.message);
            } else {
                res.write(data);
                res.end();
            }
        });
    }
else
    {
        res.end("faile");
        //res.render('login.jade',{error:'用户名或密码错误！'})
    }
})
    ;
});
//注销
app.get('/logout', function (req, res) {
    console.log('sssss');
    req.session.reset;
    res.redirect('/login');
});
//监听端口
app.listen(8888, () = > {
    console.log('server running at http://127.0.0.1:8888');
})
;


// http.createServer(function(require,response){
//     // 发送 HTTP 头部 
//     // HTTP 状态值: 200 : OK
//     // 内容类型: text/plain
//     response.writeHead(200, {'Content-Type': 'text/plain'});

//     // 发送响应数据 "Hello World"
//     response.end('Hello World\n');
// }).listen(8888);

//console.log('server running at http://127.0.0.1:8888');