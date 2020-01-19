var sequelize = require('sequelize')

var User = require('sequelize')
var mysqlHelp = require('../database').mysqlHelp;

var User = mysqlHelp.define("user", {
    name: {
        type: sequelize.STRING
    },
    passwd: sequelize.STRING
});

module.exports = User;

