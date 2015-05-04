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
 
