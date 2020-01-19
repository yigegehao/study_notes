const os = require('os')
console.log(os.uptime())

const b = require('./dir/')

//console.log(a.x);
console.log(b.y);
let buffer = Buffer.from([1, 0x20, 3]);
for (const b of buffer) {
    console.log(b);
}
console.log(buffer)