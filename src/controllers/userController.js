import passport from "passport";
import bcrypt from "bcrypt";
import { addNewExtraCurriculumService, addNewExtraCurriculumStudentService, addNewGradeService, getAllExtracurriculumService, getAllStudentsGradesService, getAllStudentsService, getAllSubjectsService, getStudentGradesService} from "../models/userModel.js";

const handleResponse = (res, status, message, data = null) => {
    res.status(status).json({
        status,
        message,
        data,
    });
};

export const addNewGrade = async (req, res, next) => {
    const {grade, weight, subject,student,teacher,semester} = req.body;
    try{
        const newUser = await addNewGradeService(grade,weight,subject,student,teacher,semester);
        res.status(201).json(newUser)
    }   catch(err){
        next(err);
    }
}

export const addNewExtraCurriculum = async (req, res, next) => {
    const {title,description,teacher} = req.body;
    try{
        const newUser = await addNewExtraCurriculumService(title,description,teacher);
        res.status(201).json(newUser)
    }   catch(err){
        next(err);
    }
}

export const addNewExtraCurriculumStudent = async (req, res, next) => {
    const {extraid,student} = req.body;
    try{
        const newUser = await addNewExtraCurriculumStudentService(extraid,student);
        res.status(201).json(newUser)
    }   catch(err){
        next(err);
    }
}


export const getAllStudentGrades = async (req, res, next) => {
try{
        const users = await getAllStudentsGradesService();
        res.status(200).json(users);
    } catch(err){
        next(err);
    }
};

export const getAllStudents = async (req, res, next) => {
try{
        const users = await getAllStudentsService();
        res.status(200).json(users);
    } catch(err){
        next(err);
    }
};

export const getAllExtracurriculum = async (req, res, next) => {
try{
        const users = await getAllExtracurriculumService();
        res.status(200).json(users);
    } catch(err){
        next(err);
    }
};

export const getAllSubjects = async (req, res, next) => {
try{
        const users = await getAllSubjectsService();
        res.status(200).json(users);
    } catch(err){
        next(err);
    }
};

export const getStudentGrades = async (req, res, next) => {
    try{
        const user = await getStudentGradesService(req.params.studentid);
        if (!user) return res.status(200).json(null);
        res.status(200).json(user);
    } catch(err){
        next(err);
    }
};

export const loginController = (req, res, next) => {
	passport.authenticate("local", (err, user, info) => {
		if (err) {
			console.error("ERROR");
			throw err;
		}
		if (!user) {
			console.error("USER NOT FOUND");
			res.status(400).json({ message: "User does not exist!" });
		} else {
			req.logIn(user, (err) => {
				if (err) throw err;
				req.session.user = user;
				res.status(200).json(user);
				return;
			});
		}
	})(req, res, next);
};

export const logoutController = (req, res, next) => {
	req.logout((err) => {
		if (err) {
			console.error("LOGOUT ERROR");
			throw err;
		}
		res.status(200).send();
	});
};