/*10 Business report scripts*/

1------

SELECT CUSTOMERID, ACCOUNTNO,TRANSACTIONAMOUNT,TRANSACTIONDATE
FROM BANKINGTRANSACTION
WHERE TRANSACTIONDATE BETWEEN '01-jan-18' and '30-jan-18'

2--------
select ABLOCATIONID,ATMNUMBER
from atm
where ATMCASHLIMIT < 1000;
    
3--------------

SELECT OVERDRAFTPROTECTIONLIMIT
from checking
where caccountno = 49622220;

4----------------------------
select count(blocationtype) as no_of_atm
from bankinglocation
where zipcode = '1RT5'
and blocationtype = 'A'

5----------------
select loan.customerid, LOAN.LOANNO, STUDENT.ESTGRADUATIONDATE
from loan, customer, student
where loan.customerid = customer.customerid
and LOAN.LOANNO = STUDENT.SLOANNO
and ESTGRADUATIONDATE between '15-aug-19' and '31-Dec-19';

6-----

SELECT CACCOUNTNO, SERVICECHARGE
FROM CHECKING
WHERE CACCOUNTNO = 49622220;

7-------------------------------
SELECT LOAN.LOANNO,loan.CUSTOMERID, LOAN.LOANTYPE,PERSON.FIRSTNAME, PERSON.LASTNAME, PERSON.MOBILENUMBER
FROM LOAN,person
where loan.CUSTOMERID = PERSON.PCUSTOMERID
and PERSON.GENDER = 'F';

8----------------------
select Aloanno,downpayment
from auto
where vehiclepurchasestatus = 'PREOWNED'
and downpayment > 5000;


9-----------------------------
select SACCOUNTNO,INTERESTRATE
from savings
where SACCOUNTNO = 29822220;

10---------------------------------------

select  customerid, accountno
from accountcreation
where dateopened between '01-DEC-18' and '31-DEC-18';
