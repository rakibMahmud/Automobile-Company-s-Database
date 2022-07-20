SET SERVEROUTPUT ON
declare
type carid is varray(5) of integer;
extra carid:=carid();
counter integer:=3001;
counter1 integer:=1;
c_id carmechanic.id%type;
c_name carmechanic.name%type;
c_salary carmechanic.salary%type;
 begin
 for counter in 3001..3005
 loop
 extra.extend();
 extra(counter1):=f(counter);
 counter1:=counter1+1;
 end loop;
 counter:=3001;
for counter1 in 1..5
loop
select id,name,salary into c_id,c_name,c_salary from carmechanic where id=counter;
counter:=counter+1;
dbms_output.put_line('Increased salary for id'||c_id||' name '||c_name||' is '||extra(counter1));
end loop;
end;
/