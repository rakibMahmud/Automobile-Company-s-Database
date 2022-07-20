drop table income;
drop table working_detail_carmechanic;
drop table working_detail_hondamechanic;
drop table carmechanic;
drop table hondamechanic;
drop table customer;
drop table manager;

create table manager(
               id integer,
	       name varchar(20) not null,
	       phone_no number(11) unique,
	       salary integer,
               age integer check(age>=1 and age<=120),
               joining_date date,
	       primary key(id)
             );
create table customer(
             id integer,
             name varchar(20),
             phone_no number(11) unique,
             vechile_type varchar(20),
             primary key(id)
            );
create table carmechanic(
             id integer,
             name varchar(20) not null,
             salary integer,
             phone_no number(11) unique,
             man_id integer,
             customer_id integer,
             age integer check(age>=1 and age<=120),
             joining_date date,
             primary key(id),
             foreign key(man_id) references manager(id) on delete cascade,
             foreign key(customer_id) references customer(id) on delete cascade
             );
create table hondamechanic(
             id integer,
             name varchar(20) not null,
             salary integer,
             phone_no number(11) unique,
             man_id integer,
             customer_id integer,
             age integer check(age>=1 and age<=120),
             joining_date date,
             primary key(id),
             foreign key(man_id) references manager(id) on delete cascade,
             foreign key(customer_id) references customer(id) on delete cascade
             );
create table working_detail_carmechanic(
            id integer,
            working_date date,
            overtime integer,
            car_mec_id integer,
            overtime_salary integer,
            primary key(id),
            foreign key(car_mec_id) references carmechanic(id) on delete cascade
            );
create table working_detail_hondamechanic(
            id integer,
            working_date date,
            overtime integer,
            honda_mec_id integer,
            primary key(id),
            foreign key(honda_mec_id) references hondamechanic(id) on delete cascade
            );


create table income(
             date_ date,
             id integer,
             charge integer
            --  primary key(date_,id),
            --  foreign key(id) references customer(id) on delete cascade
            );

insert into manager(id,name,salary,phone_no,age,joining_date) values(1001,'Rakib',60000,01700000001,30,'01-jan-15');
insert into manager(id,name,salary,phone_no,age,joining_date) values(1002,'Alif',60000,01700000002,33,'02-jan-14');
insert into manager(id,name,salary,phone_no,age,joining_date) values(1003,'Mehedy',70000,01700000003,40,'04-dec-12');
insert into manager(id,name,salary,phone_no,age,joining_date) values(1004,'Nazib',72000,01700000004,36,'02-feb-13');
insert into manager(id,name,salary,phone_no,age,joining_date) values(1005,'Shoriful',80000,01700000005,42,'01-mar-11');

insert into customer(id,name,phone_no,vechile_type) values(2001,'Parvej',01710000001,'car');
insert into customer(id,name,phone_no,vechile_type) values(2002,'Emon',01710000002,'car');
insert into customer(id,name,phone_no,vechile_type) values(2003,'Swassow',01710000003,'honda');
insert into customer(id,name,phone_no,vechile_type) values(2004,'Arnob',01710000004,'honda');
insert into customer(id,name,phone_no,vechile_type) values(2005,'Sadi',01710000005,'car');

insert into carmechanic(id,name,salary,phone_no,man_id,customer_id,age,joining_date) values(3001,'Tahsin',20000,01720000001,1001,2001,23,'01-jan-17');
insert into carmechanic(id,name,salary,phone_no,man_id,customer_id,age,joining_date) values(3002,'Apon',30000,01720000002,1002,2001,27,'02-jan-18');
insert into carmechanic(id,name,salary,phone_no,man_id,customer_id,age,joining_date) values(3003,'Pushon',40000,01720000003,1003,2002,30,'01-dec-19');
insert into carmechanic(id,name,salary,phone_no,man_id,customer_id,age,joining_date) values(3004,'Sahid',50000,01720000004,1002,2003,33,'02-feb-20');
insert into carmechanic(id,name,salary,phone_no,man_id,customer_id,age,joining_date) values(3005,'Sifat',25000,01720000005,1005,2002,35,'01-jan-21');

insert into hondamechanic(id,name,salary,phone_no,man_id,customer_id,age,joining_date) values(4001,'Farhan',20000,01722000001,1001,2003,21,'01-mar-17');
insert into hondamechanic(id,name,salary,phone_no,man_id,customer_id,age,joining_date) values(4002,'Mishu',25000,0172200002,1002,2003,26,'01-feb-16');
insert into hondamechanic(id,name,salary,phone_no,man_id,customer_id,age,joining_date) values(4003,'Uday',20000,0172200003,1003,2004,31,'01-dec-14');
insert into hondamechanic(id,name,salary,phone_no,man_id,customer_id,age,joining_date) values(4004,'Tudu',20000,0172200004,1004,2003,34,'02-jan-12');
insert into hondamechanic(id,name,salary,phone_no,man_id,customer_id,age,joining_date) values(4005,'Mahim',20000,0172200005,1003,2004,28,'01-jan-15');

insert into working_detail_carmechanic(id,working_date,overtime,car_mec_id,overtime_salary) values(1,'05-jan-22',3,3001,3000);
insert into working_detail_carmechanic(id,working_date,overtime,car_mec_id,overtime_salary) values(2,'05-jan-22',4,3002,4000);
insert into working_detail_carmechanic(id,working_date,overtime,car_mec_id,overtime_salary) values(3,'05-jan-22',2,3003,2000);
insert into working_detail_carmechanic(id,working_date,overtime,car_mec_id,overtime_salary) values(4,'05-jan-22',5,3004,5000);
insert into working_detail_carmechanic(id,working_date,overtime,car_mec_id,overtime_salary) values(5,'04-jan-22',1,3005,1000);


insert into working_detail_hondamechanic(id,working_date,overtime,honda_mec_id) values(1,'05-jan-22',3,4001);
insert into working_detail_hondamechanic(id,working_date,overtime,honda_mec_id) values(2,'05-jan-22',5,4002);
insert into working_detail_hondamechanic(id,working_date,overtime,honda_mec_id) values(3,'05-jan-22',2,4003);
insert into working_detail_hondamechanic(id,working_date,overtime,honda_mec_id) values(4,'05-jan-22',1,4004);
insert into working_detail_hondamechanic(id,working_date,overtime,honda_mec_id) values(5,'04-jan-22',4,4005);

insert into income(date_,id,charge) values('02-jan-18',2001,50000);
insert into income(date_,id,charge) values('03-jan-18',2002,40000);
insert into income(date_,id,charge) values('02-jan-18',2003,70000);
insert into income(date_,id,charge) values('04-jan-18',2004,60000);
insert into income(date_,id,charge) values('07-jan-18',2005,55000);
commit;

