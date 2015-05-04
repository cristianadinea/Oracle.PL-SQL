drop table purchase;
drop table client;

/*
rights :
0 - visitor , play around but  cannot finalize purchase
1 - logged in, play and buy
2 - GOD (access to second part)
9 - cheats enabled
*/

CREATE TABLE "CLIENT" (
  "NAME" VARCHAR2(100 BYTE) NOT NULL, 
	"PASSWORD" VARCHAR2(32 BYTE) NOT NULL,   
  "RIGHTS" NUMBER NOT NULL,   
	"EMAIL" VARCHAR2(256 BYTE), 
	CONSTRAINT "CLIENT_PK" PRIMARY KEY ("NAME")
);

insert into client values('admin','xxx', 2, 'none needed :-)');

insert into client values('alex','xxx', 1, 'testing123@yahoo.com');
insert into client values('gigi','gig', 1, 'gigelutz@yahoo.com');
insert into client values('nicu','nik', 1, 'nelu_nicushor@yahoo.com');

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


-----------------------------------------------------------------

drop table cpu;
drop table mobo;
drop table ram;
drop table vga;

drop table chipset;
drop table vgabrands;
drop table ddrbrands;
drop table ddrtype;
drop table socket;

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

CREATE TABLE VGABRANDS 
(
  NAME VARCHAR2(20) NOT NULL 
, CONSTRAINT VGABRANDS_PK PRIMARY KEY (NAME) ENABLE 
);

insert into vgabrands values('asus');
insert into vgabrands values('msi');
insert into vgabrands values('gigabyte');
insert into vgabrands values('gainward');
insert into vgabrands values('palit');
insert into vgabrands values('evga');
insert into vgabrands values('sapphire');
insert into vgabrands values('his');
insert into vgabrands values('leadtek');
insert into vgabrands values('point of view');
insert into vgabrands values('powercolor');
insert into vgabrands values('sparkle');
insert into vgabrands values('xfx');
insert into vgabrands values('zotac');
 
CREATE TABLE DDRTYPE 
(
  NAME VARCHAR2(20) NOT NULL 
, CONSTRAINT DDRTYPE_PK PRIMARY KEY (NAME) ENABLE 
);

insert into ddrtype values ('ddr2');
insert into ddrtype values ('ddr3');

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

CREATE TABLE RAM 
(
  NAME VARCHAR2(100) NOT NULL 
, VENDOR VARCHAR2(50) NOT NULL 
, DDRTYPE VARCHAR2(20) NOT NULL 
, CLOCK NUMBER NOT NULL 
, CAPACITY NUMBER NOT NULL 
, LATENCY NUMBER NOT NULL 
, PRICE NUMBER NOT NULL 
, QUANTITY NUMBER NOT NULL 
, CONSTRAINT RAM_PK PRIMARY KEY (NAME, VENDOR, CLOCK, CAPACITY) ENABLE 
);

ALTER TABLE RAM
  ADD CONSTRAINT RAM_DDRTYPE_FK1 FOREIGN KEY (DDRTYPE)
  REFERENCES DDRTYPE (NAME) ENABLE;  
  
ALTER TABLE RAM
  ADD CONSTRAINT RAM_DDRBRANDS_FK2 FOREIGN KEY (VENDOR)
  REFERENCES DDRBRANDS (NAME) ENABLE;  
 
insert into ram values ('xms2', 'corsair', 'ddr2', 800, 2, 5, 150, 8); 
insert into ram values ('hyper x', 'kingston', 'ddr2', 800, 2, 5, 155, 25); 
insert into ram values ('hyper x sli ready', 'kingston', 'ddr2', 800, 2, 4, 159, 4); 

insert into ram values ('hyper x', 'kingston', 'ddr2', 1066, 2, 5, 174, 4); 

insert into ram values ('elite ram', 'teamgroup', 'ddr2', 800, 4, 5, 217, 8); 
insert into ram values ('value ram', 'kingston', 'ddr2', 800, 4, 5, 221, 12); 
insert into ram values ('pi black', 'g.skill', 'ddr2', 800, 4, 4, 442, 1); 

insert into ram values ('hyper x', 'kingston', 'ddr2', 1066, 4, 5, 368, 3); 
insert into ram values ('trident', 'g.skill', 'ddr2', 1066, 4, 5, 603, 2); 

insert into ram values ('elite ram', 'teamgroup', 'ddr2', 800, 8, 6, 542, 3); 
insert into ram values ('stiletto', 'mushkin', 'ddr2', 800, 8, 5, 753, 2); 
 
