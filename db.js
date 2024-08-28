require('dotenv').config();
const mysql = require('mysql2/promise')

const mysqlPool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: '',
    database:process.env.DB_DATABASE

})



module.exports = mysqlPool


