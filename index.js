const express = require('express'),
    app = express(),
    bodyparser = require('body-parser');
require('express-async-errors')
const db = require('./db'),
userRoutes  = require('./controllers/usersController'),
    employeeRoutes = require('./controllers/employeeController')

//middleware
    app.use(bodyparser.json()) 
    app.use('/api/users', userRoutes)
app.use('/api/employees', employeeRoutes)
app.use((err, req, res, next)=> {
    console.log(err)
})
//first make sure the connection is successfull
//then start the server

db.query("SELECT 1")
    .then(data => console.log('bd connection succeeded'),
    app.listen(3000,
    () => console.log('server has started at 3000'))
)
    .catch(err => console.log('db connection failed; \n'))

