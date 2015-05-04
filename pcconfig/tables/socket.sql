-- create and populate socket

CREATE TABLE "SOCKET" 
   ("NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	  "FAMILY" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	  CONSTRAINT "SOCKET_PK" PRIMARY KEY ("NAME"));
 

insert into socket values ('lga 1156', 'intel');
insert into socket values ('lga 1366', 'intel');
insert into socket values ('lga 1155', 'intel');
insert into socket values ('am2', 'amd');
insert into socket values ('am3', 'amd');