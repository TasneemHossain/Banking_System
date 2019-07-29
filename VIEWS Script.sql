/*10 views*/

1)---
CREATE VIEW BANKING_TRANSACTION
AS 
SELECT CUSTOMERID, ACCOUNTNO,TRANSACTIONAMOUNT,TRANSACTIONDATE
FROM BANKINGTRANSACTION
WHERE TRANSACTIONDATE BETWEEN '01-jan-18' and '30-jan-18'

2)--
CREATE VIEW ATM_LIMIT
AS 
select ABLOCATIONID,ATMNUMBER
from atm
where ATMCASHLIMIT < 1000;

3)--
CREATE VIEW OVRDRFT
AS 
SELECT OVERDRAFTPROTECTIONLIMIT
from checking
where caccountno = 49622220;

4)--
CREATE VIEW ATM_NUM
AS
select count(blocationtype) as no_of_atm
from bankinglocation
where zipcode = '1RT5'
and blocationtype = 'A'

5)--
CREATE VIEW EST_GRAD
AS 
select loan.customerid, LOAN.LOANNO, STUDENT.ESTGRADUATIONDATE
from loan, customer, student
where loan.customerid = customer.customerid
and LOAN.LOANNO = STUDENT.SLOANNO
and ESTGRADUATIONDATE between '15-aug-19' and '31-Dec-19';

6)--
CREATE VIEW SERVICE_CHARGE
AS 
SELECT CACCOUNTNO, SERVICECHARGE
FROM CHECKING
WHERE CACCOUNTNO = 49622220;


7)--
CREATE VIEW CUST_FEMALE
AS
SELECT LOAN.LOANNO,loan.CUSTOMERID, LOAN.LOANTYPE,PERSON.FIRSTNAME, PERSON.LASTNAME, PERSON.MOBILENUMBER
FROM LOAN,person
where loan.CUSTOMERID = PERSON.PCUSTOMERID
and PERSON.GENDER = 'F';

8)--
CREATE VIEW PREOWND_DWNPYMNT
AS
select Aloanno,downpayment
from auto
where vehiclepurchasestatus = 'PREOWNED'
and downpayment > 5000;

9)--
CREATE VIEW INTRST_RATE
AS
select SACCOUNTNO,INTERESTRATE
from savings
where SACCOUNTNO = 29822220;


10)--
CREATE VIEW ACC_OPEN
AS
select  customerid, accountno
from accountcreation
where dateopened between '01-DEC-18' and '31-DEC-18';


