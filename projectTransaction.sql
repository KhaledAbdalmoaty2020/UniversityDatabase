use universityprojectv4;


/* ---------------------- TRANSACTION in success state ---------------------- */

Begin TRY
BEGIN TRANSACTION
insert into Student VALUES(1,'khaled','231@feng',' undergradu level 1'),(2,'wjlks','231@feng',' undergradu level 2');
INSERT into Enroll VALUES(1,1,'2016-02-20 ');
End TRY
BEGIN CATCH
select ERROR_NUMBER()
ROLLBACK
end CATCH

/* ----------------------- TRANSACTION in FALSE state ----------------------- */
Begin TRY
BEGIN TRANSACTION
insert into Student VALUES(1,'khaled','231@feng',' undergradu level 1'),(2,'wjlks','231@feng',' undergradu level 2');
INSERT into Enroll VALUES(1,1,'2016-02-20 ',);
End TRY
BEGIN CATCH
select ERROR_NUMBER()
ROLLBACK
end CATCH