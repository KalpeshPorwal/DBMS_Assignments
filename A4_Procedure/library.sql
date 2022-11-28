delimiter $$
drop procedure if exists Fineamt$$
create procedure Fineamt(in rn int, in bn varchar(20))
BEGIN
    declare amt int default 0;
    declare dateofi date;
    declare diff int default 0;
    select doi into dateofi from borrower where roll = rn and nameofBook = bn;
    select DATEDIFF(CURDATE(), dateofi) INTO diff;
    if (diff >= 15 and diff <= 30) then
        set amt = diff * 5;
    end if;
    if diff > 30 then
        set amt = diff * 50;
    end if;
    if amt = 0 then 
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = "FINE AMOUNT IS NOT SUFFICIENT TO BE NOTED..";
    END IF;
    insert into fine values (rn, CURDATE(), amt);
    update borrower set status = 'R' where roll = rn and nameofBook = bn;
END $$

DELIMITER ;

-- 15 < amt < 30
select * from borrower;
call Fineamt(1, "Computer Networks");
select * from fine;
select * from borrower;
-- amt < 15
call Fineamt(2, "Database Management");
-- amt > 30
call Fineamt(6, "Theory Of Computn");
select * from fine;
select * from borrower;

call Fineamt(5, "Data Commun");
call Fineamt(11, "Dat Commun");


select doi from borrower where roll = 11 and nameofBook = "DJI";
-- empty set


