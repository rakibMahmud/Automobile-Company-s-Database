
SET SERVEROUTPUT ON
create or replace procedure p(w_date in date) is
total integer;
total1 integer;
var integer;
var1 integer;
var2 integer;
var3 integer;
cursor ct is
select a.id,a.name,a.salary,b.overtime from 
carmechanic a join working_detail_carmechanic  b on a.id=b.car_mec_id where b.working_date=w_date;
c_record ct%rowtype;
cursor ct1 is
select a.id,a.name,a.salary,b.overtime  
from hondamechanic a join working_detail_hondamechanic  b on a.id=b.honda_mec_id where b.working_date=w_date;
c_record1 ct1%rowtype;
begin
select count(*) into total from carmechanic;
select count(*) into total1 from hondamechanic;
select count(*) into  var from working_detail_carmechanic where working_date=w_date;
select count(*) into  var1 from working_detail_hondamechanic where working_date=w_date;
dbms_output.put_line('Total carmechanic '||total||' Overtime did '||var);
dbms_output.put_line('Total hondamechanic '||total1||' Overtime did '||var1);
open ct;
loop
fetch ct into c_record;
exit when ct%notfound;
var2:=c_record.salary+c_record.overtime*1000;
dbms_output.put_line('Carmechanic  id '|| c_record.id||' Name '||c_record.name||
' Salary '||c_record.salary||' Overtime '||c_record.overtime||'hours '||
'Overtime Salary '||c_record.overtime*1000||' Total Salary '||var2);
end loop;
close ct;
open ct1;
loop
fetch ct1 into c_record1;
exit when ct1%notfound;
var3:=c_record1.salary+c_record1.overtime*1000;
dbms_output.put_line('Hondamechanic  id '|| c_record1.id||' Name '||c_record1.name||
' Salary '||c_record1.salary||' Overtime '||c_record1.overtime||'hours '||
'Overtime Salary '||c_record1.overtime*1000||' Total Salary '||var3);
end loop;
close ct1;
end;
/
