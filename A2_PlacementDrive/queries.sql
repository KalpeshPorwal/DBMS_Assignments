create table Student (S_id int Primary Key auto_increment,
drive_id int, 
sname varchar(20), 
cgpa float check (cgpa > 0.0),
sbranch varchar(10), foreign Key(drive_id) references Placement(drive_id) on delete cascade) ;

desc Student;

create table Placement (drive_id int Primary Key, company_name varchar(20), package int, location varchar(10)) ;

desc Placement;

create table Training (t_id int Primary Key, t_companyname varchar(20), Tfee int, t_year year check (t_year > 2016)) ;

desc Training;

SHOW CREATE TABLE Student\G

insert into Placement values
    (25, "Barclays", 50000, "Bengluru") ,
    (26, "Mastercard", 30000, "Mumbai") ,
    (27, "DB", 70000, "Pune") ,
    (28, "TATA", 20000, "Aurgbad") ,
    (29, "BMC", 10000, "Pune") ;

select * from Placement;

-- check constriant on cgpa    
insert into Student values
(31401, 25, "Venki", -9.2, "Computer") ;

-- insering drive_id which is not present in Placement
insert into Student values
(31401, 30, "Venki", -9.2, "Computer") ;

-- insering the data
insert into Student(drive_id, sname, cgpa, sbranch) values
(31401, 25, "Venki", 9.2, "Computer") ,
(NULL, 27, "Yash Sarda", 8.2, "IT") ,
(NULL, 28, "Manish", 9.0, "Computer") ,
(NULL, 26, "Tanisha", 8.1, "Computer") ,
(NULL, 25, "Atmaja", 9.0, "Computer") ,
(NULL, 27, "Venki", 9.2, "Computer") ,
(NULL, 29, "Kalpesh", 9.4, "Computer") ,
(NULL, 29, "Purva Lingate", 9.0, "Computer") ,
(NULL, 25, "Purvi", 8.9, "Computer") ,
(NULL, 27, "Shruti", 8.7, "E&TC") ,
(NULL, 26, "Renuka", 9.5, "Computer") ,
(NULL, 29, "Shrushti", 9.2, "Computer") ,
(NULL, 27, "Mohit", 8.4, "IT") ;

insert into Student values (25, "Gaurav", 9.6, "E&TC");
-- ERROR 1136 (21S01): Column count doesn't match value count at row 1

-- Wrong synatx
insert into Student(drive_id, sname, cgpa, sbranch) values
(31417, 25, "Himan", 9.2, "IT") ,
(27, "Raghav", 8.2, "IT") ;

-- Right syntax
insert into Student(drive_id, sname, cgpa, sbranch) values
(25, "Himan", 9.2, "IT") ,
(27, "Raghav", 8.2, "IT") ;


-- inserting into table Training

insert into Training values
(1, "ABC", 2000, 2017),
(2, "BDX", 3000, 2019),
(3, "AWS", 7000, 2020),
(4, "WMX", 8000, 2019),
(5, "JJD", 2000, 2021),
-- (6, "ABC", 2000, 2017); 
-- this can also be inserted 
-- to avoid duplicate data we can form
--  unique key(t_companyname, Tfee, t_year)

/*2 . Display all students details with branch ‘Computer ‘and ‘IT’ and student name starting with ‘a’ or 'd'.   */

select * from Student where (sbranch in ("Computer", "IT")) and (sname like '_a%' or sname like '_d%');
+-------+----------+------------+------+----------+
| S_id  | drive_id | sname      | cgpa | sbranch  |
+-------+----------+------------+------+----------+
| 31402 |       27 | Yash Sarda |  8.2 | IT       |
| 31403 |       28 | Manish     |    9 | Computer |
| 31404 |       26 | Tanisha    |  8.1 | Computer |
| 31407 |       29 | Kalpesh    |  9.4 | Computer |
| 31417 |       27 | Raghav     |  8.2 | IT       |
| 31418 |       26 | Gd         |  9.1 | IT       |
+-------+----------+------------+------+----------+
6 rows in set (0.00 sec)


-- VIEW ************************************************
create VIEW cgpaGT9 as select sname, sbranch, cgpa from Students where cgpa > 9;
-- Query OK, 0 rows affected (0.01 sec)

