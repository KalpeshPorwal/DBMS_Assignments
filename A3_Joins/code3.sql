select * from Employee;
+--------+---------+---------+------------+-------------+---------+------------+
| Emp_id | Dept_id | fname   | lname      | designation | salary  | joinDate   |
+--------+---------+---------+------------+-------------+---------+------------+
|      1 |       1 | Karan   | Lahoti     | SDE1        | 1200000 | 2006-06-14 |
|      2 |       1 | Mohit   | Mohite     | Intern      |  450000 | 2005-04-11 |
|      3 |       2 | Arun    | Patil      | Intern      |    2200 | 2007-01-12 |
|      4 |       2 | Balram  | Ingle      | SDE1        |  220000 | 2003-01-12 |
|      5 |       3 | param   | Dargad     | Intern      |    9900 | 2008-01-12 |
|      6 |       1 | Harman  | Sharma     | SDE         |  140000 | 2007-08-09 |
|      7 |       3 | Gaurav  | Maheshwari | SDE         |  990000 | 2006-02-21 |
|      8 |       1 | Rohit   | Sharma     | Intern      |  700000 | 2004-06-22 |
|      9 |       3 | Aditya  | Bhutada    | SDE         |    8800 | 2006-11-05 |
|     10 |       2 | payal   | rohatgi    | SDE         |  132000 | 2005-11-04 |
|     11 |       1 | Rohit   | Shetty     | Intern      |  700000 | 2004-06-22 |
|     12 |       1 | Jimmy   | Sharma     | SDE         |  140000 | 2007-08-09 |
|     13 |       1 | Tanishq | Mohite     | Intern      |  450000 | 2005-04-11 |
|     14 |       1 | Karan   | Kale       | SDE1        | 1200000 | 2006-06-14 |
|     15 |       1 | Shiv    | Shambhu    | SDE         |  500000 | 2006-03-06 |
|     16 |       1 | Ram     | Mandhane   | SDE1        |  450000 | 2009-11-30 |
+--------+---------+---------+------------+-------------+---------+------------+
select * from Dept;
+---------+--------+------------+
| Dept_id | d_name | d_location |
+---------+--------+------------+
|       1 | comp   | mumbai     |
|       2 | it     | pune       |
|       3 | entc   | nagpur     |
+---------+--------+------------+
select * from Project;
+---------+---------+---------------------+------------+--------+--------+
| Dept_id | Proj_id | p_name              | p_location | p_cost | p_year |
+---------+---------+---------------------+------------+--------+--------+
|       1 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       3 |       2 | Result Management   | pune       | 300000 |   2006 |
|       1 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       2 |       4 | Result Analysis     | mumbai     | 100000 |   2007 |
|       3 |       5 | Heart Disease       | pune       | 250000 |   2005 |
+---------+---------+---------------------+------------+--------+--------+
select * from EmpAndDept;
+---------+--------+---------+------------+-------------+---------+------------+--------+------------+
| Dept_id | Emp_id | fname   | lname      | designation | salary  | joinDate   | d_name | d_location |
+---------+--------+---------+------------+-------------+---------+------------+--------+------------+
|       1 |      1 | Karan   | Lahoti     | SDE1        | 1200000 | 2006-06-14 | comp   | mumbai     |
|       1 |      2 | Mohit   | Mohite     | Intern      |  450000 | 2005-04-11 | comp   | mumbai     |
|       1 |      6 | Harman  | Sharma     | SDE         |  140000 | 2007-08-09 | comp   | mumbai     |
|       1 |      8 | Rohit   | Sharma     | Intern      |  700000 | 2004-06-22 | comp   | mumbai     |
|       1 |     11 | Rohit   | Shetty     | Intern      |  700000 | 2004-06-22 | comp   | mumbai     |
|       1 |     12 | Jimmy   | Sharma     | SDE         |  140000 | 2007-08-09 | comp   | mumbai     |
|       1 |     13 | Tanishq | Mohite     | Intern      |  450000 | 2005-04-11 | comp   | mumbai     |
|       1 |     14 | Karan   | Kale       | SDE1        | 1200000 | 2006-06-14 | comp   | mumbai     |
|       1 |     15 | Shiv    | Shambhu    | SDE         |  500000 | 2006-03-06 | comp   | mumbai     |
|       1 |     16 | Ram     | Mandhane   | SDE1        |  450000 | 2009-11-30 | comp   | mumbai     |
|       2 |      3 | Arun    | Patil      | Intern      |    2200 | 2007-01-12 | it     | pune       |
|       2 |      4 | Balram  | Ingle      | SDE1        |  220000 | 2003-01-12 | it     | pune       |
|       2 |     10 | payal   | rohatgi    | SDE         |  132000 | 2005-11-04 | it     | pune       |
|       3 |      5 | param   | Dargad     | Intern      |    9900 | 2008-01-12 | entc   | nagpur     |
|       3 |      7 | Gaurav  | Maheshwari | SDE         |  990000 | 2006-02-21 | entc   | nagpur     |
|       3 |      9 | Aditya  | Bhutada    | SDE         |    8800 | 2006-11-05 | entc   | nagpur     |
+---------+--------+---------+------------+-------------+---------+------------+--------+------------+
show tables;
+----------------------+
| Tables_in_te31456db  |
+----------------------+
| Dept                 |
| DeptAndProject       |
| EmpAndDept           |
| EmpAndDeptAndProject |
| Employee             |
| Project              |
| SalaryGreaterThan10K |
+----------------------+
select * from DeptAndProject;
+---------+--------+------------+---------+---------------------+------------+--------+--------+
| Dept_id | d_name | d_location | Proj_id | p_name              | p_location | p_cost | p_year |
+---------+--------+------------+---------+---------------------+------------+--------+--------+
|       1 | comp   | mumbai     |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       3 | entc   | nagpur     |       2 | Result Management   | pune       | 300000 |   2006 |
|       1 | comp   | mumbai     |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       2 | it     | pune       |       4 | Result Analysis     | mumbai     | 100000 |   2007 |
|       3 | entc   | nagpur     |       5 | Heart Disease       | pune       | 250000 |   2005 |
+---------+--------+------------+---------+---------------------+------------+--------+--------+

