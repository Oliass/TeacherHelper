import express from "express";
import { addNewExtraCurriculum, addNewExtraCurriculumStudent, addNewGrade, getAllExtracurriculum, getAllStudentGrades, getAllStudents, getAllSubjects, getStudentGrades, loginController, logoutController} from "../controllers/userController.js";

const router = express.Router();

router.post("/grades",addNewGrade);
router.get("/grades/:studentid",getStudentGrades);
router.get("/grades",getAllStudentGrades);

router.get("/students",getAllStudents);
router.get("/subjects",getAllSubjects)

router.get("/extracurriculum",getAllExtracurriculum);
router.post("/extracurriculum",addNewExtraCurriculum);
router.post("/extrasave",addNewExtraCurriculumStudent);


router.post("/login",loginController);
router.post("/logout",logoutController);


export default router;
