import pool from "../config/db.js";

export const getAllStudentsGradesService = async () => {
 const result = await pool.query ("select concat(students.firstname,' ', students.lastname) Student, subject, beginyear, classletter, STRING_AGG(grade::text,' ') as grades, cast(sum (grade*weight)/sum(weight) as decimal(8,2)) Average from grades join students on students.studentnumber = grades.student group by (students.firstname, students.lastname),subject,beginyear,classletter order by subject asc")
 return result.rows;
};


export const addNewGradeService = async (grade,weight,subject,student,teacher,semester) => {
    const result = await pool.query("insert into grades(grade,weight,subject,student,teacher,semester) values($1,$2,$3,$4,$5,$6) RETURNING *;",[grade,weight,subject,student,teacher,semester]);
    return result.rows[0];
}

export const addNewExtraCurriculumService = async (title,description,teacher) => {
    const result = await pool.query("insert into Extracurriculum(title,description,teacher) Values ($1,$2,$3) RETURNING *;",[title,description,teacher]);
    return result.rows[0];
}

export const addNewExtraCurriculumStudentService = async (extraId,student) => {
    const result = await pool.query("insert into Extracurriculum_admissions(extraid,student) Values ($1,$2) RETURNING *;",[extraId,student]);
    return result.rows[0];
}


export const getStudentGradesService = async (id) => {
    const result = await pool.query("select subject , STRING_AGG(grade::text,' ') as grades,cast(sum (grade*weight)/sum(weight) as decimal(8,2)) Average from grades where student=$1 group by subject",[id]);
    return result.rows;
}


export const getAllStudentsService = async () => {
    const result = await pool.query("select students.studentnumber, concat(students.firstname,' ', students.lastname) Student from students");
    return result.rows;
}

export const getAllExtracurriculumService = async () => {
    const result = await pool.query("select extraid,title,description, firstname, lastname from extracurriculum join teacher on extracurriculum.teacher = teacher.teachernumber");
    return result.rows;
}

export const getAllSubjectsService = async () => {
    const result = await pool.query("select subject from subjects");
    return result.rows;
}