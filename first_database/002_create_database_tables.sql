DROP TABLE courses CASCADE ;

CREATE TABLE courses(
    id text PRIMARY KEY,
    name text,
    hours integer
);

INSERT INTO courses(id, name, hours)
VALUES ('course_1', 'Database' , 30),
       ('course_2', 'Computer', 60);

DROP TABLE tutors CASCADE ;

CREATE TABLE tutors(
    id integer PRIMARY KEY,
    name text
);

INSERT INTO tutors(id, name)
VALUES (1, 'Ivanov P.V.'),
       (2, 'Petrov G.R.'),
       (4, 'Zinaidov E.T.');


DROP TABLE students CASCADE ;

CREATE TABLE students(
    id integer PRIMARY KEY,
    name text,
    start_year integer,
    tutor_id integer REFERENCES tutors(id)
);

INSERT INTO students(id, name, start_year, tutor_id)
VALUES (1, 'Anna', 2014, 1),
       (2, 'Victor', 2014, 2),
       (3, 'Nina', 2015, NULL);



DROP TABLE exams CASCADE;

CREATE TABLE exams(
    student_id integer REFERENCES students(id),
    course_id text REFERENCES courses(id),
    score integer,
    CONSTRAINT pk PRIMARY KEY (student_id, course_id)
);

INSERT INTO exams(student_id, course_id, score)
VALUES (1, 'course_1', 5),
       (2, 'course_1', 5),
       (1, 'course_2', 5),
       (3, 'course_2', 4);