select * from cgpaGT9;
+----------+----------+------+
| sname    | sbranch  | cgpa |
+----------+----------+------+
| Venki    | Computer |  9.2 |
| Venki    | Computer |  9.2 |
| Kalpesh  | Computer |  9.4 |
| Renuka   | Computer |  9.5 |
| Shrushti | Computer |  9.2 |
| Gaurav   | E&TC     |  9.6 |
| Himan    | IT       |  9.2 |
| Gd       | IT       |  9.1 |
+----------+----------+------+
8 rows in set (0.01 sec)

-- 1. Inserting the entries in view and checking if it is reflecting in student

insert into cgpaGT9 values ("Sanket", "Computer", 9.3);

select * from cgpaGT9;
+----------+----------+------+
| sname    | sbranch  | cgpa |
+----------+----------+------+
| Venki    | Computer |  9.2 |
| Venki    | Computer |  9.2 |
| Kalpesh  | Computer |  9.4 |
| Renuka   | Computer |  9.5 |
| Shrushti | Computer |  9.2 |
| Gaurav   | E&TC     |  9.6 |
| Himan    | IT       |  9.2 |
| Gd       | IT       |  9.1 |
| Sanket   | Computer |  9.3 |
+----------+----------+------+
9 rows in set (0.00 sec)

select * from Student;
+-------+----------+---------------+------+----------+
| S_id  | drive_id | sname         | cgpa | sbranch  |
+-------+----------+---------------+------+----------+
| 31401 |       25 | Venki         |  9.2 | Computer |
| 31402 |       27 | Yash Sarda    |  8.2 | IT       |
| 31403 |       28 | Manish        |    9 | Computer |
| 31404 |       26 | Tanisha       |  8.1 | Computer |
| 31405 |       25 | Atmaja        |    9 | Computer |
| 31406 |       27 | Venki         |  9.2 | Computer |
| 31407 |       29 | Kalpesh       |  9.4 | Computer |
| 31408 |       29 | Purva Lingate |    9 | Computer |
| 31409 |       25 | Purvi         |  8.9 | Computer |
| 31410 |       27 | Shruti        |  8.7 | E&TC     |
| 31411 |       26 | Renuka        |  9.5 | Computer |
| 31412 |       29 | Shrushti      |  9.2 | Computer |
| 31413 |       27 | Mohit         |  8.4 | IT       |
| 31415 |       25 | Gaurav        |  9.6 | E&TC     |
| 31416 |       25 | Himan         |  9.2 | IT       |
| 31417 |       27 | Raghav        |  8.2 | IT       |
| 31418 |       26 | Gd            |  9.1 | IT       |
| 31419 |     NULL | Sanket        |  9.3 | Computer |*******
+-------+----------+---------------+------+----------+
18 rows in set (0.00 sec)

-- 2. Updating the view and checking the reflection in main table

update cgpaGT9 set drive_id = 27 where S_id = 31419;
select * from cgpaGT9;
+----------+----------+------+
| sname    | sbranch  | cgpa |
+----------+----------+------+
| Venki    | Computer |  9.2 |
| Venki    | Computer |  9.2 |
| Kalpesh  | Computer |  9.4 |
| Renuka   | Computer |  9.5 |
| Shrushti | Computer |  9.2 |
| Gaurav   | E&TC     |  9.6 |
| Himan    | IT       |  9.2 |
| Gd       | IT       |  9.1 |
| Sanket   | IT       |  9.3 |
+----------+----------+------+
9 rows in set (0.00 sec)

 select * from Student;
