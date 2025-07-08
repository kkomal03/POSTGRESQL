select * from course;
select * from student;
--------------------------------------------------------------------------------------------------------------
-->>> Count the number of students enrolled in each course.
select C.course_name , count(S.student_name) from student as s inner join course as c 
on
 s.course_id = c.course_id GROUP BY C.COURSE_NAME;
-------------------------------------------------------------------------------------------------------------
-->>>Calculate the total sum of grades for all students in each course.
select C.COURSE_NAME,SUM(S.GRADE) from student as s inner join course as c 
on
 s.course_id = c.course_id GROUP BY C.COURSE_NAME;


------------------------------------------------------------------------------------------------------------
-->>>Find the average grade of students in each course.

select C.COURSE_NAME,AVG(S.GRADE) from student as s inner join course as c 
on
 s.course_id = c.course_id GROUP BY C.COURSE_NAME;


------------------------------------------------------------------------------------------------------------
-->>>Retrieve the earliest enrollment date for students in each course.
select C.COURSE_NAME,MIN(S.ENROLLMENT_DATE) from student as s inner join course as c 
on
 s.course_id = c.course_id GROUP BY C.COURSE_NAME;
------------------------------------------------------------------------------------------------------------
-->>>Find the highest grade in each course.
select C.COURSE_NAME,MAX(S.GRADE) from student as s inner join course as c 
on
 s.course_id = c.course_id GROUP BY C.COURSE_NAME;


------------------------------------------------------------------------------------------------------------
-->>>Retrieve the earliest enrollment date for each course.
SELECT COURSE_NAME , MIN(START_DATE)
FROM 
COURSE GROUP BY COURSE_NAME;

------------------------------------------------------------------------------------------------------------
-->>>Find the latest enrollment date for each course.

SELECT COURSE_NAME , MAX(START_DATE)
FROM 
COURSE GROUP BY COURSE_NAME;

------------------------------------------------------------------------------------------------------------
-->>>Find courses with more than ten students enrolled.
SELECT 
  c.course_name,
  COUNT(s.student_id)
FROM 
  course AS c
JOIN 
  student AS S ON c.course_id = s.course_id
GROUP BY 
  c.course_name
HAVING 
  COUNT(s.student_id) > 10;




------------------------------------------------------------------------------------------------------------
-->>>Count the number of students in each course, displaying course names.
SELECT 
  c.course_name,
  COUNT(s.student_id) 
FROM 
  course c
LEFT JOIN 
  student s ON c.course_id = s.course_id
GROUP BY 
  c.course_name;

------------------------------------------------------------------------------------------------------------
-->>>Calculate the total grades for each course, displaying course names.
SELECT 
  c.course_name,
  SUM(s.grade)
FROM 
  course c
JOIN 
  student s ON c.course_id = s.course_id
GROUP BY 
  c.course_name;


------------------------------------------------------------------------------------------------------------
-->>>Find the average grade of students in each course, displaying course names.
select C.COURSE_NAME,AVG(S.GRADE) from student as s inner join course as c 
on
 s.course_id = c.course_id GROUP BY C.COURSE_NAME;
------------------------------------------------------------------------------------------------------------
-->>>Round the average grade of students in each course to two decimal places.
SELECT 
  c.course_name,
  ROUND(AVG(s.grade), 2)
FROM 
  course c
JOIN 
  student s ON c.course_id = s.course_id
GROUP BY 
  c.course_name;
