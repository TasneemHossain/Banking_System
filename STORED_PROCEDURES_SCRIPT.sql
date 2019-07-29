/*10 Stored Procedures */

1----------------------
CREATE OR REPLACE PROCEDURE usptrndate (inp_transactiondateto in date,inp_transactiondatefrom in date) as
    cursor trndate_cursor is
    select CUSTOMERID, Accountno,transactionamount,transactiondate
    from bankingtransaction
    where transactiondate between inp_transactiondateto and inp_transactiondatefrom;
     v_CUSTOMERID number;
    v_Accountno number;
    v_transactionamount number;
    v_transactiondate date;
Begin
    open trndate_cursor;
    Loop
        fetch trndate_cursor into v_CUSTOMERID,v_Accountno,v_transactionamount,v_transactiondate;
        Exit when trndate_cursor%NOTFOUND;
        DBMS_output.put_line ('CUSTOMERID: '||v_CUSTOMERID||'  Accountno: '||v_Accountno ||
        '  transactionamount: '||v_transactionamount||'  transactiondate: '||v_transactiondate);
    End loop;
    close trndate_cursor;
End;
EXEC usptrndate ('01-jan-18','30-jan-18');

2--------------------------------------------------
CREATE or replace PROCEDURE uspatmlimit (inp_ATMCASHLIMIT in number)
as
    cursor cur_cursor is
    select ABLOCATIONID,ATMNUMBER
    from atm
    where ATMCASHLIMIT < inp_ATMCASHLIMIT;
    
    v_ablocationid number;
    v_ATM_NUM number;
Begin
    open cur_cursor;
    Loop
        fetch cur_cursor into v_ablocationid,v_ATM_NUM;
        Exit when cur_cursor%NOTFOUND;
        DBMS_output.put_line ('ATM ID: '||v_ablocationid||'  ATM Number: '||v_ATM_NUM);
    End loop;
    close cur_cursor;
End;
EXEC uspatmlimit (1000);

3------------------------------------------------------
Create or replace Procedure uspgetmob (inp_CACCOUNTNO in number)
as
    cursor getmob_cursor is
        select OVERDRAFTPROTECTIONLIMIT
        from checking
        where CACCOUNTNO =inp_CACCOUNTNO;  
        v_OVERDRAFTPROTECTIONLIMITE NUMBER;
       
begin
    open getmob_cursor;
     loop
       fetch getmob_cursor into v_OVERDRAFTPROTECTIONLIMITE;
       EXIT WHEN getmob_cursor%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE('Over_Draft_Protection_Limit: '||v_OVERDRAFTPROTECTIONLIMITE);
      end loop;
     close getmob_cursor;
 end; 
 
Execute uspgetmob (49622220);

4----------------------------------------------
CREATE or replace  PROCEDURE uspcntatm (inp_zipcode in varchar2, inp_BLOCATIONTYPE in char)
as
    cursor cntatm_cursor is
    select count(blocationtype) 
    from bankinglocation
    where zipcode = inp_zipcode
    and blocationtype = inp_BLOCATIONTYPE;

    v_blocationtype char;
Begin
    open cntatm_cursor;
    Loop
        fetch cntatm_cursor into v_blocationtype;
        Exit when cntatm_cursor%NOTFOUND;
        DBMS_output.put_line ('No_Of_ATM: '||v_blocationtype);
    End loop;
    close cntatm_cursor;
End;
EXEC uspcntatm ('1RT5', 'A');

5--------------------------------------------------
CREATE or replace PROCEDURE uspestgradate (inp_estdateto in DATE,inp_estdatefrom in DATE) as
    cursor estgradate_cursor is
    select loan.customerid, LOAN.LOANNO, STUDENT.ESTGRADUATIONDATE
    from loan, customer,STUDENT
    where loan.customerid = customer.customerid
    and LOAN.LOANNO = STUDENT.SLOANNO
    and STUDENT.ESTGRADUATIONDATE between inp_estdateto and inp_estdatefrom;
    v_CUSTOMERID loan.customerID%type;
    v_LOANNO LOAN.LOANNO%type;
    v_ESTGrad STUDENT.ESTGRADUATIONDATE%type;
Begin
    open estgradate_cursor;
    Loop
        fetch estgradate_cursor into v_CUSTOMERID,v_LOANNO, v_ESTGrad;
        Exit when estgradate_cursor%NOTFOUND;
        DBMS_output.put_line ('CUSTOMERID: '||v_CUSTOMERID||'  Loan no: '||v_LOANNO||'  Grad Date: '||v_ESTGrad);
    End loop;
    close estgradate_cursor;
End;
EXEC uspestgradate  ('15-aug-19' , '31-Dec-19');

6---------------------------------------------
CREATE OR REPLACE PROCEDURE uspsercharge (inp_CACCOUNTNO in number)
as
    cursor sercharge_cursor is
    SELECT CACCOUNTNO, SERVICECHARGE
    FROM CHECKING
    WHERE CACCOUNTNO = inp_CACCOUNTNO;

    v_CACCOUNTNO NUMBER;
    v_SERVICECHARGE NUMBER;
     