+-------+----------+---------------+------+----------+
| S_id  | drive_id | sname         | cgpa | sbranch  |
+-------+----------+---------------+------+----------+
| 31401 |       25 | Venki         |  9.2 | Computer |
| 31402 |       27 | Yash Sarda    |  8.2 | IT       |
| 31403 |       28 | Manish        |    9 | Computer |
| 31404 |       26 | Tanisha       |  8.1 | Computer |
| 31405 |       25 | Atmaja        |    9 | Computer |
| 31406 |       27 | Venki         |  9.2 | Computer |
| 31407 |       29 | Kalpesh       |  9.4 | Computer |
| 31408 |       29 | Purva Lingate |    9 | Computer |
| 31409 |       25 | Purvi         |  8.9 | Computer |
| 31410 |       27 | Shruti        |  8.7 | E&TC     |
| 31411 |       26 | Renuka        |  9.5 | Computer |
| 31412 |       29 | Shrushti      |  9.2 | Computer |
| 31413 |       27 | Mohit         |  8.4 | IT       |
| 31415 |       25 | Gaurav        |  9.6 | E&TC     |
| 31416 |       25 | Himan         |  9.2 | IT       |
| 31417 |       27 | Raghav        |  8.2 | IT       |
| 31418 |       26 | Gd            |  9.1 | IT       |
| 31419 |     NULL | Sanket        |  9.3 | IT       |
+-------+----------+---------------+------+----------+
18 rows in set (0.00 sec)

-- DELETING THE ENTRY FROM VIEW
delete from cgpaGT9 where sname = "Sanket";
Query OK, 1 row affected (0.01 sec)

mysql> select * from cgpaGT9;
+----------+----------+------+
| sname    | sbranch  | cgpa |
+----------+----------+------+
| Venki    | Computer |  9.2 |
| Venki    | Computer |  9.2 |
| Kalpesh  | Computer |  9.4 |
| Renuka   | Computer |  9.5 |
| Shrushti | Computer |  9.2 |
| Gaurav   | E&TC     |  9.6 |
| Himan    | IT       |  9.2 |
| Gd       | IT       |  9.1 |
+----------+----------+------+
8 rows in set (0.00 sec)

mysql> select * from Student;
+-------+----------+---------------+------+----------+
| S_id  | drive_id | sname         | cgpa | sbranch  |
+-------+----------+---------------+------+----------+
| 31401 |       25 | Venki         |  9.2 | Computer |
| 31402 |       27 | Yash Sarda    |  8.2 | IT       |
| 31403 |       28 | Manish        |    9 | Computer |
| 31404 |       26 | Tanisha       |  8.1 | Computer |
| 31405 |       25 | Atmaja        |    9 | Computer |
| 31406 |       27 | Venki         |  9.2 | Computer |
| 31407 |       29 | Kalpesh       |  9.4 | Computer |
| 31408 |       29 | Purva Lingate |    9 | Computer |
| 31409 |       25 | Purvi         |  8.9 | Computer |
| 31410 |       27 | Shruti        |  8.7 | E&TC     |
| 31411 |       26 | Renuka        |  9.5 | Computer |
| 31412 |       29 | Shrushti      |  9.2 | Computer |
| 31413 |       27 | Mohit         |  8.4 | IT       |
| 31415 |       25 | Gaurav        |  9.6 | E&TC     |
| 31416 |       25 | Himan         |  9.2 | IT       |
| 31417 |       27 | Raghav        |  8.2 | IT       |
| 31418 |       26 | Gd            |  9.1 | IT       |
+-------+----------+---------------+------+----------+
17 rows in set (0.00 sec)

-- INDEX

create index driveIndex on Student(drive_id);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

 show indexes from Student;
+---------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| student |          0 | PRIMARY    |            1 | S_id        | A         |          17 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| student |          1 | driveIndex |            1 | drive_id    | A         |           5 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.02 sec)

mysql> select * from Student;
+-------+----------+---------------+------+----------+
| S_id  | drive_id | sname         | cgpa | sbranch  |
+-------+----------+---------------+------+----------+
| 31401 |       25 | Venki         |  9.2 | Computer |
| 31402 |       27 | Yash Sarda    |  8.2 | IT       |
| 31403 |       28 | Manish        |    9 | Computer |
| 31404 |       26 | Tanisha       |  8.1 | Computer |
| 31405 |       25 | Atmaja        |    9 | Computer |
| 31406 |       27 | Venki         |  9.2 | Computer |
| 31407 |       29 | Kalpesh       |  9.4 | Computer |
| 31408 |       29 | Purva Lingate |    9 | Computer |
| 31409 |       25 | Purvi         |  8.9 | Computer |
| 31410 |       27 | Shruti        |  8.7 | E&TC     |
| 31411 |       26 | Renuka        |  9.5 | Computer |
| 31412 |       29 | Shrushti      |  9.2 | Computer |
| 31413 |       27 | Mohit         |  8.4 | IT       |
| 31415 |       25 | Gaurav        |  9.6 | E&TC     |
| 31416 |       25 | Himan         |  9.2 | IT       |
| 31417 |       27 | Raghav        |  8.2 | IT       |
| 31418 |       26 | Gd            |  9.1 | IT       |
+-------+----------+---------------+------+----------+
17 rows in set (0.00 sec)

