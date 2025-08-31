import pkg from "pg";
const { Pool } = pkg;

import dotenv from "dotenv";
dotenv.config();

const pool = new Pool({
    user:process.env.USER_DB,
    host:process.env.HOST_DB,
    database:process.env.DATABASE,
    password:process.env.PASSWORD,
    port:process.env.PORT_DB
});

pool.on("connect",() =>{
    console.log("Connection pool established with the database");
});

export default pool;