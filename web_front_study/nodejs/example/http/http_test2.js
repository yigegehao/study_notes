var http = require("http");
http.createServer(function(req,res){
    //获取用户请求路径的url
    //console.log(req.url);
    if(req.url === '/' || req.url === '/index'){
        res.end("hello index");
    }else if(req.url === '/login'){
        res.end("hello login");
    }else if(req.url === '/list'){
        res.end("hello list");
    }else{
        res.end("404,not found");
    }
    res.end();
}).listen(8080,function(){
    console.log("http://localhost:8080")
});