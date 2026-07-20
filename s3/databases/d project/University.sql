set define off;
CREATE TABLE Student 
(
    student_id CHAR(8) NOT NULL,
    sutdent_name VARCHAR2(20) NOT NULL,
    course INTEGER NOT NULL,
    student_email VARCHAR2(100),
    major_id VARCHAR2(10) NOT NULL,
    PRIMARY KEY(student_id)
);

CREATE TABLE Major 
(
    major_id VARCHAR2(10) NOT NULL, 
    major_name VARCHAR2(10) NOT NULL, 
    PRIMARY KEY(major_id)
);
 
ALTER TABLE Student 
ADD CONSTRAINT  Student_Major_FK   
FOREIGN KEY (major_id) 
REFERENCES major(major_id); 

CREATE TABLE Student_Subject 
(
    student_id CHAR(8) NOT NULL, 
    subject_id VARCHAR2(5) NOT NULL
);

ALTER TABLE Student_Subject  
ADD CONSTRAINT  Student_Subject_Sudent_FK  
FOREIGN KEY (student_id)
REFERENCES Student(student_id);


CREATE TABLE Subject
(
    subject_id VARCHAR2(10) NOT NULL, 
    semester INTEGER NOT NULL,
    subject_name VARCHAR2(10),
    PRIMARY KEY (subject_id)
);

ALTER TABLE Student_Subject 
ADD CONSTRAINT  Student_Subject_Subject_FK 
FOREIGN KEY (subject_id) 
REFERENCES Subject(subject_id);

CREATE TABLE Teacher_Subject 
(
    teacher_id VARCHAR2(10CHAR) NOT NULL, 
    subject_id VARCHAR2(10CHAR) NOT NULL
);

ALTER TABLE Teacher_Subject  
ADD CONSTRAINT  Teacher_Subject_Subject_FK  
FOREIGN KEY (subject_id) 
REFERENCES Subject(subject_id);

ALTER TABLE Teacher_Subject  
ADD CONSTRAINT  Teacher_Subject_Teacher_FK 
FOREIGN KEY (teacher_id)
REFERENCES Teacher(teacher_id);

CREATE TABLE Marks 
(
    student_id CHAR(8) NOT NULL ,
    marks NUMBER(4,2),
    subject_id VARCHAR2(10) NOT NULL,
    date_mark DATE,
    teacher_id VARCHAR2(10CHAR) NOT NULL
);

ALTER TABLE Marks  
ADD CONSTRAINT  Mark_Student_FK
FOREIGN KEY (student_id)
REFERENCES Student(student_id);

ALTER TABLE Marks 
ADD CONSTRAINT  Mark_Subject_FK  
FOREIGN KEY (subject_id) 
REFERENCES Subject(subject_id);

ALTER TABLE Marks 
ADD CONSTRAINT  Mark_Teacher_FK   
FOREIGN KEY (teacher_id) 
REFERENCES Teacher(teacher_id);

CREATE TABLE Teacher 
(
    teacher_id VARCHAR2(10CHAR) NOT NULL,
    teacher_name VARCHAR2(100CHAR) NOT NULL,
    degree_id VARCHAR2(10CHAR) NOT NULL,
    phone_number CHAR(10), 
    teacher_email VARCHAR2(100),
    PRIMARY KEY(teacher_id)
);

CREATE TABLE Degree 
(
    degree_id VARCHAR2(10CHAR) NOT NULL,
    deree_name VARCHAR2(10),
    PRIMARY KEY(degree_id)
);

ALTER TABLE Teacher  
ADD CONSTRAINT  Teacher_Degree_FK
FOREIGN KEY (degree_id)
REFERENCES Degree(degree_id);


INSERT INTO MAJOR (major_id, major_name)
VALUES (1, 'KST');

