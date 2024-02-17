-- aggregate operation
SELECT count(*) as exam_count,
       count(Distinct student_id) as student_count,
       avg(score) as average_score
FROM exams;

-- aggregate by course id
SELECT course_id,
       count(*) as course_count,
       count(DISTINCT student_id) as student_count,
       avg(score) as average_score
FROM exams
GROUP BY course_id;

-- names of students with more than one excellent exam score
SELECT students.name
FROM students JOIN exams on students.id = exams.student_id
WHERE exams.score = 5
Group By students.name
HAVING count(*) > 1;
