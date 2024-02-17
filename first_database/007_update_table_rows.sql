UPDATE courses
SET  hours = hours * 2
WHERE courses.id = 'course_1';

SELECT * from courses
LIMIT 10;


SELECT * FROM exams
LIMIT 10;

DELETE from exams where exams.score != 5;

INSERT INTO exams (student_id, course_id, score)
VALUES (3, 'course_2', 4);
