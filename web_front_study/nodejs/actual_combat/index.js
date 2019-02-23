//当前项目（包）的入口文件
var http = require('http');
var fs = require('fs');
var path = require('path');
var mime = require('mime');

http.createServer(function(req,res){
    //设计路由
    /*当用户请求/或者/index,显示新闻列表
      请求/item时，显示新闻详情
      请求/submit时，显示添加新闻
      请求/add时，将用户的新闻保存到data.json文件中
     */
    req.url = req.url.toLowerCase();
    req.method = req.method.toLowerCase();
    
    //先根据用户请求的路径，将对应的HTML页面显示出来
    if(req.url === '/' || req.url === '/index' && req.method === 'get'){
        //读取index.thml并返回
        fs.readFile(path.join(__dirname,'htmls','index.html'),function(err,data){
            if(err){
             throw err;   
            }
            res.end(data);
        });        
    }else if(req.url === '/submit' && req.method === 'get'){
        fs.readFile(path.join(__dirname,'htmls','submit.html'),function(err,data){
            if(err){
                throw err;
            }
            res.end(data);
        });
    }else if(req.url.endsWith('css') || req.url.endsWith('gif')){
        fs.readFile(path.join(__dirname,'htmls',req.url),function(err,data){
            if(err){
                throw err;
            }
            res.setHeader('Content-Type',mime.getType(req.url));
            res.end(data);
        });
    };

}).listen(9090,function(){
    console.log('http://localhost:9090');
});