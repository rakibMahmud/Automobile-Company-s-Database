SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION f(car_id in integer) return integer is
age integer;
c_id carmechanic.id%type;
c_name carmechanic.name%type;
c_salary carmechanic.salary%type;
begin
select floor(MONTHS_BETWEEN(current_date,joining_date)/12) into age from carmechanic where id=car_id;
select id,name,salary into c_id,c_name,c_salary from carmechanic where id=car_id;
dbms_output.put_line('before update id '||c_id||' name '||c_name|| ' age ' || age || ' salary '||c_salary);
if age>=1 and age<2 then
update carmechanic set salary=salary+2000 where id=car_id;
select id,name,salary into c_id,c_name,c_salary from carmechanic where id=car_id;
dbms_output.put_line('after update id '||c_id||' name '||c_name||' salary '||c_salary);
return 2000;
elsif age>=2 and age<3 then
update carmechanic set salary=salary+3000 where id=car_id;
select id,name,salary into c_id,c_name,c_salary from carmechanic where id=car_id;
dbms_output.put_line('after update id '||c_id||' name '||c_name||' salary '||c_salary);
return 3000;
elsif age>=3 and age<4 then
update carmechanic set salary=salary+4000 where id=car_id;
select id,name,salary into c_id,c_name,c_salary from carmechanic where id=car_id;
dbms_output.put_line('after update id '||c_id||' name '||c_name||' salary '||c_salary);
return 4000;
else
update carmechanic set salary=salary+5000 where id=car_id;
select id,name,salary into c_id,c_name,c_salary from carmechanic where id=car_id;
dbms_output.put_line('after update id '||c_id||' name '||c_name||' salary '||c_salary);
return 5000;
end if;
end;
/