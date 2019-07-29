/*Tasneem Hossain

											Tas_BankingSystem



-----Following are Create Table statements and then the Insert statements. The database has 8 tables.

--Table1
CREATE TABLE Customer(
CustomerID int PRIMARY KEY,
Address Varchar(100) NOT NULL,
Email Varchar(50) NULL,
PhoneNo Varchar(20) NOT NULL,
CustomerType CHAR(1) CHECK(CustomerType='C' or CustomerType='R') NOT NULL);

INSERT INTO CUSTOMER VALUES(9898,'10TH STREET','BALL@B.COM','313-000-4533','C');
INSERT INTO CUSTOMER VALUES(5656,'90TH STREET','CAALL@B.COM','414-565-0000','R');
INSERT INTO CUSTOMER VALUES(7070,'18TH STREET','MRALL@B.COM','212-890-5666','C');
INSERT INTO CUSTOMER VALUES(8080,'71TH STREET','POALL@B.COM','917-123-7077','R');
INSERT INTO CUSTOMER VALUES(6545,'13TH STREET','ZALL@B.COM','347-432-8977','C');

--Table2


CREATE TABLE Corporate(
CCustomerID int PRIMARY KEY REFERENCES Customer(CustomerID), 
CompanyName Varchar(20) NOT NULL,
ContactName Varchar(15) NOT NULL,
ContactNumber Varchar(20) NOT NULL,
ContactEmail Varchar(50) NOT NULL);



INSERT INTO CORPORATE VALUES(9898,'ZEBRA', 'MASLOW','450-901-8999','Z@ZMAIL.COM');
INSERT INTO CORPORATE VALUES(7070,'DOG','ALBABY','678-890-8900','A@AOL.COM');
INSERT INTO CORPORATE VALUES(6545,'RAMBO','RILEY','143-560-1233','R@ROL.COM');



--Table3


CREATE TABLE Regular_Customer (
RCustomerID  int PRIMARY KEY REFERENCES Customer(CustomerID), 
Name Varchar(20),
SSNumber Char(11) NOT NULL,
DOB Date NOT NULL,
MobileNumber Varchar(20) NOT NULL,
Gender Char(1) CHECK(Gender='M' or Gender='F') NOT NULL);



INSERT INTO Regular_Customer VALUES(5656,'JEWELS','182-40-1055','16-AUG-1997','451-444-4334','M');
INSERT INTO Regular_Customer VALUES(8080,'ROYALS','909-40-9293','26-JAN-1992','651-444-4334','F');

--Table4


CREATE TABLE Account(
AccountNo int PRIMARY KEY,
CustomerID int,
PresentBalance Decimal(25,10) NOT NULL,
AccountStatus Varchar(11) CHECK (AccountStatus= 'Activated' or AccountStatus='Deactivated') NOT NULL,
AccountType CHAR(1) CHECK (AccountType= 'C' or AccountType='S') NOT NULL,
Service_fee char(1)  check (Service_fee = 'Y' or Service_fee = 'N') NOT NULL,
CONSTRAINT CustomerID_FK FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID));

INSERT INTO ACCOUNT VALUES(10000045,9898,10000,'Activated','C','Y');
INSERT INTO ACCOUNT VALUES(19822220,7070,15000,'Activated','S','Y');
INSERT INTO ACCOUNT VALUES(49622220,6545,0,'Deactivated','C','N');
INSERT INTO ACCOUNT VALUES(29822220,8080,0,'Deactivated','S','N');
INSERT INTO ACCOUNT VALUES(12345678,5656,5000,'Activated' ,'C','Y');



--Table5



CREATE TABLE Checking(
CAccountNo int PRIMARY KEY REFERENCES Account(AccountNo),
ServiceCharge Decimal(6,3) NOT NULL)



INSERT INTO CHECKING VALUES(10000045,50);
INSERT INTO CHECKING VALUES(49622220,25);
INSERT INTO CHECKING VALUES(12345678,25);



--Table6


CREATE TABLE Savings(
SAccountNo int PRIMARY KEY REFERENCES Account(AccountNo),
InterestRate Decimal (4,2) NOT NULL)


INSERT INTO SAVINGS VALUES(19822220,12.99);
INSERT INTO SAVINGS VALUES(29822220,2.99);


--Table7



CREATE TABLE BankingLocation(
BLocationID int PRIMARY KEY,
CustomerID int,
NumberStreet Varchar(25) NOT NULL,
City Varchar(15) NOT NULL,
State Varchar(12) NOT NULL,
Zipcode VARCHAR(7) NOT NULL,
Country Varchar(20) NOT NULL,
ATM Char(1) CHECK (ATM = 'Y' or ATM= 'N') NOT NULL
CONSTRAINT CustomerID FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID));




INSERT INTO BankingLocation VALUES(1040,9898,'30 HELBO','WILLIAMSBURG','NY','13ER','USA','Y');
INSERT INTO BankingLocation VALUES(5608,5656,'50 AVENUE','DUMBO','FL','78UTE','USA','N');;
INSERT INTO BankingLocation VALUES(4500,7070,'35 BRAODWAY','LONG ISLAND','TX','89UR','BANGLADESH','Y');
INSERT INTO BankingLocation VALUES(5609,8080,'88 NORTHERN','ASTORIA','VA','78UTE','USA','N');
INSERT INTO BankingLocation VALUES(0987,6545,'40 SKILLMAN','JACKSON HEIGHTS','NC','POO1','MALDIVES','N');


--Table8


CREATE TABLE Loan (
LoanID int PRIMARY KEY,
NoOfInstallment int NOT NULL, 
LoanType Char(1) CHECK (LoanType ='H' or LoanType='A') NOT NULL,
NoOfPayments int,
CustomerID int,
CONSTRAINT CustomerID_FK2 FOREIGN KEY (CustomerID)REFERENCES Customer(CustomerID));

INSERT INTO LOAN VALUES(234,74,'H',10,9898);
INSERT INTO LOAN VALUES(121,20,'H',10,5656);
INSERT INTO LOAN VALUES(890,14,'A',7,7070);


----These are the select statements


Select * From Customer;
Select * From Corporate;
Select * From Regular_Customer;
Select * From Account;
Select * From Checking;
Select * From Savings;
Select * From BankingLocation;
Select * From Loan;
 

---Drop table statements

drop table Customer;
drop table Corporate;
drop table Regular_Customer;
drop table Account;
drop table Checking;
drop table Savings;
drop table BankingLocation;
drop table Loan;


---Below are 13 scripts/reports



/*if there is a situtation where we are dealing with SQL Server that only have
Windows authentication turned on, we can extract the logins using the below query
Filtering by type to only get users and groups
Filtering by name to eliminate NT SERVICE\, the service used to connect to the database, and NT AUTHORITY, which is 
the Local System account with highest level privileges on the local system) */