INSERT INTO MAJOR (major_id, major_name)
VALUES (3, 'SIT');

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(1, 'Teodor Todorov', 2, 'theotheboss@gmail.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(2, 'Detelina Dimitrova', 1, 'detelinadeteto@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(3, 'Mariyan Mironov', 4, 'mironkata@outlook.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(4, 'Damyan Stoyanov', 1, 'damstoyanov@gmx.de', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(5, 'Hristina Hristova', 2, 'hrihristova@gmx.de', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(6, 'Dimitur Dimitrov', 3, 'dimdimit@gmx.de', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(7, 'Dimitrina Boyadzieva', 3, 'boyadzhieva@gmail.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(8, 'Stoyan Stoyanov', 1, 'stos@abv.bg', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(9, 'John Snow', 2, 'johnsunny@iwantsummer.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(10, 'John Cena', 2, 'youcantseeme@gmail.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(11, 'The Undertaker', 2, 'seeyou@gmail.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(12, 'Rey Misterio', 1, 'kickyou@gmail.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(13, 'Romeo Ivanov', 1, 'wheresjuliet@gmail.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(14, 'Juliet', 3, 'wheresromeo@gmail.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(15, 'Hriston Hristov', 3, 'hriston53@gmail.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(16, 'Ivancho Ivanov', 3, 'iamivancho@gmail.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(17, 'Grigor Outlander', 4, 'outlander@gmail.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(18, 'Stamat Trendafilov', 4, 'iamivancho@gmail.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(19, 'Geri Nikolova', 4, 'gerinikol@gmail.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(20, 'Alexandra Alexandrov', 4, 'alexxx@gmail.com', 3);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(21, 'Viktor Ivanov', 1, 'vikitoo@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(22, 'Daniel Milev', 1, 'danielkata@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(23, 'Denislav Dinev', 1, 'denkata@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(24, 'Dimitur Iliev', 1, 'dimitraki@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(25, 'Stoyan Hristov', 1, 'tqnatahristov@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(26, 'Dobromira Dobreva', 2, 'dobidobreva@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(27, 'Ivailo Hristov', 2, 'ivailohri@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(28, 'Kiril Kirilov', 2, 'kirilinka@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(29, 'Karina Karinova', 2, 'karito@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(30, 'Kalina Kalinova', 2, 'kalincheto@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(31, 'Liubcho Liubenov', 3, 'liubaka@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(32, 'Raq Rosenova', 3, 'raqrosenova@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(33, 'Rosen Raykov', 3, 'rosenraykov@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(34, 'Gabriela Galinova', 3, 'gabito@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(35, 'Ivan Traykov', 3, 'vankatatray@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(36, 'Tatqna Mileva', 4, 'tatqnka@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(37, 'Iren Koleva', 4, 'renkata@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(38, 'Valq Mihaylova', 4, 'valetu@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(39, 'Toni Stoyanov', 4, 'tonkata@gmail.com', 1);

INSERT INTO STUDENT(student_id, sutdent_name, course, student_email, major_id)
VALUES(40, 'Milen Vasilev', 4, 'kenshy@gmail.com', 1);

INSERT INTO SUBJECT (subject_id, subject_name, semester)
VALUES(1, 'OOP', 3);

INSERT INTO SUBJECT (subject_id, subject_name, semester)
VALUES(2, 'BD', 3);

INSERT INTO SUBJECT (subject_id, subject_name, semester)
VALUES(3, 'OK', 2);

INSERT INTO SUBJECT (subject_id, subject_name, semester)
VALUES(4, 'Math', 2);

INSERT INTO SUBJECT (subject_id, subject_name, semester)
VALUES(5, 'BP', 1);

INSERT INTO SUBJECT (subject_id, subject_name, semester)
VALUES(6, 'JS', 1);

INSERT INTO SUBJECT (subject_id, subject_name, semester)
VALUES(7, 'PHP', 4);

INSERT INTO SUBJECT (subject_id, subject_name, semester)
VALUES(8, 'Sport', 4);

INSERT INTO DEGREE(degree_id, deree_name)
VALUES (1, 'professor');

INSERT INTO DEGREE(degree_id, deree_name)
VALUES (2, 'docent');

INSERT INTO TEACHER (teacher_id, teacher_name, degree_id, phone_number, teacher_email)
VALUES (1, 'Ivan Radomirov', 1, '0899877235', 'teacher1@gmail.com');

INSERT INTO TEACHER (teacher_id, teacher_name, degree_id, phone_number, teacher_email)
VALUES (2, 'Stoqn Dobromirov', 1, '0846425948', 'teacher2@gmail.com');

INSERT INTO TEACHER (teacher_id, teacher_name, degree_id, phone_number, teacher_email)
VALUES (3, 'Danail Dimitrov', 1, '0899874746', 'teacher3@gmail.com');

INSERT INTO TEACHER (teacher_id, teacher_name, degree_id, phone_number, teacher_email)
VALUES (4, 'Galina Gancheva', 2, '0885694344', 'teacher4@gmail.com');

INSERT INTO TEACHER (teacher_id, teacher_name, degree_id, phone_number, teacher_email)
VALUES (5, 'Dimitrina Todorova', 2, '0899543621', 'teacher5@gmail.com');

INSERT INTO TEACHER (teacher_id, teacher_name, degree_id, phone_number, teacher_email)
VALUES (6, 'Delyana Stoyanova', 2, '0883272353', 'teacher6@gmail.com');

INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(8,5); 
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(8,6);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(12,5);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(12,6);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(13,5);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(13,6);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(1,3);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(5,3);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(9,3);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(10,3);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(11,3);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(5,3);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(6,1);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(7,1);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(14,1);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(15,1);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(16,1);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(3,7);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(17,7);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(18,7);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(19,7);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(20,7);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(2,6);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(4,6);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(21,6);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(22,6);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(23,6);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(24,6);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(25,6);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(26,4);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(27,4);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(28,4);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(29,4);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(30,4);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(31,2);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(32,2);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(33,2);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(34,2);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(35,2);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(36,8);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(37,8);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(38,8);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(39,8);
INSERT INTO STUDENT_SUBJECT (student_id, subject_id)
VALUES(40,8);

INSERT INTO TEACHER_SUBJECT (teacher_id, subject_id)
VALUES(1,5);
INSERT INTO TEACHER_SUBJECT (teacher_id, subject_id)
VALUES(1,4);
INSERT INTO TEACHER_SUBJECT (teacher_id, subject_id)
VALUES(2,3);
INSERT INTO TEACHER_SUBJECT (teacher_id, subject_id)
VALUES(3,6);
INSERT INTO TEACHER_SUBJECT (teacher_id, subject_id)
VALUES(4,2);
INSERT INTO TEACHER_SUBJECT (teacher_id, subject_id)
VALUES(5,1);
INSERT INTO TEACHER_SUBJECT (teacher_id, subject_id)
VALUES(5,8);
INSERT INTO TEACHER_SUBJECT (teacher_id, subject_id)
VALUES(6,7);

INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (6,3,1,SYSDATE,5);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (7,4.50,1,SYSDATE,5);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (14,4,1, SYSDATE,5);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (15,5,1, SYSDATE,5);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (16,5.40,1,SYSDATE,5);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (31,2,2,SYSDATE,4);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (32,3,2, SYSDATE,4);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (33,3.50,2,SYSDATE,4);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (34,4,2,SYSDATE,4);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (35,5.50,2,SYSDATE,4);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (1,4.80,3,SYSDATE,2);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (5,5,3,SYSDATE,2);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (9,5.20,3,SYSDATE,2);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (10,5.40,3,SYSDATE,2);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (11,6,3,SYSDATE,2);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (26,4,4,SYSDATE,1);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (27,3,4,SYSDATE,1);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (28,3.50,4,SYSDATE,1);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (29,5,4,SYSDATE,1);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (30,5.20,4,SYSDATE,1);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (8,4,5,SYSDATE,1);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (12,5.60,5,SYSDATE,1);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (13,5.49,5,SYSDATE,1);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (2,2,6,SYSDATE,3);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (4,4,6,SYSDATE,3);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (21,3.30,6,SYSDATE,3);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (22,4,6,SYSDATE,3);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (23,5.30,6,SYSDATE,3);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (24,5.60,6,SYSDATE,3);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (25,6,6,SYSDATE,3);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (3,4.30,7,SYSDATE,6);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (17,5.60,7,SYSDATE,6);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (18,4.70,7,SYSDATE,6);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (19,3.50,7,SYSDATE,6);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (20,5,7,SYSDATE,6);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (3,4,7,SYSDATE,6);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (36,5,8,SYSDATE,5);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (37,4,8,SYSDATE,5);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (38,6,8,SYSDATE,5);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (39,4,8,SYSDATE,5);
INSERT INTO MARKS (student_id, marks, subject_id, date_mark, teacher_id)
VALUES (40,5.70,8,SYSDATE,5);

SELECT s.student_id, m.marks, su.subject_name
FROM marks m 
JOIN student s ON m.student_id = s.student_id 
JOIN subject su ON m.subject_id = su.subject_id
WHERE s.student_id = &student_id;

SELECT s.student_id, m.marks, su.subject_name
FROM marks m 
JOIN student s ON m.student_id = s.student_id 
JOIN subject su ON m.subject_id = su.subject_id
WHERE su.subject_name = '&subject_name';

SELECT s.sutdent_name AS name, s.course, s.student_email, m.major_name, ma.marks,
su.subject_name, su.semester, ma.date_mark, d.deree_name, t.teacher_name
FROM student s
JOIN major m ON s.major_id = m.major_id
JOIN marks ma ON s.student_id = ma.student_id
JOIN student_subject ss ON s.student_id = ss.student_id
JOIN subject su ON ss.subject_id = su.subject_id
JOIN teacher_subject ts ON ma.teacher_id = ts.teacher_id
JOIN teacher t ON ts.teacher_id = t.teacher_id
JOIN degree d ON t.degree_id = d.degree_id
WHERE s.student_id = &student_id
GROUP BY su.subject_name, s.sutdent_name, s.course, s.student_email, m.major_name, 
ma.marks, su.semester, ma.date_mark, d.deree_name, t.teacher_name;

SELECT s.course, ROUND(AVG(ma.marks),2) AS AVG , m.major_name
FROM student s 
JOIN major m ON s.major_id = m.major_id 
JOIN marks ma ON s.student_id = ma.student_id 
WHERE m.major_name = '&major_name'
-- major_id = 1 -> KST  AND major_id = 3 -> SIT 
GROUP BY s.course, m.major_name
HAVING ROUND(AVG(ma.marks),2) > 2
ORDER BY AVG DESC;

SELECT s.subject_name, ROUND(AVG(m.marks),2) AS AVG 
FROM subject s
JOIN marks m ON s.subject_id = m.subject_id
GROUP BY s.subject_name;
