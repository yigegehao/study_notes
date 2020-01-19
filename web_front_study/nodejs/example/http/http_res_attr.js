var http = require("http");
http.createServer(function (req, res) {
    //response常用属性
    res.statusCode = 404;
    res.setHeader("Content-Type", "text/plain;charset=utf-8");
    res.write("hello world,你好，世界", "utf-8");
    /*每个请求都必须要调用end方法来结束响应
      告诉服务器该响应的报文头，报文体等都已经全部响应完毕了，可以考虑本次响应结束
    */
    res.end();
}).listen(9081, function () {
    console.log("http://localhost:9081");
});