/*TMODJS:{"version":1,"md5":"2f4d8c1f946ad9a8302cf00063112764"}*/
define(function (require) {
    return require("./template")("login", '<!DOCTYPE html> <html> <head> <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> </head> <body> <form method="POST" action="/loginCheck"> \u8d26\u53f7<input name="name" type="text"><br> \u5bc6\u7801<input name="passwd" type="password"><br> <input type="submit" value="submit"/> </form> </body> </html>')
});