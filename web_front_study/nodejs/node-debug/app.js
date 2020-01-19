const express = require('express')
const app = express();

app.get('/', function (req, res) {
    let a = 1;
    while (a < 8 * * 12) {
        a++;
    }
    res.send(`hello world ${a}`);
});
app.listen(3000, () = > console.log("app is run in 3000")
)
;