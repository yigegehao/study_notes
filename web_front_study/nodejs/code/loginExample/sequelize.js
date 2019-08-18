const Sequelize = require('sequelize')

const sequelize = new Sequelize('test','root','',
{
    host:'127.0.0.1',
    dialect:'mysql'
});
var User = sequelize.define('user',{
    name:{
        type:Sequelize.STRING
    }
    ,
    passwd:{
        type:Sequelize.STRING
    }
},{
     sequelize,
     modelName:'user'
});

// User.findAll().then(users => {
//     var usersJson = JSON.stringify(users, null, 4);
//     console.log(typeof users);
//   });
User.sync({ force: true }).then(()=>
{
    return User.create({
        name:'x',
        passwd:'x'
    });
});











// sequelize
//   .authenticate()
//   .then(() => {
//     console.log('Connection has been established successfully.');
//   })
//   .catch(err => {
//     console.error('Unable to connect to the database:', err);
//   });