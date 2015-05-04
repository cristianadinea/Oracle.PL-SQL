-- create and populate CPU
drop table CPU;

CREATE TABLE CPU 
(
  NAME VARCHAR2(100) NOT NULL 
, SOCKET VARCHAR2(20) NOT NULL 
, CORES NUMBER NOT NULL 
, CLOCK NUMBER NOT NULL 
, POWER NUMBER NOT NULL
, CACHE NUMBER NOT NULL
, TECH NUMBER NOT NULL 
, PRICE NUMBER NOT NULL
, QUANTITY NUMBER NOT NULL
, CONSTRAINT CPU_PK PRIMARY KEY (NAME) ENABLE 
);

ALTER TABLE CPU
  ADD CONSTRAINT CPU_SOCKET_FK1 FOREIGN KEY (SOCKET)
  REFERENCES SOCKET (NAME) ENABLE;

insert into cpu values ('core i5 2300', 'lga 1155', 4, 2800, 95, 6144, 32,  701, 3);
insert into cpu values ('core i5 2400', 'lga 1155', 4, 3100, 95, 6144, 32,  742, 5);
insert into cpu values ('core i5 2500', 'lga 1155', 4, 3300, 95, 6144, 32,  805, 15);
insert into cpu values ('core i7 2600', 'lga 1155', 4, 3400, 95, 8192, 32, 1131, 20);

insert into cpu values ('core i3 540', 'lga 1156', 2, 3060, 73, 4096, 32,  428, 1);
insert into cpu values ('core i3 550', 'lga 1156', 2, 3200, 73, 4096, 32,  476, 5);
insert into cpu values ('core i3 560', 'lga 1156', 2, 3333, 73, 4096, 32,  563, 4);
insert into cpu values ('core i5 650', 'lga 1156', 2, 3200, 73, 4096, 32,  729, 8);
insert into cpu values ('core i5 661', 'lga 1156', 2, 3333, 87, 4096, 32,  789, 2);
insert into cpu values ('core i5 670', 'lga 1156', 2, 3467, 73, 4096, 32, 1121, 3);
insert into cpu values ('core i5 760', 'lga 1156', 4, 2800, 95, 8192, 32,  794, 12);

insert into cpu values ('core i7 950', 'lga 1366', 4, 3060, 130, 8192,  45, 1096, 4);
insert into cpu values ('core i7 960', 'lga 1366', 4, 3200, 130, 8192,  45, 1177, 1);
insert into cpu values ('core i7 970', 'lga 1366', 4, 3200, 130, 12288, 32, 2787, 2);

insert into cpu values ('amd opteron 1216', 'am2', 2, 2400, 103, 2048, 90, 453, 2);
insert into cpu values ('amd opteron 1218', 'am2', 2, 2600, 103, 2048, 90, 544, 1);
insert into cpu values ('amd opteron 1220', 'am2', 2, 2800, 103, 2048, 90, 620, 1);

insert into cpu values ('athlon 2 x3 445', 'am3', 3, 3100,  95, 1536, 45, 301, 3);
insert into cpu values ('athlon 2 x3 450', 'am3', 3, 3200,  95, 1536, 45, 320, 7);
insert into cpu values ('athlon 2 x4 640', 'am3', 4, 3000,  95, 2048, 45, 382, 2);
insert into cpu values ('athlon 2 x4 645', 'am3', 4, 3100,  95, 2048, 45, 448, 1);
insert into cpu values ('phenom 2 x4 955', 'am3', 4, 3200, 125, 6144, 45, 568, 8);
insert into cpu values ('phenom 2 x4 965', 'am3', 4, 3400, 125, 6144, 45, 587, 9);
insert into cpu values ('phenom 2 x4 970', 'am3', 4, 3500, 125, 6144, 45, 667, 4);
insert into cpu values ('phenom 2 x4 975', 'am3', 4, 3600, 125, 6144, 45, 745, 8);

insert into cpu values ('phenom 2 x6 1075t', 'am3', 6, 3000, 125, 6144, 45, 745, 5);
insert into cpu values ('phenom 2 x6 1090t', 'am3', 6, 3200, 125, 6144, 45, 813, 12);
insert into cpu values ('phenom 2 x6 1100t', 'am3', 6, 3300, 125, 6144, 45, 968, 1);