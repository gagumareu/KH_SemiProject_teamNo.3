--------------------------------------------------------
--  파일이 생성됨 - 월요일-5월-16-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table APC_CATEGORY
--------------------------------------------------------

  CREATE TABLE "SEMI"."APC_CATEGORY" 
   (	"CATEGORY_NO" NUMBER(5,0), 
	"CATEGORY_CODE" VARCHAR2(8 BYTE), 
	"CATEGORY_NAME" VARCHAR2(100 BYTE), 
	"CATEGORY_IMAGE" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SEMI.APC_CATEGORY
SET DEFINE OFF;
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (2,'20000000','MEN',null);
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'30000000','GOLF',null);
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (2,'2MAN0000','MEN/NEW ARRIVALS','men_new.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'1WAN0000','WOMEN/NEW ARRIVALS','New Arrivals.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'1WCS0000','WOMEN/SHOES','Shoes.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'1WDC0000','WOMEN/COATS, PARKAS','women_coat.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'1WEJ0000','WOMEN/JACKETS','women_jacket.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'1WFD0000','WOMEN/DRESSES','women_dress.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'1WBB0000','WOMEN/BAGS','ZGZEmq5tmV.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'1WGS0000','WOMEN/SKIRTS, SHORTS','women_skirts.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'1WHT0000','WOMEN/TROUSERS, JEANS','women_trousers.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'1WIB0000','WOMEN/BLOUSES, SHIRTS','women_blouses.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'1WJK0000','WOMEN/KNITWEAR, CARDIGANS','woemn_knitwear.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'1WKT0000','WOMEN/T-SHIRTS, PULLOVERS','women_tshirts.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'1WLL0000','WOMEN/LEATHER GOODS','women_leathergoods.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'1WMS0000','WOMEN/SMALL ACCESSORIES','Small Accessories.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (2,'2MBC0000','MEN/COATS, PARKAS','men_coat.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (2,'2MCJ0000','MEN/JACKETS','men_jacket.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (2,'2MDT0000','MEN/TROUSERS, JEANS','men_trousers.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (2,'2MES0000','MEN/SHIRTS','men_shirts.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (2,'2MFK0000','MEN/KNITWEAR, CARDIGANS','men_knitwear.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (2,'2MGT0000','MEN/T-SHIRTS, PULLOVERS','men_tshirts.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (2,'2MHB0000','MEN/BAGS','men_bags.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (2,'2MIS0000','MEN/SHOES','men_shoes.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (2,'2MJL0000','MEN/LEATHER GOODS','men_leather.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (2,'2MKJ0000','MEN/JEWELRY','men_jewelry.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (2,'2MLS0000','MEN/SMALL ACCESSORIES','Small Accessories.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'3W000000','WOMEN',null);
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'3M000000','MEN',null);
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'3A000000','ACC',null);
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'3WAT0000','WOMEN/TSHIRTS','gw_tshirts.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'3WBK0000','WOMEN/KNIT','gw_knit.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'3WCO0000','WOMEN/OUTER','gw_outer.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'3WDP0000','WOMEN/PANTS','gw_pants.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'3WES0000','WOMEN/SKIRTS','gw_skirts.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'3WFD0000','WOMEN/DRESS','gw_dress.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'3MAT0000','MEN/TSHIRTS','gm_tshirts.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'3MBK0000','MEN/KNIT','gm_knitwear.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'3MCO0000','MEN/OUTER','gm_outer.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (3,'3MDP0000','MEN/PANTS','gm_pants.jpg');
Insert into SEMI.APC_CATEGORY (CATEGORY_NO,CATEGORY_CODE,CATEGORY_NAME,CATEGORY_IMAGE) values (1,'10000000','WOMEN',null);
--------------------------------------------------------
--  DDL for Index SYS_C009533
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEMI"."SYS_C009533" ON "SEMI"."APC_CATEGORY" ("CATEGORY_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table APC_CATEGORY
--------------------------------------------------------

  ALTER TABLE "SEMI"."APC_CATEGORY" MODIFY ("CATEGORY_NO" NOT NULL ENABLE);
  ALTER TABLE "SEMI"."APC_CATEGORY" MODIFY ("CATEGORY_NAME" NOT NULL ENABLE);
  ALTER TABLE "SEMI"."APC_CATEGORY" ADD PRIMARY KEY ("CATEGORY_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
