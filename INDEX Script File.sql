/*10 indexes*/

1------
CREATE INDEX  IDX_TRANS_DATE ON BANKINGTRANSACTION(TRANSACTIONDATE,CUSTOMERID);
2)----
CREATE INDEX  IDX_ATM_LIMIT ON atm(ATMCASHLIMIT,ATMNUMBER);
3)-----
CREATE INDEX  IDX_OVR_PROTECT ON checking(OVERDRAFTPROTECTIONLIMIT);
4)---
CREATE INDEX  IDX_ATM_COUNT ON bankinglocation(blocationtype,zipcode);
5)---
CREATE INDEX  IDX_GRAD ON student(ESTGRADUATIONDATE,SLOANNO);
CREATE INDEX  IDX_GRADb ON loan(customerid);
6)--
CREATE INDEX  IDX_SERV ON checking(SERVICECHARGE);
7)
CREATE INDEX  IDX_GEN ON PERSON(GENDER,PCUSTOMERID);
8)--
CREATE INDEX  IDX_AUTO ON auto(downpayment,vehiclepurchasestatus);
9)---
CREATE INDEX  IDX_INTRST ON savings(INTERESTRATE);
10)---
CREATE INDEX  IDX_AVV ON accountcreation(dateopened,customerid);