select * from EmpAndDeptAndProject;
+---------+--------+------------+---------+---------------------+------------+--------+--------+--------+---------+------------+-------------+---------+------------+
| Dept_id | d_name | d_location | Proj_id | p_name              | p_location | p_cost | p_year | Emp_id | fname   | lname      | designation | salary  | joinDate   |
+---------+--------+------------+---------+---------------------+------------+--------+--------+--------+---------+------------+-------------+---------+------------+
|       1 | comp   | mumbai     |       1 | Website using React | Hyderabad  |  12000 |   2020 |      1 | Karan   | Lahoti     | SDE1        | 1200000 | 2006-06-14 |
|       1 | comp   | mumbai     |       1 | Website using React | Hyderabad  |  12000 |   2020 |      2 | Mohit   | Mohite     | Intern      |  450000 | 2005-04-11 |
|       1 | comp   | mumbai     |       1 | Website using React | Hyderabad  |  12000 |   2020 |      6 | Harman  | Sharma     | SDE         |  140000 | 2007-08-09 |
|       1 | comp   | mumbai     |       1 | Website using React | Hyderabad  |  12000 |   2020 |      8 | Rohit   | Sharma     | Intern      |  700000 | 2004-06-22 |
|       1 | comp   | mumbai     |       1 | Website using React | Hyderabad  |  12000 |   2020 |     11 | Rohit   | Shetty     | Intern      |  700000 | 2004-06-22 |
|       1 | comp   | mumbai     |       1 | Website using React | Hyderabad  |  12000 |   2020 |     12 | Jimmy   | Sharma     | SDE         |  140000 | 2007-08-09 |
|       1 | comp   | mumbai     |       1 | Website using React | Hyderabad  |  12000 |   2020 |     13 | Tanishq | Mohite     | Intern      |  450000 | 2005-04-11 |
|       1 | comp   | mumbai     |       1 | Website using React | Hyderabad  |  12000 |   2020 |     14 | Karan   | Kale       | SDE1        | 1200000 | 2006-06-14 |
|       1 | comp   | mumbai     |       1 | Website using React | Hyderabad  |  12000 |   2020 |     15 | Shiv    | Shambhu    | SDE         |  500000 | 2006-03-06 |
|       1 | comp   | mumbai     |       1 | Website using React | Hyderabad  |  12000 |   2020 |     16 | Ram     | Mandhane   | SDE1        |  450000 | 2009-11-30 |
|       3 | entc   | nagpur     |       2 | Result Management   | pune       | 300000 |   2006 |      5 | param   | Dargad     | Intern      |    9900 | 2008-01-12 |
|       3 | entc   | nagpur     |       2 | Result Management   | pune       | 300000 |   2006 |      7 | Gaurav  | Maheshwari | SDE         |  990000 | 2006-02-21 |
|       3 | entc   | nagpur     |       2 | Result Management   | pune       | 300000 |   2006 |      9 | Aditya  | Bhutada    | SDE         |    8800 | 2006-11-05 |
|       1 | comp   | mumbai     |       3 | App Dev             | Hyderabad  |  10000 |   2015 |      1 | Karan   | Lahoti     | SDE1        | 1200000 | 2006-06-14 |
|       1 | comp   | mumbai     |       3 | App Dev             | Hyderabad  |  10000 |   2015 |      2 | Mohit   | Mohite     | Intern      |  450000 | 2005-04-11 |
|       1 | comp   | mumbai     |       3 | App Dev             | Hyderabad  |  10000 |   2015 |      6 | Harman  | Sharma     | SDE         |  140000 | 2007-08-09 |
|       1 | comp   | mumbai     |       3 | App Dev             | Hyderabad  |  10000 |   2015 |      8 | Rohit   | Sharma     | Intern      |  700000 | 2004-06-22 |
|       1 | comp   | mumbai     |       3 | App Dev             | Hyderabad  |  10000 |   2015 |     11 | Rohit   | Shetty     | Intern      |  700000 | 2004-06-22 |
|       1 | comp   | mumbai     |       3 | App Dev             | Hyderabad  |  10000 |   2015 |     12 | Jimmy   | Sharma     | SDE         |  140000 | 2007-08-09 |
|       1 | comp   | mumbai     |       3 | App Dev             | Hyderabad  |  10000 |   2015 |     13 | Tanishq | Mohite     | Intern      |  450000 | 2005-04-11 |
|       1 | comp   | mumbai     |       3 | App Dev             | Hyderabad  |  10000 |   2015 |     14 | Karan   | Kale       | SDE1        | 1200000 | 2006-06-14 |
|       1 | comp   | mumbai     |       3 | App Dev             | Hyderabad  |  10000 |   2015 |     15 | Shiv    | Shambhu    | SDE         |  500000 | 2006-03-06 |
|       1 | comp   | mumbai     |       3 | App Dev             | Hyderabad  |  10000 |   2015 |     16 | Ram     | Mandhane   | SDE1        |  450000 | 2009-11-30 |
|       2 | it     | pune       |       4 | Result Analysis     | mumbai     | 100000 |   2007 |      3 | Arun    | Patil      | Intern      |    2200 | 2007-01-12 |
|       2 | it     | pune       |       4 | Result Analysis     | mumbai     | 100000 |   2007 |      4 | Balram  | Ingle      | SDE1        |  220000 | 2003-01-12 |
|       2 | it     | pune       |       4 | Result Analysis     | mumbai     | 100000 |   2007 |     10 | payal   | rohatgi    | SDE         |  132000 | 2005-11-04 |
|       3 | entc   | nagpur     |       5 | Heart Disease       | pune       | 250000 |   2005 |      5 | param   | Dargad     | Intern      |    9900 | 2008-01-12 |
|       3 | entc   | nagpur     |       5 | Heart Disease       | pune       | 250000 |   2005 |      7 | Gaurav  | Maheshwari | SDE         |  990000 | 2006-02-21 |
|       3 | entc   | nagpur     |       5 | Heart Disease       | pune       | 250000 |   2005 |      9 | Aditya  | Bhutada    | SDE         |    8800 | 2006-11-05 |
+---------+--------+------------+---------+---------------------+------------+--------+--------+--------+---------+------------+-------------+---------+------------+

