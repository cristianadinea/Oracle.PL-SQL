drop table vga;

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