insert into ram values ('value ram', 'kingston', 'ddr3', 1333, 2, 9, 96, 12);
insert into ram values ('xms3', 'corsair', 'ddr3', 1333, 2, 9, 134, 2);
insert into ram values ('dhx', 'corsair', 'ddr3', 1333, 2, 8, 169, 1);

insert into ram values ('hyper x', 'kingston', 'ddr3', 1600, 2, 9, 120, 4);
insert into ram values ('hyper x blu', 'kingston', 'ddr3', 1600, 2, 9, 167, 9);

insert into ram values ('nano gaming', 'kingmax', 'ddr3', 2000, 2, 9, 153, 9);

insert into ram values ('xms3', 'corsair', 'ddr3', 1333, 3, 9, 182, 3);
insert into ram values ('vitesta gaming', 'a-data', 'ddr3', 1333, 3, 8, 285, 1);

insert into ram values ('vitesta extreme', 'a-data', 'ddr3', 1600, 3, 8, 242, 10);
insert into ram values ('xms3 dhx', 'corsair', 'ddr3', 1600, 3, 8, 270, 11);
insert into ram values ('hyper x', 'kingston', 'ddr3', 1600, 3, 8, 283, 3);

insert into ram values ('hyper x', 'kingston', 'ddr3', 1866, 3, 9, 336, 2);

insert into ram values ('hyper x xmp', 'kingston', 'ddr3', 2000, 3, 9, 314, 4);
insert into ram values ('hyper x', 'kingston', 'ddr3', 2000, 3, 9, 350, 2);

insert into ram values ('xms3', 'corsair', 'ddr3', 1333, 4, 8, 204, 3);
insert into ram values ('hyper x xmp', 'kingston', 'ddr3', 1333, 4, 7, 224, 1);
insert into ram values ('value ram', 'kingston', 'ddr3', 1333, 4, 9, 171, 2);
insert into ram values ('hyper x blu', 'kingston', 'ddr3', 1333, 4, 9, 192, 5);
insert into ram values ('gold series', 'ocz', 'ddr3', 1333, 4, 9, 185, 12);
insert into ram values ('frostbyte', 'mushkin', 'ddr3', 1333, 4, 9, 203, 6);

insert into ram values ('stiletto', 'mushkin', 'ddr3', 1600, 4, 7, 225, 4);
insert into ram values ('radioactive frostbyte', 'mushkin', 'ddr3', 1600, 4, 7, 248, 7);
insert into ram values ('copperhead', 'mushkin', 'ddr3', 1600, 4, 7, 342, 1);
insert into ram values ('redline frostbyte', 'mushkin', 'ddr3', 1600, 4, 6, 511, 2);
insert into ram values ('vengeance blue', 'corsair', 'ddr3', 1600, 4, 9, 231, 3);
insert into ram values ('dominator', 'corsair', 'ddr3', 1600, 4, 8, 302, 8);
insert into ram values ('reaper hpc r2', 'ocz', 'ddr3', 1600, 4, 7, 400, 1);
insert into ram values ('gaming series', 'a-data', 'ddr3', 1600, 4, 9, 163, 2);
insert into ram values ('vitesta extreme', 'a-data', 'ddr3', 1600, 4, 8, 208, 10);
insert into ram values ('hyper x blu', 'kingston', 'ddr3', 1600, 4, 9, 193, 16);
insert into ram values ('xmp x2 grey series', 'kingston', 'ddr3', 1600, 4, 9, 203, 11);

insert into ram values ('xtreem', 'teamgroup', 'ddr3', 1866, 4, 9, 243, 3);
insert into ram values ('team xtreem', 'teamgroup', 'ddr3', 1866, 4, 8, 336, 2);
insert into ram values ('dominator gt', 'corsair', 'ddr3', 1866, 4, 9, 390, 1);

insert into ram values ('gaming series', 'a-data', 'ddr3', 2000, 4, 9, 245, 3);
insert into ram values ('hyper x h2o series', 'kingston', 'ddr3', 2000, 4, 9, 365, 1);
insert into ram values ('ridgeback', 'mushkin', 'ddr3', 2000, 4, 7, 446, 2);
insert into ram values ('vengeance', 'corsair', 'ddr3', 2000, 4, 10, 280, 8);
insert into ram values ('dominator gt', 'corsair', 'ddr3', 2000, 4, 8, 539, 1);

insert into ram values ('hyper x', 'kingston', 'ddr3', 2200, 4, 9, 442, 2);
insert into ram values ('hyper x h2o series', 'kingston', 'ddr3', 2200, 4, 9, 490, 3);
insert into ram values ('dominator gt', 'corsair', 'ddr3', 2200, 4, 9, 570, 1);

