/*10 additional Business report using views*/

1------

SELECT CUSTOMERID, ACCOUNTNO,TRANSACTIONAMOUNT,TRANSACTIONDATE
FROM BANKING_TRANSACTION;

2--------
select ABLOCATIONID,ATMNUMBER
from ATM_LIMIT
    
3--------------

SELECT OVERDRAFTPROTECTIONLIMIT
from OVRDRFT;

4----------------------------
select  no_of_atm
from ATM_NUM;

5----------------
select customerid, LOANNO, ESTGRADUATIONDATE
from EST_GRAD;

6-----

SELECT CACCOUNTNO, SERVICECHARGE
FROM SERVICE_CHARGE;

7-------------------------------
SELECT LOANNO,CUSTOMERID,LOANTYPE,FIRSTNAME,LASTNAME,MOBILENUMBER
FROM CUST_FEMALE;

8----------------------
select Aloanno,downpayment
from PREOWND_DWNPYMNT;



9-----------------------------
select SACCOUNTNO,INTERESTRATE
from INTRST_RATE;

10---------------------------------------

select  customerid, accountno
from ACC_OPEN;