SELECT 'CREATE LOGIN [' + name + '] as  FROM WINDOWS;' 
FROM sys.server_principals 
WHERE type IN ('U', 'G')
  AND LEFT(name, 4) NOT IN ('NT A', 'NT S');

  
  
 /*The query below shows how to find the accountno of the customers who has a present balance
more than or equal to 10k so that the company can give them gold membership or more facilities. I used
where clause to join the tables with the customer id and then found the account that has balance more
than or equal to 10k */

Select Customer.CustomerID, Account.AccountNo, Account.PresentBalance
from Customer, Account
where Customer.CustomerID = Account.CustomerID
and Account.PresentBalance >= 10000;



/*The query below shows the name of the owner/creator of the database,
SUSER_SNAME returns the login name associated with a security identification number (SID) and
DB_ID function returns the database identification (ID) number of a specified database*/

Select SUSER_SNAME(owner_sid) as Owner_Name
From sys.databases
Where database_id = DB_ID();



/*The query below also shows the creator name/owner name but also shows which database,
so this more specific */

select name AS 'Database',suser_sname(owner_sid) AS 'Creator'
from sys.databases
WHERE name = 'Tas_BankingSystem'




/*The query below shows the Regular CustomerId, name, account no, from
2 different tables regular customer and account whose age is below 25 and service fee status
so that the company can waive their service fee. I have find the age by the datediff function, which
returns the count of the specified datepart boundaries crossed between the specified startdate and enddate.
and getdate which gets the date.  */