insert into ram values ('elite ram', 'teamgroup', 'ddr3', 1333, 6, 9, 296, 5);
insert into ram values ('xms2', 'corsair', 'ddr3', 1333, 6, 9, 307, 9);
insert into ram values ('xms3', 'corsair', 'ddr3', 1333, 6, 8, 313, 3);

insert into ram values ('xms3', 'corsair', 'ddr3', 1600, 6, 9, 310, 5);
insert into ram values ('dominator dhx', 'corsair', 'ddr3', 1600, 6, 7, 548, 2);
insert into ram values ('vitesta extreme', 'a-data', 'ddr3', 1600, 6, 8, 402, 10);
insert into ram values ('xtreem dark', 'teamgroup', 'ddr3', 1600, 6, 8, 334, 2);
insert into ram values ('frostbyte', 'mushkin', 'ddr3', 1600, 6, 9, 327, 15);
insert into ram values ('black frostbyte', 'mushkin', 'ddr3', 1600, 6, 6, 362, 5);
insert into ram values ('redline frostbyte', 'mushkin', 'ddr3', 1600, 6, 6, 674, 2);

insert into ram values ('xtreem', 'teamgroup', 'ddr3', 1866, 6, 9, 522, 3);
insert into ram values ('hyper x', 'kingston', 'ddr3', 1866, 6, 9, 577, 2);

insert into ram values ('xms3', 'corsair', 'ddr3', 2000, 6, 9, 383, 6);
insert into ram values ('dominator gt', 'corsair', 'ddr3', 2000, 6, 8, 715, 2);
insert into ram values ('xtreem', 'teamgroup', 'ddr3', 2000, 6, 9, 558, 4);

insert into ram values ('elite ram', 'teamgroup', 'ddr3', 1333, 8, 9, 344, 3);
insert into ram values ('xms3', 'corsair', 'ddr3', 1333, 8, 9, 370, 2);
insert into ram values ('dominator', 'corsair', 'ddr3', 1333, 8, 9, 502, 1);
insert into ram values ('dominator gt', 'corsair', 'ddr3', 1333, 8, 7, 612, 1);

insert into ram values ('xms3', 'corsair', 'ddr3', 1600, 8, 9, 380, 5);
insert into ram values ('vengeance', 'corsair', 'ddr3', 1600, 8, 8, 398, 2);
insert into ram values ('vengeance blu', 'corsair', 'ddr3', 1600, 8, 8, 498, 2);
insert into ram values ('xtreem dark', 'teamgroup', 'ddr3', 1600, 8, 7, 617, 3);

insert into ram values ('vengeance', 'corsair', 'ddr3', 1866, 8, 8, 476, 3);

insert into ram values ('xms3', 'corsair', 'ddr3', 2000, 8, 8, 592, 3);

insert into ram values ('hyper x xmp', 'kingston', 'ddr3', 2200, 8, 9, 1014, 1);


CREATE TABLE VGA 
(
  NAME VARCHAR2(50) NOT NULL 
, VENDOR VARCHAR2(20) NOT NULL 
, CHIPSET VARCHAR2(20) NOT NULL 
, SERIES VARCHAR2(20) NOT NULL 
, GDDR NUMBER NOT NULL 
, BUS NUMBER NOT NULL 
, CLOCK NUMBER NOT NULL 
, PASSIVE NUMBER NOT NULL 
, PRICE NUMBER NOT NULL 
, QUANTITY NUMBER NOT NULL 
, CONSTRAINT VGA_PK PRIMARY KEY (NAME, VENDOR) ENABLE 
);

ALTER TABLE VGA
ADD CONSTRAINT VGA_VGABRANDS FOREIGN KEY (VENDOR) 
REFERENCES VGABRANDS (NAME) ENABLE;

insert into vga values ('hd4550 silence', 'his', 'amd', 'radeon hd 4k', 512, 64, 600, 1, 151, 3);
insert into vga values ('hd4670 pcs', 'powercolor', 'amd', 'radeon hd 4k', 512, 128, 750, 0, 241, 2);
insert into vga values ('hd4730 pcs', 'powercolor', 'amd', 'radeon hd 4k', 512, 128, 700, 0, 305, 7);

