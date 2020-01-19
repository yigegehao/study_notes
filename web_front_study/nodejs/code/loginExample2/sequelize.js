const Sequelize = require('sequelize')

const sequelize = new Sequelize('test', 'root', '',
    {
        host: '127.0.0.1',
        dialect: 'mysql'
    });
var User = sequelize.define('user', {
    name: {
        type: Sequelize.STRING
    }
    ,
    passwd: {
        type: Sequelize.STRING
    }
}, {
    sequelize,
    modelName: 'user'
});

User.findOne({
    where: {
        name: 'xx',
        passwd: 'x'
    }
}).then(function (obj) {
    if (obj) {
        console.log('aaaaaa')
    }
    console.log(obj);
});

// User.findAll({
//     where:{
//         name:'x',
//         passwd:'x'
//     }
//   }).then(user=>{
//     console.log(typeof user);
//     console.log(user.dataValues);
//     console.log(JSON.stringify(user));
//   });


// User.sync({ force: true }).then(()=>
// {
//     return User.create({
//         name:'x',
//         passwd:'x'
//     });
// });


// sequelize
//   .authenticate()
//   .then(() => {
//     console.log('Connection has been established successfully.');
//   })
//   .catch(err => {
//     console.error('Unable to connect to the database:', err);
//   });