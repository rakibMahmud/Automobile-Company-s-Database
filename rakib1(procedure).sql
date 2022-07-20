SET SERVEROUTPUT ON
create or replace procedure p(w_date in date) is
total integer;
total1 integer;
var integer;
var1 integer;
var2 integer;
var3 integer;
counter2 integer:=4001;
count1 integer;
counter integer:=3001;
counter1 integer:=1;
counter3 integer:=1;
type carid is varray(4) of number(11);
type carname is varray(4) of varchar(20);
type carsalary is varray(4) of integer;
type carovertime is varray(4) of integer;
type hid is varray(4) of number(11);
type hname is varray(4) of varchar(20);
type hsalary is varray(4) of integer;
type hovertime is varray(4) of integer;

id_array carid:=carid();
name_array carname:=carname();
salary_array carsalary:=carsalary();
overtime_array carovertime:=carovertime();
hid_array hid:=hid();
hname_array hname:=hname();
hsalary_array hsalary:=hsalary();
hovertime_array hovertime:=hovertime();
begin
select count(*) into total from carmechanic;
select count(*) into total1 from hondamechanic;
select count(*) into  var from working_detail_carmechanic where working_date=w_date;
select count(*) into  var1 from working_detail_hondamechanic where working_date=w_date;
dbms_output.put_line('Total carmechanic '||total||' Overtime did '||var);
dbms_output.put_line('Total hondamechanic '||total1||' Overtime did '||var1);
for counter in 3001..3004
loop
id_array.extend();
name_array.extend();
salary_array.extend();
overtime_array.extend();
select a.id,a.name,a.salary,b.overtime into id_array(counter1),name_array(counter1),salary_array(counter1),overtime_array(counter1) 
from carmechanic a join working_detail_carmechanic  b on a.id=b.car_mec_id where b.working_date=w_date and a.id=counter;
counter1:=counter1+1;
end loop;
for counter1 in 1..var
loop
 var2:=salary_array(counter1) + overtime_array(counter1)*1000;
dbms_output.put_line('Carmechanic  id '||id_array(counter1)||' name '||name_array(counter1)||
' salary '||salary_array(counter1)||' overtime '||overtime_array(counter1) ||'hours '||
' overtime salary '||overtime_array(counter1)*1000||
' total salary '||var2);
end loop;
dbms_output.put_line(' ');
for counter2 in 4001..4004
loop
hid_array.extend();
hname_array.extend();
hsalary_array.extend();
hovertime_array.extend();
select a.id,a.name,a.salary,b.overtime into hid_array(counter3),hname_array(counter3),hsalary_array(counter3),hovertime_array(counter3) 
from hondamechanic a join working_detail_hondamechanic  b on a.id=b.honda_mec_id where b.working_date=w_date and a.id=counter2;
counter3:=counter3+1;
end loop;
for counter1 in 1..var1
loop
 var3:=hsalary_array(counter1) + hovertime_array(counter1)*1000;

dbms_output.put_line('Hondamechanic  id '||hid_array(counter1)||' name '||hname_array(counter1)||
' salary '||hsalary_array(counter1)||' overtime '||hovertime_array(counter1) ||'hours '||
' overtime salary '||hovertime_array(counter1)*1000||
' total salary '||var3);
end loop;
end;
/