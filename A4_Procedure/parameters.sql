delimiter $$
drop procedure if exists updateCount$$
create procedure updateCount(inout count int, in incr int)
begin
    set count = count + incr;
end$$
delimiter ;
set @counter = 20;

call updateCount(@counter, 5);

select @counter;
-- if count is only out parameter then @counter is NULL