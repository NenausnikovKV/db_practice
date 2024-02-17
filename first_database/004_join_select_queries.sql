-- Cartesian product of two matrix
SELECT students.name, exams.score, exams.course_id FROM students, exams;

-- Show all student, their courses and their scores
SELECT students.id, students.name, courses.name, exams.score
FROM students
    JOIN exams on students.id = exams.student_id
    JOIN courses on exams.course_id = courses.id
ORDER BY student_id;

-- Show students
-- Like Inner join, just us operation "where" instead of "join ... on"
SELECT students.id, students.name, courses.name, exams.score
FROM students, exams
    JOIN courses on exams.course_id = courses.id
    WHERE students.id = exams.student_id
ORDER BY students.id;

-- Show all students, their course scores if they are exist
SELECT students.id, students.name, courses.name, exams.score
FROM students
    Left JOIN exams on students.id = exams.student_id
    JOIN courses on exams.course_id = courses.id
ORDER BY student_id;

-- student scores for course_2
SELECT students.name, exams.score
FROM students JOIN exams
    on students.id = exams.student_id AND exams.course_id = 'course_2';

-- student scores for course_2 for all students
SELECT students.name, exams.score
FROM students LEFT JOIN exams
    on students.id = exams.student_id AND exams.course_id = 'course_2';

-- students who have tutors and his tutor
SELECT students.name, tutors.name
FROM students JOIN tutors
    on students.tutor_id = tutors.id
ORDER BY tutors.id;

-- all student and their tutors if they are exist
-- Use "right join" for examples (in real project i would prefer left join)
SELECT students.name, tutors.name
FROM tutors RIGHT JOIN students
    on students.tutor_id = tutors.id
ORDER BY tutors.id;