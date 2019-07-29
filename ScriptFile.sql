CREATE USER Tasneem IDENTIFIED BY 02024  DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp;


CREATE USER Hossain IDENTIFIED BY 19234  DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp;


GRANT CREATE SESSION TO Tasneem;


GRANT SELECT ON entisha.checking TO Tasneem;

SELECT overdraftprotectionlimit
from entisha.checking
where caccountno = 49622220;


GRANT DELETE ON entisha.checking TO Tasneem;


DELETE FROM entisha.checking overdraftprotectionlimit= 900;



GRANT CREATE TABLE TO Tasneem;

GRANT CREATE ANY TABLE TO Tasneem;


CREATE TABLE entisha.BankShareHolders (Bank_Shr_ID  number(10) primary key,Lastname varchar2(15) not null, Firstname varchar2(15) not null);