insert into vga values ('hd5450 go! green', 'powercolor', 'amd', 'radeon hd 5k', 512, 64, 650, 1, 145, 3);
insert into vga values ('hd5670 low profile', 'sapphire', 'amd', 'radeon hd 5k', 512, 128, 775, 0, 273, 1);
insert into vga values ('hd5670 ultimate', 'sapphire', 'amd', 'radeon hd 5k', 1024, 128, 775, 1, 361, 2);
insert into vga values ('hd5750 vapor-x', 'sapphire', 'amd', 'radeon hd 5k', 1024, 128, 700, 0, 438, 5);
insert into vga values ('hd5850 vapor-x', 'sapphire', 'amd', 'radeon hd 5k', 1024, 256, 735, 0, 730, 8);
insert into vga values ('hd5850 twin frozr 2', 'msi', 'amd', 'radeon hd 5k', 1024, 256, 725, 0, 1056, 2);
insert into vga values ('hd5870', 'powercolor', 'amd', 'radeon hd 5k', 1024, 256, 850, 0, 1400, 4);

insert into vga values ('hd6450', 'sapphire', 'amd', 'radeon hd 6k', 1024, 64, 625, 1, 181, 1);
insert into vga values ('hd6850', 'sapphire', 'amd', 'radeon hd 6k', 1024, 256, 775, 0, 630, 4);
insert into vga values ('hd6870 toxic', 'sapphire', 'amd', 'radeon hd 6k', 1024, 256, 970, 0, 852, 12);
insert into vga values ('hd6950', 'sapphire', 'amd', 'radeon hd 6k', 2048, 256, 800, 0, 940, 8);
insert into vga values ('hd6850 directcu', 'asus', 'amd', 'radeon hd 6k', 1024, 256, 790, 0, 671, 5);
insert into vga values ('hd6990', 'asus', 'amd', 'radeon hd 6k', 4096, 512, 830, 0, 2544, 2);
insert into vga values ('hd6970 ultra durable', 'gigabyte', 'amd', 'radeon hd 6k', 2048, 256, 880, 0, 1291, 6);
insert into vga values ('hd6990', 'gigabyte', 'amd', 'radeon hd 6k', 4096, 512, 830, 0, 2610, 1);

insert into vga values ('gts 450', 'gainward', 'nvidia', 'gts 400', 512, 128, 783, 0, 355, 3);
insert into vga values ('gts 450 sonic', 'palit', 'nvidia', 'gts 400', 1024, 128, 880, 0, 431, 10);
insert into vga values ('gts 450 boost', 'evga', 'nvidia', 'gts 400', 1024, 128, 822, 0, 440, 8);

insert into vga values ('gtx 460 smart', 'palit', 'nvidia', 'gtx 400', 1024, 256, 650, 0, 540, 3);
insert into vga values ('gtx 460 directcu top', 'asus', 'nvidia', 'gtx 400', 768, 192, 700, 0, 647, 1);
insert into vga values ('gtx 480 directcu', 'asus', 'nvidia', 'gtx 400', 1024, 256, 675, 0, 690, 3);
insert into vga values ('gtx 460 se cyclone oc', 'msi', 'nvidia', 'gtx 400', 1024, 256, 700, 0, 655, 4);
insert into vga values ('gtx 480', 'gainward', 'nvidia', 'gtx 400', 1536, 384, 700, 0, 1362, 12);
insert into vga values ('gtx 480 super oc', 'gigabyte', 'nvidia', 'gtx 400', 1536, 384, 820, 0, 1504, 5);

insert into vga values ('gtx 550 ti', 'gainward', 'nvidia', 'gtx 500', 1024, 192, 900, 0, 545, 6);
insert into vga values ('gtx 550 cyclone 2 oc', 'msi', 'nvidia', 'gtx 500', 1024, 192, 950, 0, 592, 4);
insert into vga values ('gtx 560 ti sonic', 'palit', 'nvidia', 'gtx 500', 1024, 256, 900, 0, 904, 6);
insert into vga values ('gtx 560 ti twin frozr 2 oc', 'msi', 'nvidia', 'gtx 500', 1024, 256, 880, 0, 970, 2);
insert into vga values ('gtx 570', 'msi', 'nvidia', 'gtx 500', 1280, 320, 732, 0, 1295, 7);
insert into vga values ('gtx 580', 'asus', 'nvidia', 'gtx 500', 1536, 384, 782, 0, 1832, 4);
insert into vga values ('gtx 580 phantom', 'gainward', 'nvidia', 'gtx 500', 3072, 384, 782, 0, 2137, 4);
insert into vga values ('gtx 590', 'gainward', 'nvidia', 'gtx 500', 3072, 384, 612, 0, 2750, 2);









