var http = require('http');
var server = http.createServer();
server.on('request',function(req,res){
    //解决乱码的思路：通过设置http的响应报文头，告诉浏览器使用对应的编码来解析网页
    res.setHeader("Content-Type","text/html;charset=utf-8");
    res.write('Hello <h1>world<h1>,你好，世界');
    res.end();
});

server.listen(8080,function(){
    console.log('服务器启动了，请访问：http://localhost:8080');
});