mysql> explain select * from Student where sbranch = "IT" and drive_id = 25;
+----+-------------+---------+------------+------+---------------+------------+---------+-------+------+----------+-------------+
| id | select_type | table   | partitions | type | possible_keys | key        | key_len | ref   | rows | filtered | Extra       |
+----+-------------+---------+------------+------+---------------+------------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | Student | NULL       | ref  | driveIndex    | driveIndex | 5       | const |    5 |    10.00 | Using where |
+----+-------------+---------+------------+------+---------------+------------+---------+-------+------+----------+-------------+
1 row in set, 1 warning (0.01 sec)

mysql> select * from Student where sbranch = "IT" and drive_id = 25;
+-------+----------+-------+------+---------+
| S_id  | drive_id | sname | cgpa | sbranch |
+-------+----------+-------+------+---------+
| 31416 |       25 | Himan |  9.2 | IT      |
+-------+----------+-------+------+---------+
1 row in set (0.00 sec)

mysql> explain select * from Student where S_id = 31413 and sbranch = "IT";
+----+-------------+---------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table   | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+---------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | Student | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+---------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select * from Student where drive_id = 26 and S_id > 31412;
+----+-------------+---------+------------+-------------+--------------------+--------------------+---------+------+------+----------+--------------------------------------------------+
| id | select_type | table   | partitions | type        | possible_keys      | key                | key_len | ref  | rows | filtered | Extra                                            |
+----+-------------+---------+------------+-------------+--------------------+--------------------+---------+------+------+----------+--------------------------------------------------+
|  1 | SIMPLE      | Student | NULL       | index_merge | PRIMARY,driveIndex | driveIndex,PRIMARY | 9,4     | NULL |    1 |   100.00 | Using intersect(driveIndex,PRIMARY); Using where |
+----+-------------+---------+------------+-------------+--------------------+--------------------+---------+------+------+----------+--------------------------------------------------+
1 row in set, 1 warning (0.00 sec)

mysql> select * from Student where drive_id = 26 and S_id > 31412;
+-------+----------+-------+------+---------+
| S_id  | drive_id | sname | cgpa | sbranch |
+-------+----------+-------+------+---------+
| 31418 |       26 | Gd    |  9.1 | IT      |
+-------+----------+-------+------+---------+
1 row in set (0.00 sec)


-- . List the number of different companies

select distinct(company_name) from Placement;

-- Give 15% increase in fee of the Training with date of training year as 2019.
select * from Training;
+------+---------------+------+--------+
| t_id | t_companyname | Tfee | t_year |
+------+---------------+------+--------+
|    1 | ABC           | 2000 |   2017 |
|    2 | BDX           | 3000 |   2019 |
|    3 | AWS           | 7000 |   2020 |
|    4 | WMX           | 8000 |   2019 |
|    5 | JJD           | 2000 |   2021 |
+------+---------------+------+--------+
5 rows in set (0.00 sec)
update Training set Tfee = Tfee + Tfee * 0.1 where t_year = 2019;

select * from Training;
+------+---------------+------+--------+
| t_id | t_companyname | Tfee | t_year |
+------+---------------+------+--------+
|    1 | ABC           | 2000 |   2017 |
|    2 | BDX           | 3300 |   2019 |***
|    3 | AWS           | 7000 |   2020 |
|    4 | WMX           | 8800 |   2019 |***
|    5 | JJD           | 2000 |   2021 |
+------+---------------+------+--------+
5 rows in set (0.00 sec)

-- . Find the names of companies belonging to’ Pune’ or ‘Mumbai’.  
select company_name, location from Placement where location in ("Pune", "Mumbai");
+--------------+----------+
| company_name | location |
+--------------+----------+
| Mastercard   | Mumbai   |
| DB           | Pune     |
| BMC          | Pune     |
+--------------+----------+
3 rows in set (0.00 sec)

