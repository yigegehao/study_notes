var Sequelize = require('sequelize')
var Database = {};

Database.mysqlHelp = new Sequelize('test','root','',
{
    host:'127.0.0.1',
    dialect:'mysql'
});

Database.sequelize = Sequelize;
module.exports = Database;