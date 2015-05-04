DROP TABLE CHIPSET;

CREATE TABLE CHIPSET 
(
  NAME VARCHAR2(50) NOT NULL 
, SOCKET VARCHAR2(50) NOT NULL 
, DDRTYPE VARCHAR2(20) NOT NULL 
, SLI NUMBER NOT NULL 
, XFIRE NUMBER NOT NULL 
, CONSTRAINT CHIPSET_PK PRIMARY KEY (NAME) ENABLE
) ;

ALTER TABLE CHIPSET
  ADD CONSTRAINT CHIPSET_SOCKET_FK1 FOREIGN KEY (SOCKET)
  REFERENCES SOCKET (NAME) ENABLE;
  
ALTER TABLE CHIPSET
  ADD CONSTRAINT CHIPSET_DDRTYPE_FK1 FOREIGN KEY (DDRTYPE)
  REFERENCES DDRTYPE (NAME) ENABLE;

insert into chipset  values ('intel h67', 'lga 1155', 'ddr3', 0, 0);
insert into chipset  values ('intel p67', 'lga 1155', 'ddr3', 0, 0);
insert into chipset  values ('intel h55', 'lga 1156', 'ddr3', 0, 0);
insert into chipset  values ('intel p55', 'lga 1156', 'ddr3', 1, 1);
insert into chipset  values ('intel x58', 'lga 1366', 'ddr3', 1, 1);
insert into chipset  values ('geforce 8200', 'am2', 'ddr2', 0, 0);
insert into chipset  values ('amd 760g', 'am2', 'ddr2', 0, 0);
insert into chipset  values ('amd 880g', 'am3', 'ddr3', 0, 0);
insert into chipset  values ('amd 890fx', 'am3', 'ddr3', 0, 1);


 