create view EmpAndProject as (select * from Employee NATURAL JOIN Project);
select * from EmpAndProject;
+---------+--------+---------+------------+-------------+---------+------------+---------+---------------------+------------+--------+--------+
| Dept_id | Emp_id | fname   | lname      | designation | salary  | joinDate   | Proj_id | p_name              | p_location | p_cost | p_year |
+---------+--------+---------+------------+-------------+---------+------------+---------+---------------------+------------+--------+--------+
|       1 |      1 | Karan   | Lahoti     | SDE1        | 1200000 | 2006-06-14 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |      2 | Mohit   | Mohite     | Intern      |  450000 | 2005-04-11 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |      6 | Harman  | Sharma     | SDE         |  140000 | 2007-08-09 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |      8 | Rohit   | Sharma     | Intern      |  700000 | 2004-06-22 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |     11 | Rohit   | Shetty     | Intern      |  700000 | 2004-06-22 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |     12 | Jimmy   | Sharma     | SDE         |  140000 | 2007-08-09 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |     13 | Tanishq | Mohite     | Intern      |  450000 | 2005-04-11 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |     14 | Karan   | Kale       | SDE1        | 1200000 | 2006-06-14 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |     15 | Shiv    | Shambhu    | SDE         |  500000 | 2006-03-06 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |     16 | Ram     | Mandhane   | SDE1        |  450000 | 2009-11-30 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       3 |      5 | param   | Dargad     | Intern      |    9900 | 2008-01-12 |       2 | Result Management   | pune       | 300000 |   2006 |
|       3 |      7 | Gaurav  | Maheshwari | SDE         |  990000 | 2006-02-21 |       2 | Result Management   | pune       | 300000 |   2006 |
|       3 |      9 | Aditya  | Bhutada    | SDE         |    8800 | 2006-11-05 |       2 | Result Management   | pune       | 300000 |   2006 |
|       1 |      1 | Karan   | Lahoti     | SDE1        | 1200000 | 2006-06-14 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |      2 | Mohit   | Mohite     | Intern      |  450000 | 2005-04-11 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |      6 | Harman  | Sharma     | SDE         |  140000 | 2007-08-09 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |      8 | Rohit   | Sharma     | Intern      |  700000 | 2004-06-22 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |     11 | Rohit   | Shetty     | Intern      |  700000 | 2004-06-22 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |     12 | Jimmy   | Sharma     | SDE         |  140000 | 2007-08-09 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |     13 | Tanishq | Mohite     | Intern      |  450000 | 2005-04-11 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |     14 | Karan   | Kale       | SDE1        | 1200000 | 2006-06-14 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |     15 | Shiv    | Shambhu    | SDE         |  500000 | 2006-03-06 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |     16 | Ram     | Mandhane   | SDE1        |  450000 | 2009-11-30 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       2 |      3 | Arun    | Patil      | Intern      |    2200 | 2007-01-12 |       4 | Result Analysis     | mumbai     | 100000 |   2007 |
|       2 |      4 | Balram  | Ingle      | SDE1        |  220000 | 2003-01-12 |       4 | Result Analysis     | mumbai     | 100000 |   2007 |
|       2 |     10 | payal   | rohatgi    | SDE         |  132000 | 2005-11-04 |       4 | Result Analysis     | mumbai     | 100000 |   2007 |
|       3 |      5 | param   | Dargad     | Intern      |    9900 | 2008-01-12 |       5 | Heart Disease       | pune       | 250000 |   2005 |
|       3 |      7 | Gaurav  | Maheshwari | SDE         |  990000 | 2006-02-21 |       5 | Heart Disease       | pune       | 250000 |   2005 |
|       3 |      9 | Aditya  | Bhutada    | SDE         |    8800 | 2006-11-05 |       5 | Heart Disease       | pune       | 250000 |   2005 |
+---------+--------+---------+------------+-------------+---------+------------+---------+---------------------+------------+--------+--------+