select  Regular_Customer.rCustomerID,DATEDIFF(yy,Regular_Customer.dob,getdate())  as Age, Regular_Customer.name, account.accountno, account.service_fee
from Regular_Customer, account
where Regular_Customer.rCustomerID = account.CustomerID
and (DATEDIFF(yy,Regular_Customer.dob,getdate())) < 25;


/*The query below shows the customer id who took loan, loanId and their type of loan, number of installments
and the number of payments for those who has paid half the installments, which I did by dividing number of installments by 2
in that way they have made half the installments and the company can lower their interest rate.*/

Select Loan.CustomerID, Loan.NoOfInstallment, Loan.LoanType, Loan.NoOfPayments, loan.loanId
from Customer, loan
where Customer.CustomerID = loan.CustomerID
and Loan.NoOfPayments = (Loan.NoOfInstallment/2);


/*The query below shows which table was most queried. First I gave the count column a name of most queried 
and made sure with the distinct that there is no duplicate value considered.I did an inner join at SysDepends , 
which contains dependency information between objects (views, procedures, and triggers)
in the database, and the objects (tables, views, and procedures) that are contained in their definition and another
inner join at SysObjects , which contains a row for each user-defined, schema-scoped object that is created within the database, 
the DepId, which is Dependent object ID, to id ,which is the object id. The name is Object name,id is Object identification number
and xtype is the Object type.Then I did a Group by to sort them alphabetical order and order by with descend so the values display
in descending order*/

SELECT TableName, COUNT(*) as MostQueried
FROM ( Select Distinct o.Name 'TableName', op.Name 'DependentObject' 
From SysObjects o 
INNER Join SysDepends d ON d.DepId = o.Id 
INNER Join SysObjects op on op.Id = d.Id Where o.XType = 'U' Group by o.Name, o.Id, op.Name ) x 
GROUP BY TableName ORDER BY MostQueried desc


/*The query below shows the customer, account type and account status where it is deactivated
so that new offers can be sent to them to activate their account. It has a sub query that gets executed first
and finds the deactivated status then looks for the customer ID for that */

select account.customerid, account.accountstatus, account.Accounttype
from account
where customerid = any (select customerid from account where accountstatus = 'deactivated');



/*The query below shows the bank loaction with zipcode that shows if the location has atm or not
which is denoted by N, meaning no atm. This is needed because the company wants to find out which location do
not has atm so that they can install also they have multiple locations with no Atm in the same zipcode so they
want to keep track of that so that once all the location is filled with atm with different zipcode
if they have the budget they will install atm to the locations in the same zipcode*/

select zipcode, blocationid, atm
from bankinglocation
where atm = 'N';


/*The query below shows all the customer with the savings account who has a balance of 15000 
and will give a offer of depositing more 2k which will reduce the interest rate by 2 %. I did 
an inner join to find the account number of the savings account and checked the balance if it
is more than or equal to 15k  */

select account.presentbalance , account.accounttype, savings.interestrate
from account
inner join savings on account.accountno = savings.saccountno
and account.presentbalance >= 15000

/*The query below shows the name of the database and the log space being used by the databae
and the available space. The cast convert the value to an int datatype and 
FILEPROPERTY returns the specified file name property value which I subtracted and got the empty space.
Also divided by 128 to get the result in MB*/ 

SELECT DB_NAME() AS DbName, 
name AS FileName, 
size/128.0 AS CurrentSizeMB, 
size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS INT)/128.0 AS FreeSpaceMB 
FROM sys.database_files;


----Union---


/* This query shows the customer who has account and their primary branch along with the address
for only USA customer. So this query will find the primary branch of the customers. I did sub query of union 
and then did an inner join, then filtered by country. */

select *
from 
(
    select Account.CustomerID 
    FROM Account
    UNION
    select Customer.CustomerID 
    FROM Customer
) Loan
INNER JOIN BankingLocation
ON  BankingLocation.CustomerID = Loan.CustomerID 
and country = 'usa'


/*The query below shows the union of regular customer table to loan
to find the customer who is a female and has a house loan with the bank
so that the bank can offer to take auto loan with low monthly payments
as they have gained the trust by holding the house loan*/

SELECT RCustomerID,Gender as genderandloantype
FROM Regular_Customer
WHERE Gender = 'F'
UNION 
SELECT CustomerID,LoanType
FROM Loan
WHERE LoanType ='H'


-------Below are all stored procedures


