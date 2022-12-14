alter table Borrower add primary key(roll, nameOfBook);
alter table Fine add primary key(roll);
-------------------------------------------------------------------------------------------
delimiter $$
drop procedure if exists FineAmt$$
 create procedure FineAmt(in rollno int, in bn varchar(20))
   begin
   declare amt int default 0;
   declare dateofi date;
   declare diff int default 0;
   select doi into dateofi from Borrower where roll = Roll and nameOfBook = bn;
   select DATEDIFF(CURDATE(), dateofi) into diff;
   if diff > 30 then
   set amt = diff * 10;
   else
   set amt = diff * 5;
   end if;
   if amt > 0 then
   insert into Fine values(rollno, CURDATE(), amt);
   end if;
   end $$
delimiter ;
call FineAmt(5,"Game Dev");
select * from Fine;
-----------------------EXCEPTION--------------------------------------
delimiter $$
drop procedure if exists FineAmtE$$
create procedure FineAmtE(in rollno int, in bn varchar(20))
begin
   declare amt int default 0;
   declare dateofi date;
   declare diff int default 0;
   select doi into dateofi from Borrower where roll = Roll and nameOfBook = bn;
   select DATEDIFF(CURDATE(), dateofi) into diff;
   if diff < 0 then
      SIGNAL SQLSTATE '45000'
         set MESSAGE_TEXT = "No. of days can't be negative";
   end if;
   if diff > 30 then
      set amt = diff * 10;
   else
      set amt = diff * 5;
   end if;
   if amt > 0 then
      insert into Fine values(rollno, CURDATE(), amt);
   end if;
   update Borrower set status = 'R' where roll = rollno and nameOfBook = bn;
end $$
---------------------------------------------------------------------------------
delimiter $$
drop procedure if exists FineAmt$$
 create procedure FineAmt(in rollno int, in bn varchar(20), out diff int)
   begin
   declare amt int default 0;
   declare dateOfI date;
   select doi from Borrower where roll = Roll and nameOfBook = bn  into dateOfI;
   select DATEDIFF(CURDATE(), dateOfI) into diff;
   if diff > 30 then
   set amt = diff * 10;
   else
   set amt = diff * 5;
   end if;
   if amt > 0 then
   insert into Fine values(rollno, CURDATE(), amt);
   end if;
   end $$
delimiter ;
call FineAmt(5,"Game Dev", @diff);
select @diff;
-----------------------------------------------------------------------------------------------
delimiter $$
drop procedure if exists FineAmt$$
 create procedure FineAmtOut(inout Roll int, in bn varchar(20), out amt int)
   begin
   declare DOI date;
   declare diff int default 0;
   select doi into DOI from Borrower where roll = Roll and nameOfBook=bn  ;
   select DATEDIFF(CURDATE(), DOI) into diff;
   if diff > 30 then
   set amt = diff * 10;
   else
   set amt = diff * 5;
   end if;
   if amt > 0 then
   insert into Fine values(Roll, CURDATE(), amt);
   end if;
   end $$
delimiter ;
set @roll = 5;
call FineAmtOut(@roll,"Game Dev", @amt);
select * from Fine;
-----------------------------------------------------------------------------------------------
delimiter $$
drop procedure if exists FineAmt$$
 create procedure FineAmt(in Roll int, in bn varchar(20))
   begin
   declare amt int default 0;
   declare DOI date;
   declare diff int default 0;
   select doi into DOI from Borrower where roll = Roll and bn = nameOfBook;
   select DATEDIFF(CURDATE(), DOI) into diff;
   if diff > 30 then
   set amt = diff * 10;
   else
   set amt = diff * 5;
   end if;
   if amt > 0 then
   update Fine set roll = Roll, dof = CURDATE(), Fine.amt = amt;
   end if;
   end $$
delimiter ;
call FineAmt(5,"Game Dev");
-----------------------------------------------------------------------------------------------
delimiter $$
drop procedure if exists FineAmt$$
create procedure FineAmt(in Roll int, out amt int)
   begin
   declare diff int default 0;
   declare DOI date;
   select doi into DOI from Borrower where roll = Roll;
   select DATEDIFF(CURDATE(), DOI) INTO diff;
   if diff > 30 then
   set amt = diff * 10;
   else
   set amt = diff * 5;
   end if;
   end $$
delimiter ;
call FineAmt(5, @amt);
select @amt;
