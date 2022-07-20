SET SERVEROUTPUT ON
CREATE OR REPLACE trigger t_name before insert on carmechanic
referencing old as o new as n
for each row
declare
age integer;
begin
age:= floor(MONTHS_BETWEEN(current_date,:n.joining_date)/12);
if age>=1 and age<2 
then:n.salary:=20000*1.10;
elsif age>=2 and age<3 
then:n.salary:=20000*1.20;
elsif age>=3 and age<4 
then:n.salary:=20000*1.30;
else:n.salary:=20000*1.40;
end if;
dbms_output.put_line('trigger created');
end;
/
