var http = require("http")
http.createServer(function(req,res){
    //获取请求报文头中的数据
    console.log(req.headers);
    //获取请求方法
    console.log(req.httpVersion);
    //获取请求路径
    console.log(req.url);
    res.end("over");
}).listen(9081,function(){
    console.log("http://localhost:9081")
});