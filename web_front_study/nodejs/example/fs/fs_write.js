//文件写入
var fs = require('fs');
var msg = 'hello world';
fs.writeFile('./hello.txt',msg,'utf8',function(err){
    if(err){
        console.log('写文件失败:'+err);
    }else{
        console.log('ok');
    }
    
});
console.log('end');