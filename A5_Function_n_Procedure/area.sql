delimiter $$
create procedure area()
begin
declare radius int ;
declare area float;
set radius = 5;
loop1: LOOP
    if radius = 10 then
        leave loop1;
    else
        set area = 3.14 * radius * radius;
        insert into Areas values (radius, area);
        set radius = radius + 1;
    end if;

end LOOP;
End$$