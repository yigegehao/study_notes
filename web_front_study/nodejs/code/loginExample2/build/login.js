/*TMODJS:{"version":2,"md5":"1bc75f17b2000ed31942505a0802f58d"}*/
define(["./template"], function (a) {
    return a("login", '<!DOCTYPE html> <html> <head> <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> </head> <body> <form method="POST" action="/loginCheck"> \u8d26<input name="name" type="text"><br> \u5bc6\u7801<input name="passwd" type="password"><br> <input type="submit" value="submit"/> </form> </body> </html>')
});