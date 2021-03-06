drop table purchase; 

CREATE TABLE PURCHASE 
(
  DATEID VARCHAR2(30) NOT NULL 
, CLIENT VARCHAR2(100) NOT NULL 
, CPU VARCHAR2(100) NOT NULL 
, MOBO VARCHAR2(100) NOT NULL 
, RAM VARCHAR2(100) NOT NULL 
, VGA VARCHAR2(100) NOT NULL 
, PRICE NUMBER NOT NULL 
, CONSTRAINT PURCHASE_PK PRIMARY KEY (DATEID, CLIENT) ENABLE 
);

ALTER TABLE PURCHASE
  ADD CONSTRAINT PURCHASE_CLIENT_FK1 FOREIGN KEY (CLIENT)
  REFERENCES CLIENT (NAME) ENABLE;
