drop table ram;

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









