import LocalStrategy from "passport-local";
import bcrypt from "bcrypt";

function initializePassport(passport, getUserByName, getUserById) {
	const authenticate = async (name, password, done) => {
		const user = await getUserByName(name);
		if (user == null) {
			return done(null, false, { message: "Incorrect name!" });
		}
		try {
			if (await bcrypt.compare(password, user.password)) {
				return done(null, user);
			} else {
				return done(null, false, { message: "Incorrect password" });
			}
		} catch (err) {
			return done(err);
		}
	};

	passport.use(
		new LocalStrategy(
			{ usernameField: "name", passwordField: "password" },
			authenticate
		)
	);

	passport.serializeUser((user, done) => {
		done(null, user.id);
	});

	passport.deserializeUser(async (id, done) => {
		const user = await getUserById(id);
		return done(null, user);
	});
}

export default initializePassport;