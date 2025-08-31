import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import pool from "./config/db.js";
import initializePassport from "./middleware/passportConfig.js";
import userRoutes from "./routes/userRoutes.js"
import errorHandling from "./middleware/errorHandler.js";
import passport from "passport";
import session from "express-session";
import {createRequire} from "module";
import bcrypt from "bcrypt";
const require = createRequire(import.meta.url);
//import pgSession from "connect-pg-simple";

const pgSession = require('connect-pg-simple')(session);
import cookieParser from "cookie-parser";


dotenv.config();

const app = express();

const port = process.env.PORT_APP || 3001;
//Middlewares
app.use(express.json());
app.use(cors());
app.use(
	session({
		secret: "secret_key",
		resave: true,
		saveUninitialized: true,
		cookie: {
			maxAge: 30 * 24 * 60 * 60 * 1000, // 30 days
			secure: false,
			httpOnly: true,
		},
		store: new pgSession({
			pool: pool,
			tableName: "session",
		}),
	})
);
app.use(passport.initialize());
app.use(passport.session());
app.use(cookieParser());

const nameExists = async (name) => {
	const data = await pool.query("SELECT * FROM users WHERE name=$1", [name]);

	if (data.rowCount === 0) return null;
	return data.rows[0];
};

const userExists = async (id) => {
	const data = await pool.query("SELECT * FROM users WHERE id=$1", [id]);

	if (data.rowCount === 0) return false;
	return data.rows[0];
};
initializePassport(passport,nameExists,userExists);
//Routes
app.use("/api",userRoutes);

//Error handling
app.use(errorHandling);
//Testing postgress connection

app.get("/", async (req,res) =>{
    console.log("Start");
    const result = await pool.query("SELECT current_database()");
    console.log("end");
    res.send(`The database name is: ${result.rows[0].current_database}`);
    const haslo = await bcrypt.hash("teacher",10);
    console.log(haslo);
    console.log(await bcrypt.compare("teacher","$2b$10$aWL/SbMQW54tbXejxhga1.MCWul.ENGrQOfEanRqB8Eri2pVETeYq"));
});

//Server Running
app.listen(port, () => {
    console.log(`Server is running on http:localhost:${port}`)
})