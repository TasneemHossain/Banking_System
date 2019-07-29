-- Generated by Oracle SQL Developer Data Modeler 17.3.0.261.1541
--   at:        2018-05-29 06:27:51 EDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE USER ENTISHA 
    IDENTIFIED BY  
    DEFAULT TABLESPACE USERS 
    ACCOUNT UNLOCK 
;

GRANT UNLIMITED TABLESPACE TO ENTISHA  WITH ADMIN OPTION
;

CREATE TABLE entisha.account (
    accountno          NUMBER(15) NOT NULL,
    presentbalance     NUMBER(25,10) NOT NULL,
    availablebalance   NUMBER(25,10) NOT NULL,
    accountstatusid    CHAR(4 BYTE),
    accounttype        CHAR(1 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.account
    ADD CHECK (
        accounttype = 'C'
        OR accounttype = 'S'
    );

ALTER TABLE entisha.account
    ADD CONSTRAINT account_pk PRIMARY KEY ( accountno )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.accountcreation (
    customer_id     NUMBER(6),
    account_no      NUMBER(15),
    bblocation_id   NUMBER(4),
    dateopened      DATE NOT NULL,
    dateclosed      DATE,
    accounttype     CHAR(1 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.accountstatus (
    accountstatusid     CHAR(4 BYTE) NOT NULL,
    accountstatusdesc   CHAR(12 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.accountstatus
    ADD CONSTRAINT accountstatus_pk PRIMARY KEY ( accountstatusid )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.atm (
    ablocationid   NUMBER(4) NOT NULL,
    atmnumber      NUMBER(4) NOT NULL,
    atmcashlimit   NUMBER(8,3) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.atm
    ADD CONSTRAINT atm_pk PRIMARY KEY ( ablocationid )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.atm
    ADD CONSTRAINT atm_atmnumber_un UNIQUE ( atmnumber )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.auto (
    aloanno                 NUMBER(15) NOT NULL,
    autodealername          VARCHAR2(30 BYTE) NOT NULL,
    numberstreet            VARCHAR2(25 BYTE) NOT NULL,
    city                    VARCHAR2(15 BYTE) NOT NULL,
    state                   VARCHAR2(12 BYTE) NOT NULL,
    zipcode                 VARCHAR2(5 BYTE) NOT NULL,
    country                 VARCHAR2(20 BYTE) NOT NULL,
    make                    VARCHAR2(15 BYTE) NOT NULL,
    model                   VARCHAR2(15 BYTE) NOT NULL,
    year                    NUMBER(4) NOT NULL,
    vehiclepurchasestatus   VARCHAR2(10 BYTE) NOT NULL,
    vehiclefullprice        NUMBER(15,5) NOT NULL,
    downpayment             NUMBER(10,3) NOT NULL,
    vehicletypeid           NUMBER(5) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.auto
    ADD CONSTRAINT constraint_name CHECK (
        vehiclepurchasestatus = 'OWNED'
        OR vehiclepurchasestatus = 'PREOWNED'
    );

ALTER TABLE entisha.auto
    ADD CONSTRAINT auto_pk PRIMARY KEY ( aloanno )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.banker (
    bankerid          NUMBER(5) NOT NULL,
    bankerfirst       VARCHAR2(20 BYTE) NOT NULL,
    bankerlast        VARCHAR2(20 BYTE) NOT NULL,
    bankercontactno   VARCHAR2(20 BYTE) NOT NULL,
    bankeremail       VARCHAR2(20 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.banker
    ADD CONSTRAINT banker_pk PRIMARY KEY ( bankerid )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.bankinglocation (
    blocationid     NUMBER(4) NOT NULL,
    numberstreet    VARCHAR2(25 BYTE) NOT NULL,
    city            VARCHAR2(15 BYTE) NOT NULL,
    state           VARCHAR2(12 BYTE) NOT NULL,
    zipcode         VARCHAR2(7 BYTE) NOT NULL,
    country         VARCHAR2(20 BYTE) NOT NULL,
    blocationtype   CHAR(1 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.bankinglocation
    ADD CHECK (
        blocationtype = 'B'
        OR blocationtype = 'A'
    );

ALTER TABLE entisha.bankinglocation
    ADD CONSTRAINT bankinglocation_pk PRIMARY KEY ( blocationid )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.bankingtransaction (
    transactionid       NUMBER(5) NOT NULL,
    customerid          NUMBER(6),
    accountno           NUMBER(15),
    blocationid         NUMBER(4),
    transactiontypeid   NUMBER(5),
    transactionamount   NUMBER(20,5) NOT NULL,
    transactiondate     DATE NOT NULL,
    transactiontime     NUMBER(4) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.bankingtransaction
    ADD CONSTRAINT bankingtransaction_pk PRIMARY KEY ( transactionid )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.beneficiary (
    ssnumber    CHAR(11 BYTE) NOT NULL,
    firstname   VARCHAR2(20 BYTE) NOT NULL,
    lastname    VARCHAR2(20 BYTE) NOT NULL,
    dob         DATE NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.beneficiary
    ADD CONSTRAINT beneficiary_pk PRIMARY KEY ( ssnumber )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.borrowed (
    customeri_d     NUMBER(6),
    loann_o         NUMBER(15),
    bblocationi_d   NUMBER(4)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.borrowed (
    customeri_d     NUMBER(6),
    loann_o         NUMBER(15),
    bblocationi_d   NUMBER(4)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.branch (
    bblocationid   NUMBER(4) NOT NULL,
    branchnumbe    NUMBER(4) NOT NULL,
    branchname     VARCHAR2(40 BYTE) NOT NULL,
    managerfirst   VARCHAR2(20 BYTE) NOT NULL,
    managerlast    VARCHAR2(20 BYTE) NOT NULL,
    phonenumber    VARCHAR2(20 BYTE) NOT NULL,
    email          VARCHAR2(50 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.branch
    ADD CONSTRAINT branch_pk PRIMARY KEY ( bblocationid )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.checking (
    caccountno                 NUMBER(15) NOT NULL,
    servicecharge              NUMBER(6,3) NOT NULL,
    overdratprotectionstatus   CHAR(11 BYTE) NOT NULL,
    overdraftprotectionlimit   NUMBER(10,4) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.checking
    ADD CHECK (
        overdratprotectionstatus = 'Activated'
        OR overdratprotectionstatus = 'Deactivated'
    );

ALTER TABLE entisha.checking
    ADD CONSTRAINT checking_pk PRIMARY KEY ( caccountno )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.corporate (
    ccustomerid     NUMBER(6) NOT NULL,
    federaltaxid    CHAR(10 BYTE) NOT NULL,
    companyname     VARCHAR2(20 BYTE) NOT NULL,
    contactname     VARCHAR2(15 BYTE) NOT NULL,
    contactnumber   VARCHAR2(20 BYTE) NOT NULL,
    contactemail    VARCHAR2(50 BYTE) NOT NULL,
    bankerid        NUMBER(5)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.corporate
    ADD CONSTRAINT corporate_pk PRIMARY KEY ( ccustomerid )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.customer (
    customerid     NUMBER(6) NOT NULL,
    numberstreet   VARCHAR2(25 BYTE) NOT NULL,
    city           VARCHAR2(15 BYTE) NOT NULL,
    state          VARCHAR2(12 BYTE) NOT NULL,
    zipcode        VARCHAR2(5 BYTE) NOT NULL,
    country        VARCHAR2(20 BYTE) NOT NULL,
    email          VARCHAR2(50 BYTE),
    phoneno        VARCHAR2(20 BYTE) NOT NULL,
    customertype   CHAR(1 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.customer
    ADD CHECK (
        customertype = 'S'
        OR customertype = 'P'
    );

ALTER TABLE entisha.customer
    ADD CONSTRAINT customer_pk PRIMARY KEY ( customerid )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.degree (
    loanno       NUMBER(15) NOT NULL,
    degree       VARCHAR2(30 BYTE),
    school       VARCHAR2(30 BYTE),
    degreedate   DATE
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.degree
    ADD CONSTRAINT degree_pk PRIMARY KEY ( loanno )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.loan (
    loanno              NUMBER(15) NOT NULL,
    loanamount          NUMBER(20) NOT NULL,
    installmentamount   NUMBER(20) NOT NULL,
    noofinstallment     NUMBER(5) NOT NULL,
    interestrate        NUMBER(4,2) NOT NULL,
    loantermid          NUMBER(5),
    loanstatusid        NUMBER(5),
    cosignername        VARCHAR2(30 BYTE) NOT NULL,
    cosignerssnumber    VARCHAR2(15 BYTE) NOT NULL,
    cosigneraddress     VARCHAR2(60 BYTE) NOT NULL,
    loantype            CHAR(1 BYTE) NOT NULL,
    customerid          NUMBER(6),
    paymentamount       NUMBER(15,5) NOT NULL,
    paymentdate         DATE NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.loan
    ADD CHECK (
        loantype = 'S'
        OR loantype = 'A'
    );

ALTER TABLE entisha.loan
    ADD CONSTRAINT loan_pk PRIMARY KEY ( loanno )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.loanstatus (
    loanstatusid    NUMBER(5) NOT NULL,
    loansatusdesc   VARCHAR2(40 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.loanstatus
    ADD CONSTRAINT loanstatus_pk PRIMARY KEY ( loanstatusid )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.loanterm (
    loantermid     NUMBER(5) NOT NULL,
    loantermdesc   VARCHAR2(10 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.loanterm
    ADD CONSTRAINT loanterm_pk PRIMARY KEY ( loantermid )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.person (
    pcustomerid    NUMBER(6) NOT NULL,
    firstname      VARCHAR2(20 BYTE) NOT NULL,
    lastname       VARCHAR2(20 BYTE) NOT NULL,
    ssnumber       CHAR(11 BYTE) NOT NULL,
    dob            DATE NOT NULL,
    mobilenumber   VARCHAR2(20 BYTE) NOT NULL,
    gender         CHAR(1 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.person
    ADD CHECK (
        gender = 'M'
        OR gender = 'F'
    );

ALTER TABLE entisha.person
    ADD CONSTRAINT person_pk PRIMARY KEY ( pcustomerid )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.personbeneficiary (
    ssnumber       CHAR(11 BYTE) NOT NULL,
    ppcustomerid   NUMBER(6) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX entisha.pk_personbeneficiary ON
    entisha.personbeneficiary (
        ssnumber
    ASC,
        ppcustomerid
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE entisha.personbeneficiary
    ADD CONSTRAINT pk_personbeneficiary PRIMARY KEY ( ssnumber,
    ppcustomerid )
        USING INDEX entisha.pk_personbeneficiary;

CREATE TABLE entisha.savings (
    saccountno                 NUMBER(15) NOT NULL,
    interestrate               NUMBER(4,2) NOT NULL,
    excessivewithdrawpenalty   NUMBER(6,3) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.savings
    ADD CONSTRAINT savings_pk PRIMARY KEY ( saccountno )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.student (
    sloanno              NUMBER(15) NOT NULL,
    schoolname           VARCHAR2(50 BYTE) NOT NULL,
    numberstreet         VARCHAR2(25 BYTE) NOT NULL,
    city                 VARCHAR2(15 BYTE) NOT NULL,
    state                VARCHAR2(12 BYTE) NOT NULL,
    zipcode              VARCHAR2(5 BYTE) NOT NULL,
    country              VARCHAR2(20 BYTE) NOT NULL,
    loanacademicperiod   VARCHAR2(30 BYTE) NOT NULL,
    major                VARCHAR2(30 BYTE),
    estgraduationdate    DATE NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.student
    ADD CONSTRAINT student_pk PRIMARY KEY ( sloanno )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.transactiontype (
    transactiontypeid     NUMBER(5) NOT NULL,
    transactiontypedesc   VARCHAR2(20 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.transactiontype
    ADD CONSTRAINT transactiontype_pk PRIMARY KEY ( transactiontypeid )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE entisha.vehicletype (
    vehicletypeid     NUMBER(5) NOT NULL,
    vehicletypedesc   CHAR(20 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.vehicletype
    ADD CONSTRAINT vehicletype_pk PRIMARY KEY ( vehicletypeid )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE entisha.accountcreation
    ADD CONSTRAINT account_no_fk FOREIGN KEY ( account_no )
        REFERENCES entisha.account ( accountno )
    NOT DEFERRABLE;

ALTER TABLE entisha.bankingtransaction
    ADD CONSTRAINT accountno_fk FOREIGN KEY ( accountno )
        REFERENCES entisha.account ( accountno )
    NOT DEFERRABLE;

ALTER TABLE entisha.account
    ADD CONSTRAINT accountstatusid_fk FOREIGN KEY ( accountstatusid )
        REFERENCES entisha.accountstatus ( accountstatusid )
    NOT DEFERRABLE;

ALTER TABLE entisha.corporate
    ADD CONSTRAINT bankerid_fk FOREIGN KEY ( bankerid )
        REFERENCES entisha.banker ( bankerid )
    NOT DEFERRABLE;

ALTER TABLE entisha.accountcreation
    ADD CONSTRAINT bblocation_id_fk FOREIGN KEY ( bblocation_id )
        REFERENCES entisha.branch ( bblocationid )
    NOT DEFERRABLE;

ALTER TABLE entisha.borrowed
    ADD CONSTRAINT bblocationi_d_fk FOREIGN KEY ( bblocationi_d )
        REFERENCES entisha.branch ( bblocationid )
    NOT DEFERRABLE;

ALTER TABLE entisha.borrowed
    ADD CONSTRAINT bblocationi_d_fkv1 FOREIGN KEY ( bblocationi_d )
        REFERENCES entisha.branch ( bblocationid )
    NOT DEFERRABLE;

ALTER TABLE entisha.bankingtransaction
    ADD CONSTRAINT blocationid_fk FOREIGN KEY ( blocationid )
        REFERENCES entisha.bankinglocation ( blocationid )
    NOT DEFERRABLE;

ALTER TABLE entisha.loan
    ADD CONSTRAINT customer_fk FOREIGN KEY ( customerid )
        REFERENCES entisha.customer ( customerid )
    NOT DEFERRABLE;

ALTER TABLE entisha.accountcreation
    ADD CONSTRAINT customer_id_fk FOREIGN KEY ( customer_id )
        REFERENCES entisha.customer ( customerid )
    NOT DEFERRABLE;

ALTER TABLE entisha.borrowed
    ADD CONSTRAINT customeri_d_fk FOREIGN KEY ( customeri_d )
        REFERENCES entisha.customer ( customerid )
    NOT DEFERRABLE;

ALTER TABLE entisha.borrowed
    ADD CONSTRAINT customeri_d_fkv1 FOREIGN KEY ( customeri_d )
        REFERENCES entisha.customer ( customerid )
    NOT DEFERRABLE;

ALTER TABLE entisha.bankingtransaction
    ADD CONSTRAINT customerid_fk FOREIGN KEY ( customerid )
        REFERENCES entisha.customer ( customerid )
    NOT DEFERRABLE;

ALTER TABLE entisha.borrowed
    ADD CONSTRAINT loann_o_fk FOREIGN KEY ( loann_o )
        REFERENCES entisha.loan ( loanno )
    NOT DEFERRABLE;

ALTER TABLE entisha.borrowed
    ADD CONSTRAINT loann_o_fkv1 FOREIGN KEY ( loann_o )
        REFERENCES entisha.loan ( loanno )
    NOT DEFERRABLE;

ALTER TABLE entisha.loan
    ADD CONSTRAINT loanstatusid_fk FOREIGN KEY ( loanstatusid )
        REFERENCES entisha.loanstatus ( loanstatusid )
    NOT DEFERRABLE;

ALTER TABLE entisha.loan
    ADD CONSTRAINT loantermid_fk FOREIGN KEY ( loantermid )
        REFERENCES entisha.loanterm ( loantermid )
    NOT DEFERRABLE;

ALTER TABLE entisha.personbeneficiary
    ADD CONSTRAINT ppcustomerid_fk FOREIGN KEY ( ppcustomerid )
        REFERENCES entisha.person ( pcustomerid )
    NOT DEFERRABLE;

ALTER TABLE entisha.personbeneficiary
    ADD CONSTRAINT ssnumber_fk FOREIGN KEY ( ssnumber )
        REFERENCES entisha.beneficiary ( ssnumber )
    NOT DEFERRABLE;

ALTER TABLE entisha.student
    ADD FOREIGN KEY ( sloanno )
        REFERENCES entisha.loan ( loanno )
    NOT DEFERRABLE;

ALTER TABLE entisha.auto
    ADD FOREIGN KEY ( aloanno )
        REFERENCES entisha.loan ( loanno )
    NOT DEFERRABLE;

ALTER TABLE entisha.corporate
    ADD FOREIGN KEY ( ccustomerid )
        REFERENCES entisha.customer ( customerid )
    NOT DEFERRABLE;

ALTER TABLE entisha.person
    ADD FOREIGN KEY ( pcustomerid )
        REFERENCES entisha.customer ( customerid )
    NOT DEFERRABLE;

ALTER TABLE entisha.branch
    ADD FOREIGN KEY ( bblocationid )
        REFERENCES entisha.bankinglocation ( blocationid )
    NOT DEFERRABLE;

ALTER TABLE entisha.atm
    ADD FOREIGN KEY ( ablocationid )
        REFERENCES entisha.bankinglocation ( blocationid )
    NOT DEFERRABLE;

ALTER TABLE entisha.checking
    ADD FOREIGN KEY ( caccountno )
        REFERENCES entisha.account ( accountno )
    NOT DEFERRABLE;

ALTER TABLE entisha.savings
    ADD FOREIGN KEY ( saccountno )
        REFERENCES entisha.account ( accountno )
    NOT DEFERRABLE;

ALTER TABLE entisha.degree
    ADD FOREIGN KEY ( loanno )
        REFERENCES entisha.student ( sloanno )
    NOT DEFERRABLE;

ALTER TABLE entisha.bankingtransaction
    ADD CONSTRAINT transactiontypeid_fk FOREIGN KEY ( transactiontypeid )
        REFERENCES entisha.transactiontype ( transactiontypeid )
    NOT DEFERRABLE;

ALTER TABLE entisha.auto
    ADD CONSTRAINT vehicletypeid_fk FOREIGN KEY ( vehicletypeid )
        REFERENCES entisha.vehicletype ( vehicletypeid )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            25
-- CREATE INDEX                             1
-- ALTER TABLE                             60
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
