-- description of each table 
DESC manager;
DESC customer;
DESC hondamechanic;
DESC carmechanic;
DESC working_detail_hondamechanic;
DESC working_detail_carmechanic;
DESC income;


-- data according each table
select * from manager;
select * from customer;
select * from hondamechanic;
select * from carmechanic;
select * from  working_detail_hondamechanic;
select * from working_detail_carmechanic;
select * from  income;


--add operation (adding column)
alter table manager add temporary_column VARCHAR2(50);
desc manager;
select * from manager;

--modify operation (modifying column data type)
alter table manager modify temporary_column NUMBER(20);
desc manager;
select * from manager;

--drop operation (dropping column)
alter table manager drop column temporary_column;
desc manager;
select * from manager;

--rename operation (renaming column)
alter table manager rename column phone_no to p_no;
desc manager;
select * from manager;

alter table manager rename column p_no to phone_no;
desc manager;
select * from manager;


--update operation (updating a value)
update manager set salary = 5000 where id=1005;
desc manager;
select * from manager;

update manager set salary = 80000 where id=1005;
desc manager;
select * from manager;

--delete operation (deleting a row from tags table)
insert into manager(id,name,salary,phone_no,age,joining_date) values(1006,'Shoriful',80000,01700000006,43,'01-mar-11');
select * from manager;

delete from manager where id=1006;
select * from manager;


--applying conditions
select name from manager where id=1001;

--Range Search
SELECT name,phone_no,salary FROM manager
WHERE id BETWEEN 1001 AND 1005;

SELECT name,phone_no,salary FROM manager
WHERE id not BETWEEN 1001 AND 1003;

--range operators
SELECT name,phone_no,salary FROM manager
WHERE id>=1001 AND id<=1003; 

SELECT name,phone_no,salary FROM manager
WHERE id>=1001 or id<=1003; 

--Set membership
SELECT name,phone_no,salary FROM manager WHERE id IN (1001,1005);
SELECT name,phone_no,salary FROM manager WHERE id NOT IN (1001,1005);

--Ordering by column values
SELECT name,phone_no,salary,age FROM manager ORDER BY age;
SELECT name,phone_no,salary,age FROM manager ORDER BY age desc;

--Ordering by column values(with multiple columns)

SELECT id,name,age FROM manager ORDER BY age,id;
SELECT id,name,age FROM manager ORDER BY age,id desc;
select * from manager order by id;

--Use of DISTINCT
select distinct (salary) from manager;

--calculated field
select (id/2) as id_divided_by_two from manager;

--------------------finish  finish for  today-------------------------------------

--aggregate functions:
select  max(id) from manager;

select min(id) from manager;

select  sum(id) from manager;

select count(id) from manager;

select count(*) from manager;

select count(distinct (id)) from manager;


insert into manager(id,name,salary,phone_no,age,joining_date) values(1006,'Shoriful','',01700000006,43,'01-mar-11');
select * from manager;


select  avg(salary) from manager;

select  avg(nvl(salary,0)) from manager;

delete from manager where id=1006;
select * from manager;




--GROUP BY clause
select count(man_id),man_id from carmechanic group by man_id;
select count(man_id),man_id from carmechanic where salary>30000 group by man_id;

--HAVING clause
select count(man_id),man_id from carmechanic group by man_id having count(*)<2;
select count(man_id),man_id from carmechanic group by man_id having man_id>1002;


--IN
select id,name,salary from carmechanic where name in ('Apon','Tahsin','Sifat');
--nested query
select name from carmechanic where man_id in(select man_id from carmechanic group by man_id having count(*)>1);


--Pattern Matching
select id,name from customer
where vechile_type like 'c%';

select id,name from customer
where vechile_type like '%r';

select id,name from customer
where name like '%a%';
-- a can be anywhere in middle but not first and last

select * from customer
where name like '_a%v%j';
-- 2nd letter a, v can be anywhere after a and before j, last letter must be j

select * from customer
where name like 'P_r%v%j';
-- 1st letter p , 2nd letter a, v can be anywhere after a and before j, last letter must be j

select * from customer
where name like '_a%';
-- 2nd letter a, rest can be anything

select id,name from customer
where name not like '%a%';


--------------------finish  finish for  today-------------------------------------


