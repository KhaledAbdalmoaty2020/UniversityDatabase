use universityprojectv5;


/* ---------------------- TRANSACTION in success state ---------------------- */
Begin TRY
BEGIN TRANSACTION
insert into Teaching VALUES('1C',2);
End TRY
BEGIN CATCH
select ERROR_NUMBER()
ROLLBACK
end CATCH

/* ----------------------- TRANSACTION in FALSE state ----------------------- */
Begin TRY
BEGIN TRANSACTION
insert into Teaching VALUES('1C',3);
INSERT into Enroll VALUES(1,1,'2016-02-20 ',);
End TRY
BEGIN CATCH
select ERROR_NUMBER()
ROLLBACK
end CATCH