select designation, Dept_id from EmpAndProject where p_cost > 30000;
+-------------+---------+
| designation | Dept_id |
+-------------+---------+
| Intern      |       3 |
| SDE         |       3 |
| SDE         |       3 |
| Intern      |       2 |
| SDE1        |       2 |
| SDE         |       2 |
| Intern      |       3 |
| SDE         |       3 |
| SDE         |       3 |
+-------------+---------+
select p_name from Project where p_year = '2015';
+---------+
| p_name  |
+---------+
| App Dev |
+---------+
select * from EmpAndDept;
+---------+--------+---------+------------+-------------+---------+------------+--------+------------+
| Dept_id | Emp_id | fname   | lname      | designation | salary  | joinDate   | d_name | d_location |
+---------+--------+---------+------------+-------------+---------+------------+--------+------------+
|       1 |      1 | Karan   | Lahoti     | SDE1        | 1200000 | 2006-06-14 | comp   | mumbai     |
|       1 |      2 | Mohit   | Mohite     | Intern      |  450000 | 2005-04-11 | comp   | mumbai     |
|       1 |      6 | Harman  | Sharma     | SDE         |  140000 | 2007-08-09 | comp   | mumbai     |
|       1 |      8 | Rohit   | Sharma     | Intern      |  700000 | 2004-06-22 | comp   | mumbai     |
|       1 |     11 | Rohit   | Shetty     | Intern      |  700000 | 2004-06-22 | comp   | mumbai     |
|       1 |     12 | Jimmy   | Sharma     | SDE         |  140000 | 2007-08-09 | comp   | mumbai     |
|       1 |     13 | Tanishq | Mohite     | Intern      |  450000 | 2005-04-11 | comp   | mumbai     |
|       1 |     14 | Karan   | Kale       | SDE1        | 1200000 | 2006-06-14 | comp   | mumbai     |
|       1 |     15 | Shiv    | Shambhu    | SDE         |  500000 | 2006-03-06 | comp   | mumbai     |
|       1 |     16 | Ram     | Mandhane   | SDE1        |  450000 | 2009-11-30 | comp   | mumbai     |
|       2 |      3 | Arun    | Patil      | Intern      |    2200 | 2007-01-12 | it     | pune       |
|       2 |      4 | Balram  | Ingle      | SDE1        |  220000 | 2003-01-12 | it     | pune       |
|       2 |     10 | payal   | rohatgi    | SDE         |  132000 | 2005-11-04 | it     | pune       |
|       3 |      5 | param   | Dargad     | Intern      |    9900 | 2008-01-12 | entc   | nagpur     |
|       3 |      7 | Gaurav  | Maheshwari | SDE         |  990000 | 2006-02-21 | entc   | nagpur     |
|       3 |      9 | Aditya  | Bhutada    | SDE         |    8800 | 2006-11-05 | entc   | nagpur     |
+---------+--------+---------+------------+-------------+---------+------------+--------+------------+
create view DeptWithCount as (select distinct(d_name) as d_name, count(d_name) as countOfEmp from EmpAndDept GROUP BY(Dept_id));
select * from DeptWithCount;
+--------+------------+
| d_name | countOfEmp |
+--------+------------+
| comp   |         10 |
| it     |          3 |
| entc   |          3 |
+--------+------------+
select d_name from DeptWithCount where countOfEmp = 10;
+--------+
| d_name |
+--------+
| comp   |
+--------+
select * from EmpAndProject;
+---------+--------+---------+------------+-------------+---------+------------+---------+---------------------+------------+--------+--------+
| Dept_id | Emp_id | fname   | lname      | designation | salary  | joinDate   | Proj_id | p_name              | p_location | p_cost | p_year |
+---------+--------+---------+------------+-------------+---------+------------+---------+---------------------+------------+--------+--------+
|       1 |      1 | Karan   | Lahoti     | SDE1        | 1200000 | 2006-06-14 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |      2 | Mohit   | Mohite     | Intern      |  450000 | 2005-04-11 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |      6 | Harman  | Sharma     | SDE         |  140000 | 2007-08-09 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |      8 | Rohit   | Sharma     | Intern      |  700000 | 2004-06-22 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |     11 | Rohit   | Shetty     | Intern      |  700000 | 2004-06-22 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |     12 | Jimmy   | Sharma     | SDE         |  140000 | 2007-08-09 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |     13 | Tanishq | Mohite     | Intern      |  450000 | 2005-04-11 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |     14 | Karan   | Kale       | SDE1        | 1200000 | 2006-06-14 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |     15 | Shiv    | Shambhu    | SDE         |  500000 | 2006-03-06 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       1 |     16 | Ram     | Mandhane   | SDE1        |  450000 | 2009-11-30 |       1 | Website using React | Hyderabad  |  12000 |   2020 |
|       3 |      5 | param   | Dargad     | Intern      |    9900 | 2008-01-12 |       2 | Result Management   | pune       | 300000 |   2006 |
|       3 |      7 | Gaurav  | Maheshwari | SDE         |  990000 | 2006-02-21 |       2 | Result Management   | pune       | 300000 |   2006 |
|       3 |      9 | Aditya  | Bhutada    | SDE         |    8800 | 2006-11-05 |       2 | Result Management   | pune       | 300000 |   2006 |
|       1 |      1 | Karan   | Lahoti     | SDE1        | 1200000 | 2006-06-14 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |      2 | Mohit   | Mohite     | Intern      |  450000 | 2005-04-11 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |      6 | Harman  | Sharma     | SDE         |  140000 | 2007-08-09 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |      8 | Rohit   | Sharma     | Intern      |  700000 | 2004-06-22 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |     11 | Rohit   | Shetty     | Intern      |  700000 | 2004-06-22 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |     12 | Jimmy   | Sharma     | SDE         |  140000 | 2007-08-09 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |     13 | Tanishq | Mohite     | Intern      |  450000 | 2005-04-11 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |     14 | Karan   | Kale       | SDE1        | 1200000 | 2006-06-14 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |     15 | Shiv    | Shambhu    | SDE         |  500000 | 2006-03-06 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       1 |     16 | Ram     | Mandhane   | SDE1        |  450000 | 2009-11-30 |       3 | App Dev             | Hyderabad  |  10000 |   2015 |
|       2 |      3 | Arun    | Patil      | Intern      |    2200 | 2007-01-12 |       4 | Result Analysis     | mumbai     | 100000 |   2007 |
|       2 |      4 | Balram  | Ingle      | SDE1        |  220000 | 2003-01-12 |       4 | Result Analysis     | mumbai     | 100000 |   2007 |
|       2 |     10 | payal   | rohatgi    | SDE         |  132000 | 2005-11-04 |       4 | Result Analysis     | mumbai     | 100000 |   2007 |
|       3 |      5 | param   | Dargad     | Intern      |    9900 | 2008-01-12 |       5 | Heart Disease       | pune       | 250000 |   2005 |
|       3 |      7 | Gaurav  | Maheshwari | SDE         |  990000 | 2006-02-21 |       5 | Heart Disease       | pune       | 250000 |   2005 |
|       3 |      9 | Aditya  | Bhutada    | SDE         |    8800 | 2006-11-05 |       5 | Heart Disease       | pune       | 250000 |   2005 |
+---------+--------+---------+------------+-------------+---------+------------+---------+---------------------+------------+--------+--------+
select count(Emp_id) as EmpJoinedProBefore2009 from EmpAndProject where p_year < '2009';
+------------------------+
| EmpJoinedProBefore2009 |
+------------------------+
|                      9 |
+------------------------+
select count(Emp_id) as EmpJoinedProBefore2009 from EmpAndProject where p_year < '2009' GROUP BY(Emp_id);
+------------------------+
| EmpJoinedProBefore2009 |
+------------------------+
|                      1 |
|                      1 |
|                      2 |
|                      2 |
|                      2 |
|                      1 |
+------------------------+
select count(distinct(Emp_id)) as EmpJoinedProBefore2009 from EmpAndProject where p_year < '2009' GROUP BY(Emp_id);
+------------------------+
| EmpJoinedProBefore2009 |
+------------------------+
|                      1 |
|                      1 |
|                      1 |
|                      1 |
|                      1 |
|                      1 |
+------------------------+
select count(distinct(Emp_id)) as EmpJoinedProBefore2009 from EmpAndProject where p_year < '2009';
+------------------------+
| EmpJoinedProBefore2009 |
+------------------------+
|                      6 |
+------------------------+
select count(distinct(Emp_id)) as EmpJoinedProBefore2009 from Employee INNER JOIN Project on Employee.Dept_id = Project.Dept_id where p_year < '2009';
+------------------------+
| EmpJoinedProBefore2009 |
+------------------------+
|                      6 |
+------------------------+

select count(Emp_id) as EmpJoinedProBefore2009 from Employee INNER JOIN Project on Employee.Dept_id = Project.Dept_id where p_year < '2009';
+------------------------+
| EmpJoinedProBefore2009 |
+------------------------+
|                      9 |
+------------------------+
create view salGrtThan500K as (select * from Employee where salary > 500000);
