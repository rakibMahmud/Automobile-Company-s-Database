--set operations

--union all operation (duplicate ashe)

insert into manager(id,name,salary,phone_no,age,joining_date) values(1006,'Sifat',80000,01700000006,42,'01-mar-11');
insert into carmechanic(id,name,salary,phone_no,man_id,customer_id,age,joining_date) values(3006,'Shoriful',25000,01720000006,1005,2002,35,'01-jan-21');
select name from manager where id>=1001 and id<=1006
union all  
select name from carmechanic where man_id>=1001 and man_id<=1006;

--union operation (duplicate ashe na)
select name from manager where id>=1001 and id<=1006
union   
select name from carmechanic where man_id>=1001 and man_id<=1006;

--INTERSECT operation
select name from manager where id>=1001 and id<=1006
INTERSECT  
select name from carmechanic where man_id>=1001 and man_id<=1006;

--MINUS operation
select name from manager where id>=1001 and id<=1006
MINUS  
select name from carmechanic where man_id>=1001 and man_id<=1006;


delete from manager where id=1006;
select * from manager;

delete from carmechanic where id=3006;
select *from carmechanic;

--simple join examples customer and income table
select t.id,t.name,c.date_ from customer t join
income c on t.id = c.id;

-- natural join 
select id,name,date_ from customer natural join income;

-- cross join
select t.id,t.name,c.date_ from customer t cross join
income c;

--Inner Join
select t.id,t.name,c.date_ from customer t inner join
income c on t.id = c.id;


--Outer Join
--LEFT Outer Join
insert into customer(id,name,phone_no,vechile_type) values(2006,'Ayonn',01710000006,'car');
select t.id,t.name,c.date_ from customer t LEFT Outer join
income c on t.id = c.id;

--RIGHT Outer Join
insert into income(date_,id,charge) values('08-jan-18',2007,55000);
select t.id,t.name,c.date_ from customer t RIGHT Outer join
income c on t.id = c.id;

-- full outer join 
select t.id,t.name,c.date_ from customer t full Outer join
income c on t.id = c.id;

--Self Join
select p.id from income p MINUS
select p.id from income p join income q on p.id<q.id;


delete from customer where id=2006;
select *from customer;


delete from income where id=2007;
select *from income;

-- View


-- single table

CREATE View view_details as
select date_,id from income
where id<2004;

select *from view_details;
drop View view_details;

-- Multiple table

CREATE View view_details2 as
select s.id,s.date_,m.vechile_type from 
income s, customer m
where s.id=m.id;

select *from view_details2;
drop View view_details2;

-- rollback related thing

select *from income;
commit;
select *from income;
delete from income where id=2001;
select *from income;
delete from income where id>2003;
select *from income;
rollback;
select *from income;
