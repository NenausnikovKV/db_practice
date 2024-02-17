-- students and their scores for the course_2
-- subquery must return single row nad single column response.
-- table exams primary key constraint is set of student_id and course_id
SELECT students.name,
       (SELECT exams.score FROM exams
                     WHERE exams.student_id = students.id
                       AND exams.course_id='course_2')
FROM students
ORDER BY students.name;

-- students and their tutors
-- for each student find his tutor and show tutor name. show null tutor name if student does not have him.
SELECT students.name,
       (SELECT tutors.name FROM tutors
                           WHERE students.tutor_id=tutors.id)
FROM students
ORDER BY students.name;

-- exams which has been passed by student admitted after 2014
SELECT * FROM exams
WHERE (
        SELECT start_year
        FROM students
        WHERE students.id = exams.student_id) > 2014;

-- student having store for given course
SELECT DISTINCT students.id, students.name, start_year FROM students
    JOIN exams on students.id = exams.student_id
    JOIN courses on exams.course_id = courses.id
        WHERE exams.student_id IN (SELECT exams.student_id
                                   FROM exams
                                   WHERE exams.course_id = 'course_2');

-- student who has not any scores equal 5
SELECT students.id, students.name FROM students
WHERE students.id NOT IN (
    SELECT exams.student_id FROM exams WHERE exams.score = 5);

-- student names and their score for database courses
SELECT s.name, exams.score FROM students s
JOIN exams ON s.id = exams.student_id
WHERE exams.course_id = (SELECT courses.id FROM courses WHERE courses.name='Database')
ORDER BY s.name, exams.score DESC ;