-- Find the student name having maximum CGPA score and names of students having CGPA score between 7 and 9.

select sname as maxCGPA from Student where cgpa = (select max(cgpa) from Student);
+---------+
| maxCGPA |
+---------+
| Gaurav  |
+---------+

select sname, cgpa from Student where cgpa between 7 and 9;
+---------------+------+
| sname         | cgpa |
+---------------+------+
| Yash Sarda    |  8.2 |
| Manish        |    9 |
| Tanisha       |  8.1 |
| Atmaja        |    9 |
| Purva Lingate |    9 |
| Purvi         |  8.9 |
| Shruti        |  8.7 |
| Mohit         |  8.4 |
| Raghav        |  8.2 |
+---------------+------+

-- Display all Student name with T_id  with decreasing order of Fees
select * from Training order by Tfee desc;


-- Delete placementdrive details having package less than 500000.  

update Placement set package = package * 10;
select * from Student;

+-------+----------+---------------+------+----------+
| S_id  | drive_id | sname         | cgpa | sbranch  |
+-------+----------+---------------+------+----------+
| 31401 |       25 | Venki         |  9.2 | Computer |
| 31402 |       27 | Yash Sarda    |  8.2 | IT       |
| 31403 |       28 | Manish        |    9 | Computer |
| 31404 |       26 | Tanisha       |  8.1 | Computer |
| 31405 |       25 | Atmaja        |    9 | Computer |
| 31406 |       27 | Venki         |  9.2 | Computer |
| 31407 |       29 | Kalpesh       |  9.4 | Computer |
| 31408 |       29 | Purva Lingate |    9 | Computer |
| 31409 |       25 | Purvi         |  8.9 | Computer |
| 31410 |       27 | Shruti        |  8.7 | E&TC     |
| 31411 |       26 | Renuka        |  9.5 | Computer |
| 31412 |       29 | Shrushti      |  9.2 | Computer |
| 31413 |       27 | Mohit         |  8.4 | IT       |
| 31415 |       25 | Gaurav        |  9.6 | E&TC     |
| 31416 |       25 | Himan         |  9.2 | IT       |
| 31417 |       27 | Raghav        |  8.2 | IT       |
| 31418 |       26 | Gd            |  9.1 | IT       |
+-------+----------+---------------+------+----------+
17 rows in set (0.00 sec)

mysql> select * from Placement;
+----------+--------------+---------+----------+
| drive_id | company_name | package | location |
+----------+--------------+---------+----------+
|       25 | Barclays     |  500000 | Bengluru |
|       26 | Mastercard   |  300000 | Mumbai   |
|       27 | DB           |  700000 | Pune     |
|       28 | TATA         |  200000 | Aurgbad  |
|       29 | BMC          |  100000 | Pune     |
+----------+--------------+---------+----------+
5 rows in set (0.00 sec)

mysql>
mysql> delete from Placement where package < 500000;
Query OK, 3 rows affected (0.00 sec)

mysql> select * from Placement;
+----------+--------------+---------+----------+
| drive_id | company_name | package | location |
+----------+--------------+---------+----------+
|       25 | Barclays     |  500000 | Bengluru |
|       27 | DB           |  700000 | Pune     |
+----------+--------------+---------+----------+
2 rows in set (0.00 sec)

mysql> select * from Student;
+-------+----------+------------+------+----------+
| S_id  | drive_id | sname      | cgpa | sbranch  |
+-------+----------+------------+------+----------+
| 31401 |       25 | Venki      |  9.2 | Computer |
| 31402 |       27 | Yash Sarda |  8.2 | IT       |
| 31405 |       25 | Atmaja     |    9 | Computer |
| 31406 |       27 | Venki      |  9.2 | Computer |
| 31409 |       25 | Purvi      |  8.9 | Computer |
| 31410 |       27 | Shruti     |  8.7 | E&TC     |
| 31413 |       27 | Mohit      |  8.4 | IT       |
| 31415 |       25 | Gaurav     |  9.6 | E&TC     |
| 31416 |       25 | Himan      |  9.2 | IT       |
| 31417 |       27 | Raghav     |  8.2 | IT       |
+-------+----------+------------+------+----------+
10 rows in set (0.00 sec)

