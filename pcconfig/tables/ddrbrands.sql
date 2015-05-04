drop table ddrbrands;

CREATE TABLE DDRBRANDS 
(
  NAME VARCHAR2(20) NOT NULL 
, CONSTRAINT DDRBRANDS_PK PRIMARY KEY (NAME) ENABLE 
);


insert into ddrbrands values ('corsair');
insert into ddrbrands values ('kingston');
insert into ddrbrands values ('kingmax');
insert into ddrbrands values ('ocz');
insert into ddrbrands values ('mushkin');
insert into ddrbrands values ('a-data');
insert into ddrbrands values ('teamgroup');
insert into ddrbrands values ('g.skill');
insert into ddrbrands values ('excelram');
insert into ddrbrands values ('silicon-power');
insert into ddrbrands values ('zeppelin');
