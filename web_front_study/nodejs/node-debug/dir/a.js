const x = 10;

const url = require('url');

let string = 'https://www.baidu.com';

console.log(url.parse(string,true));
console.log('----------------------------');
console.log(url.format(url.parse(string)));
exports.x = x;