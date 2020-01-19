var express = require('express');
var multer = require("multer");
var app = express();
var bodyParse = require('body-parser');

// 设置图片存储路径
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './uploads');
    },
    filename: function (req, file, cb) {
        cb(null, `${Date.now()}-${file.originalname}`)
    }
})

// 添加配置文件到muler对象。
var upload = multer({storage: storage});
var imgBaseUrl = '../'

// bodyParse 用来解析post数据
app.use(bodyParse.urlencoded({extended: false}));
app.use(express.static('public'));

// 解决跨域问题
app.all('*', function (req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild');
    res.header('Access-Control-Allow-Methods', 'PUT, POST, GET, DELETE, OPTIONS');

    if (req.method == 'OPTIONS') {
        res.send(200);
        /让options请求快速返回/
    } else {
        next();
    }
});

// 文件上传请求处理，upload.array 支持多文件上传，第二个参数是上传文件数目
app.post(' ', upload.array('img', 2), function (req, res) {
    // 读取上传的图片信息
    var files = req.files;

    // 设置返回结果
    var result = {};
    if (!files[0]) {
        result.code = 1;
        result.errMsg = '上传失败';
    } else {
        result.code = 0;
        result.data = {
            url: files[0].path
        }
        result.errMsg = '上传成功';
    }
    res.end(JSON.stringify(result));
});

// 监听3000端口
var server = app.listen(3000, '0.0.0.0', function () {
    console.log('listening at =====> http://0.0.0.0:3000......');
});