Begin
    open sercharge_cursor;
    Loop
        fetch sercharge_cursor into v_CACCOUNTNO,v_SERVICECHARGE;
        Exit when sercharge_cursor%NOTFOUND;
        DBMS_output.put_line ('Accountno: '|| v_CACCOUNTNO ||'  ServiceCharge: '||v_SERVICECHARGE);
    End loop;
    close sercharge_cursor;
End;
Execute uspsercharge (49622220);

7-----------------------------------------------
CREATE OR REPLACE PROCEDURE uspgenln (inp_GENDER in PERSON.GENDER%type) as
    cursor genln_cursor is
    SELECT LOAN.LOANNO,loan.CUSTOMERID, LOAN.LOANTYPE,PERSON.FIRSTNAME, PERSON.LASTNAME, PERSON.MOBILENUMBER
    FROM LOAN,person
    where loan.CUSTOMERID = PERSON.PCUSTOMERID
    and PERSON.GENDER = inp_GENDER;
    v_LOANNO LOAN.LOANNO%type;
    v_CUSTOMERID loan.CUSTOMERID%type;
    v_LOANTYPE LOAN.LOANTYPE%type;
    v_FIRSTNAME PERSON.FIRSTNAME%type;
    v_LASTNAME PERSON.LASTNAME%type;
    v_MOBILENUMBER PERSON.MOBILENUMBER%type;
Begin
    open genln_cursor;
    Loop
        fetch genln_cursor into v_LOANNO,v_CUSTOMERID,v_LOANTYPE,v_FIRSTNAME,v_LASTNAME,v_MOBILENUMBER;
        Exit when genln_cursor%NOTFOUND;
        DBMS_output.put_line ('LOANNO: '||v_LOANNO||'  CUSTOMERID: '||v_CUSTOMERID ||'  LOANTYPE: '||
        v_LOANTYPE ||'  FIRSTNAME: '||v_FIRSTNAME ||'  LASTNAME: '||v_LASTNAME ||'  MOBILENUMBER: '||v_MOBILENUMBER);
    End loop;
    close genln_cursor;
End;
Exec uspgenln ('F');

8-------------------------------------------------
Create or replace procedure uspdwnpymt (inp_vehiclepurchasestatus in auto.vehiclepurchasestatus%type,inp_downpayment in auto.downpayment%type)
as
    cursor dwnpymt_cursor is
        select Aloanno, downpayment
        from auto
        where vehiclepurchasestatus = inp_vehiclepurchasestatus
        and downpayment > inp_downpayment;
        v_Aloanno auto.Aloanno%type;
        v_downpayment auto.downpayment%type;       
begin
    open dwnpymt_cursor;
     loop
       fetch dwnpymt_cursor into v_Aloanno,v_downpayment;
       EXIT WHEN dwnpymt_cursor%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE('Customer ID:'||v_Aloanno||'  Down Payment: '|| v_downpayment);
      end loop;
     close dwnpymt_cursor;
 end;  
exec uspdwnpymt('PREOWNED',5000);

9-----------------------------

CREATE OR REPLACE PROCEDURE uspsav_inrstrt (inp_SACCOUNTNO in number)
as
    cursor sav_inrstrt_cursor is
    select SACCOUNTNO,INTERESTRATE
    from savings
    where SACCOUNTNO = inp_SACCOUNTNO;
    
    v_SACCOUNTNO number;
    v_INTERESTRATE number;
    
Begin
    open sav_inrstrt_cursor;
    Loop
        fetch sav_inrstrt_cursor into v_SACCOUNTNO,v_INTERESTRATE;
        Exit when sav_inrstrt_cursor%NOTFOUND;
        DBMS_output.put_line ('Accountno: '||v_SACCOUNTNO||'  INTEREST_RATE: '||v_INTERESTRATE);
    End loop;
    close sav_inrstrt_cursor;
End;
EXEC uspsav_inrstrt (29822220);

10------------------------------------------------------
CREATE OR REPLACE PROCEDURE uspcraccdt (inp_accountcreatedateto in date,inp_accountcreatedatefrom in date)
as
    cursor craccdt_cursor is
    select  customerid, accountno
    from accountcreation
    where dateopened between inp_accountcreatedateto and inp_accountcreatedatefrom;
    
    v_CUSTOMERID number;
    v_Accountno number;

Begin
    open craccdt_cursor;
    Loop
        fetch craccdt_cursor into v_CUSTOMERID,v_Accountno;
        Exit when craccdt_cursor%NOTFOUND;
        DBMS_output.put_line ('CUSTOMERID: '||v_CUSTOMERID||'  Accountno: '||v_Accountno);
    End loop;
    close craccdt_cursor;
End;
EXEC uspcraccdt('01-DEC-18','31-DEC-18');
