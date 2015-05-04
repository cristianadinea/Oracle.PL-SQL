DROP TABLE MOBO;

CREATE TABLE MOBO 
(
  NAME VARCHAR2(50) NOT NULL 
, CHIPSET VARCHAR2(50) NOT NULL 
, DDRCLK NUMBER NOT NULL 
, USB3 NUMBER NOT NULL 
, PRICE NUMBER NOT NULL
, QUANTITY NUMBER NOT NULL
, CONSTRAINT MOBO_PK PRIMARY KEY (NAME) ENABLE 
);

ALTER TABLE MOBO
  ADD CONSTRAINT MOBO_CHIPSET_FK1 FOREIGN KEY (CHIPSET)
  REFERENCES CHIPSET (NAME) ENABLE;

insert into mobo values ('asus p8h67-m pro', 'intel h67', 1333, 2, 441, 3);
insert into mobo values ('gigabyte ga-ph67apud3', 'intel h67', 1333, 2, 480, 1);
insert into mobo values ('asrock p67 pro3', 'intel p67', 1600, 2, 500, 2);
insert into mobo values ('msi p67a-gd65', 'intel p67', 1866, 2, 700, 4);
insert into mobo values ('asrock p67 extreme6', 'intel p67', 2133, 4, 744, 5);

insert into mobo values ('msi h55m-e33', 'intel h55', 1333, 0, 315, 1);
insert into mobo values ('intel dh55hc', 'intel h55', 1333, 0, 351, 2);
insert into mobo values ('asrock p55 pro', 'intel p55', 1600, 1, 353, 1);
insert into mobo values ('asus p755d-e pro', 'intel p55', 1600, 2, 703, 6);

insert into mobo values ('asrock x58 extreme3', 'intel x58', 1333, 2, 722, 2);
insert into mobo values ('gigabyte ga-x58a-ud3r', 'intel x58', 2200, 2, 890, 7);
insert into mobo values ('asus p6t6 ws revolution', 'intel x58', 2200, 2, 1209, 1);

insert into mobo values ('asrock a780lm-s', 'amd 760g', 800, 0, 196, 2);
insert into mobo values ('asrock k10n78m pro', 'geforce 8200', 1066, 0, 204, 4);

insert into mobo values ('asus m4a89td pro', 'amd 890fx', 1600, 2, 721, 5);
insert into mobo values ('asus crosshair iv extreme', 'amd 890fx', 2200, 2, 1209, 1);
insert into mobo values ('asrock 880g extreme', 'amd 880g', 1333, 2, 373, 2);
insert into mobo values ('msi 880gma-e55', 'amd 880g', 1600, 2, 380, 4);