/*This stored procedure takes the parameter customer id and and creditscore 
in order to determine the customer is pre qualified for loan based on
number of loan the person has taken from the bank and the creditscore.
So if the person has number of loans less than and equal to 1 and a 
credit score of range , equal and greater than 500 then only the
person is pre qualified qualified for loan or else the person is not qualified.
Also the customer id has to be valid as the teller will be putting it*/.




create procedure sploanapprove
				 @customerid int,
				 @creditscore decimal
as
begin
DECLARE @numberofloans int

set @numberofloans = 		
		 (SELECT  count (loantype)
FROM loan
WHERE EXISTS  (select Customer.CustomerID, loan.loantype
from loan, Customer
where Customer.CustomerID = loan.CustomerID
and loantype = 'S' or loantype = 'a'))

if  @numberofloans <= 1 and  (@creditscore >= 500 AND @creditscore <= 900 )
	
	print 'pre qualified'


else 
	print 'not qualified'
end	

execute sploanapprove @customerid = 9898, @creditscore = 1100




/*This stored procedure is created to delete the records of the corporate customer
who is no longer holding the business or they have asked to delete their record or
closed their acccount  */


CREATE PROCEDURE usp_DeleteCustomerRecord
    (@CCustomerID int ,
     @CompanyName Varchar(20),
     @ContactName Varchar(15),
     @ContactNumber Varchar(20),
     @MContactEmail Varchar(50))
AS 
BEGIN
    DELETE from Corporate 
    WHERE CCustomerID = @CCustomerID
END




/*This stored procedure is created to get the value of the customers
who is a female and has a house loan and they are eligible to take a auto loan
with zero downpayments  */

create procedure spzerodownpayment 
as
begin
begin try
begin transaction
 (SELECT RCustomerID,Gender
FROM Regular_Customer
WHERE Gender = 'F'
UNION 
SELECT CustomerID,LoanType
FROM Loan
WHERE LoanType ='H') 
 Commit transaction
 end try
 begin catch
 print 'no customer'
 end catch
end

exec spzerodownpayment



/*This stored procedure basically update the balance of the 2 accounts
from which amount is taken and transfered to another.It takes the parameter 
amount, from which account to which account.I have assumed that the teller knows the customer info via their
id, card, so the account number will be valid.*/


CREATE PROCEDURE spupdatepresentbal	
		@amounttransfered decimal,
		@accountfrom int,
		@accountto int
As
begin
begin try
begin transaction
begin
update dbo.Account 
 set presentbalance = presentbalance - @amounttransfered  
 where AccountNo = @accountfrom
 end

 begin
 update dbo.Account
 set presentbalance = presentbalance + @amounttransfered 
 where AccountNo = @accountto
 end
 Commit transaction
 end try
 begin catch
	if @@TRANCOUNT > 0
		rollback transaction
		declare @ErrorMessage varchar(100) 
		set @ErrorMessage = Error_Message();
		end catch

end


/*This stored procedure calls for the above stored procedure. It takes the same
parameter as above but checks for conditions, if conditions are correct
then only it calls the above stored proc to upate the balance. So this
stored procedure basically transfers money. So first it checks if the
account has the money that is requested to trasnfer, if it does 
then it executes the above procedure to update the balance in other words transferring
the money. If it doesnot have the money in account, it prints the message
insuffucient fund. I have assumed that the teller knows the customer info via their
id, card, so the account number will be valid.*/


create procedure sptransfermoney	
				@accountfrom int,
				@accountto int,
				@amounttransfered decimal
			
as
begin
begin try
begin transaction
if
	@amounttransfered <= (select presentbalance from Account where AccountNo = @accountto )
	begin
	 EXEC spupdatepresentbal @amounttransfered = @amounttransfered , @accountfrom = @accountfrom, @accountto = @accountto 
	print
    (' amount has been transferred')
	end 
else 
	begin
		print 'You do not have sufficient balance'
	end
	Commit transaction
 end try
 begin catch
	if @@TRANCOUNT > 0
		rollback transaction
		declare @ErrorMessage varchar(100) 
		set @ErrorMessage = Error_Message();
		end catch

end

execute sptransfermoney @accountfrom =10000045,  @accountto = 19822220, @amounttransfered = 100
select * from Account;
