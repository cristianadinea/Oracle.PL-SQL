DROP TABLE DDRTYPE;

CREATE TABLE DDRTYPE 
(
  NAME VARCHAR2(20) NOT NULL 
, CONSTRAINT DDRTYPE_PK PRIMARY KEY (NAME) ENABLE 
);

insert into ddrtype values ('ddr2');
insert into ddrtype values ('ddr3');
