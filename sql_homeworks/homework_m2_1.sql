
--1
select * from Employees0

select id, concat(upper(substring(Name,1,1)),LOWER(SUBSTRING(name,2,len(name)))) as result, Gender, salary, DepartmentId  from Employees0

--2

select id, concat(lower(substring(Name,1,len(name)-1)),upper(SUBSTRING(name,len(name),1))) as result, Gender, salary, DepartmentId  from Employees0

--3
CREATE TABLE StringData1 (
   id INT PRIMARY KEY,
   original_string VARCHAR(100)
);
 
INSERT INTO StringData1 (id, original_string) VALUES
(1, 'apple'),
(2, 'banana'),
(3, 'cherry'),
(4, 'date');

select * from StringData1
where len(original_string) = (select max(len(original_string)) from StringData1)