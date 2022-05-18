--------------------------------------------------------
--  파일이 생성됨 - 월요일-5월-16-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table APC_PRODUCTS
--------------------------------------------------------

  CREATE TABLE "SEMI"."APC_PRODUCTS" 
   (	"PNO" NUMBER(5,0), 
	"PNAME" VARCHAR2(50 BYTE), 
	"PCATEGORY_FK" VARCHAR2(8 BYTE), 
	"PIMAGE" VARCHAR2(100 BYTE), 
	"PQTY" NUMBER(5,0) DEFAULT 0, 
	"PRICE" NUMBER(10,0) DEFAULT 0, 
	"PSIZE" VARCHAR2(100 BYTE), 
	"PCOLOR" VARCHAR2(50 BYTE), 
	"PCONTENTS" VARCHAR2(1000 BYTE), 
	"MILEAGE" NUMBER(6,0) DEFAULT 0, 
	"PINPUTDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SEMI.APC_PRODUCTS
SET DEFINE OFF;
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (1,'Quincy Knit Vest (indigo)','1WJK0000','/3WBK0000/wTshirt1_1.jpg,/3WBK0000/wTshirt1_2.jpg,/3WBK0000/wTshirt1_3.jpg,/3WBK0000/wTshirt1_4.jpg',98,489000,'XS','INDIGO','베이직한 디자인의 브이넥 니트 베스트로 컬러배색을 가미해 한층 산뜻한 무드를 연출합니다. 깔끔한 아웃핏라인을 연출해 다양한 하의와의 코디매치가 좋은 아이템입니다. 면소재로 쾌적하고 편안한 착용감을 제공합니다.',29340,to_date('22/04/28','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (3,'Sermaise T-Shirts (black)','3WAT0000','/3WAT0000/wTshirt3_1b2.jpg',100,289000,'M','BLACK','심플한 배색 디테일에 로고 포이트 디테일의 반 하이넥 티셔츠. 가볍고 소프트한 터치감에 신축성이 우수한 소재로 편안한 착용감을 제공함. 모델 신장은 177cm이며, S사이즈 착용함.',17340,to_date('22/05/01','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (4,'Sermaise T-Shirts (white)','3WAT0000','/3WAT0000/wTshirt3_1.jpg,/3WAT0000/wTshirt3_2.jpg,/3WAT0000/wTshirt3_3.jpg,/3WAT0000/wTshirt3_4.jpg',80,289000,'S','WHITE','심플한 배색 디테일에 로고 포이트 디테일의 반 하이넥 티셔츠. 가볍고 소프트한 터치감에 신축성이 우수한 소재로 편안한 착용감을 제공함. 모델 신장은 177cm이며, S사이즈 착용함.',17340,to_date('22/05/01','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (5,'Sermaise T-Shirts (white)','3WAT0000','/3WAT0000/wTshirt3_1.jpg,/3WAT0000/wTshirt3_2.jpg,/3WAT0000/wTshirt3_3.jpg,/3WAT0000/wTshirt3_4.jpg',99,289000,'M','WHITE','심플한 배색 디테일에 로고 포이트 디테일의 반 하이넥 티셔츠입니다. 레이어드 시 포인트 이너로 활용 가능하며 캐주얼한 팬츠, 스커트등에 단독 코디 스타일링해도 멋스러운 연출이 가능합니다. 가볍고 부드러운 터치감에 신축성이 우수한 소재로 일상생활이나 스포츠 활동시 편안한 착용감을 제공합니다. <br>모델신장 : 177 cm / S 사이즈 착용',17340,to_date('22/05/01','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (7,'Saules T-Shirts (white)','3WAT0000','/3WAT0000/wTshirt2_1.jpg,/3WAT0000/wTshirt2_2.jpg,/3WAT0000/wTshirt2_3.jpg,/3WAT0000/wTshirt2_4.jpg',20,319000,'XS','WHITE','심플한 솔리드컬러감에 카라 라인배색을 포인트로 가미해 한층 깔끔한핏을 연출하는 카라넥 반팔 티셔츠입니다. 베이직한 디자인에 입체 로고 디테일을 포인트로 적용한 아이템입니다. 가볍고 신축성이 우수한 나일론 스판 소재의 아이템으로 데일리로 스타일리쉬 하게 입을 수 있으면서 스포츠 활동 시에도 편안한 활동성을 제공합니다.',19140,to_date('22/04/28','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (9,'Marina Short-Sleeve Shirt (white)','1WAN0000','/1WAN0000/Marina1_1.jpg,/1WAN0000/Marina1_2.jpg,/1WAN0000/Marina1_3.jpg,/1WAN0000/Marina1_4.jpg',100,229000,'M','WHITE','면 100% 소재의 클래식한 반소매 셔츠. 톤온톤 버튼. 스탠다드핏. 모델 신장은 178cm이며, 54사이즈 착용함.',6870,to_date('22/05/12','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (10,'Marina Short-Sleeve Shirt (white)','1WAN0000','/1WAN0000/Marina1_1.jpg,/1WAN0000/Marina1_2.jpg,/1WAN0000/Marina1_3.jpg,/1WAN0000/Marina1_4.jpg',100,229000,'S','WHITE','면 100% 소재의 클래식한 반소매 셔츠. 톤온톤 버튼. 스탠다드핏. 모델 신장은 178cm이며, 54사이즈 착용함.',6870,to_date('22/05/12','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (11,'Marina Short-Sleeve Shirt (beige)','1WAN0000','/1WAN0000/Marina1_1b.jpg,/1WAN0000/Marina1_2b.jpg,/1WAN0000/Marina1_3b.jpg,/1WAN0000/Marina1_4b.jpg',99,229000,'S','BEIGE','면 100% 소재의 클래식한 반소매 셔츠. 톤온톤 버튼. 스탠다드핏. 모델 신장은 178cm이며, 54사이즈 착용함.',6870,to_date('22/05/12','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (12,'Marina Short-Sleeve Shirt (beige)','1WAN0000','/1WAN0000/Marina1_1b.jpg,/1WAN0000/Marina1_2b.jpg,/1WAN0000/Marina1_3b.jpg,/1WAN0000/Marina1_4b.jpg',100,229000,'M','BEIGE','면 100% 소재의 클래식한 반소매 셔츠. 톤온톤 버튼. 스탠다드핏. 모델 신장은 178cm이며, 54사이즈 착용함.',6870,to_date('22/05/12','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (13,'Nacy Skirt (white)','1WAN0000','/1WAN0000/Nancy_1.jpg,/1WAN0000/Nancy_2.jpg,/1WAN0000/Nancy_3.jpg,/1WAN0000/Nancy_4.jpg',100,319000,'S','WHITE','이탈리아산 면 100% 소재의 코튼 캔버스 스커트. 무릎을 덮는 기장. 타이 벨트 포함. 전면의 버튼 여밈. 카라멜 컬러 탑 스티칭. 슬랜트 포켓. 모델 신장은 179cm이며, 43사이즈 착용함.',9570,to_date('22/05/12','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (14,'Nacy Skirt (white)','1WAN0000','/1WAN0000/Nancy_1.jpg,/1WAN0000/Nancy_2.jpg,/1WAN0000/Nancy_3.jpg,/1WAN0000/Nancy_4.jpg',100,319000,'M','WHITE','이탈리아산 면 100% 소재의 코튼 캔버스 스커트. 무릎을 덮는 기장. 타이 벨트 포함. 전면의 버튼 여밈. 카라멜 컬러 탑 스티칭. 슬랜트 포켓. 모델 신장은 179cm이며, 43사이즈 착용함.',9570,to_date('22/05/12','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (15,'Nacy Skirt (green)','1WAN0000','/1WAN0000/Nancy_1b.jpg,/1WAN0000/Nancy_2b.jpg,/1WAN0000/Nancy_3b.jpg,/1WAN0000/Nancy_4b.jpg',100,319000,'S','GREEN','이탈리아산 면 100% 소재의 코튼 캔버스 스커트. 무릎을 덮는 기장. 타이 벨트 포함. 전면의 버튼 여밈. 카라멜 컬러 탑 스티칭. 슬랜트 포켓. 모델 신장은 179cm이며, 43사이즈 착용함.',9570,to_date('22/05/12','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (16,'Nacy Skirt (green)','1WAN0000','/1WAN0000/Nancy_1b.jpg,/1WAN0000/Nancy_2b.jpg,/1WAN0000/Nancy_3b.jpg,/1WAN0000/Nancy_4b.jpg',98,319000,'M','GREEN','이탈리아산 면 100% 소재의 코튼 캔버스 스커트. 무릎을 덮는 기장. 타이 벨트 포함. 전면의 버튼 여밈. 카라멜 컬러 탑 스티칭. 슬랜트 포켓. 모델 신장은 179cm이며, 43사이즈 착용함.',9570,to_date('22/05/12','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (17,'Elisa Cardigan (white)','1WAN0000','/1WAN0000/Elisa_1.jpg,/1WAN0000/Elisa_2.jpg,/1WAN0000/Elisa_3.jpg',100,319000,'S','WHITE','가볍고 부드러운 면 혼방 소재의 라운드넥 반소매 가디건. 숏기장. A.P.C. 로고 자수와 전면 버튼 디테일.',9570,to_date('22/05/12','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (18,'Elisa Cardigan (white)','1WAN0000','/1WAN0000/Elisa_1.jpg,/1WAN0000/Elisa_2.jpg,/1WAN0000/Elisa_3.jpg',99,319000,'M','WHITE','가볍고 부드러운 면 혼방 소재의 라운드넥 반소매 가디건. 숏기장. A.P.C. 로고 자수와 전면 버튼 디테일.',9570,to_date('22/05/12','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (19,'Elisa Cardigan (black)','1WAN0000','/1WAN0000/Elisa_1b.jpg,/1WAN0000/Elisa_2b.jpg,/1WAN0000/Elisa_3b.jpg',100,319000,'S','BLACK','가볍고 부드러운 면 혼방 소재의 라운드넥 반소매 가디건. 숏기장. A.P.C. 로고 자수와 전면 버튼 디테일.',9570,to_date('22/05/12','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (20,'Elisa Cardigan (black)','1WAN0000','/1WAN0000/Elisa_1b.jpg,/1WAN0000/Elisa_2b.jpg,/1WAN0000/Elisa_3b.jpg',98,319000,'M','BLACK','가볍고 부드러운 면 혼방 소재의 라운드넥 반소매 가디건. 숏기장. A.P.C. 로고 자수와 전면 버튼 디테일.',9570,to_date('22/05/12','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index SYS_C009536
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEMI"."SYS_C009536" ON "SEMI"."APC_PRODUCTS" ("PNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table APC_PRODUCTS
--------------------------------------------------------

  ALTER TABLE "SEMI"."APC_PRODUCTS" MODIFY ("PNAME" NOT NULL ENABLE);
  ALTER TABLE "SEMI"."APC_PRODUCTS" MODIFY ("PCATEGORY_FK" NOT NULL ENABLE);
  ALTER TABLE "SEMI"."APC_PRODUCTS" ADD PRIMARY KEY ("PNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table APC_PRODUCTS
--------------------------------------------------------

  ALTER TABLE "SEMI"."APC_PRODUCTS" ADD FOREIGN KEY ("PCATEGORY_FK")
	  REFERENCES "SEMI"."APC_CATEGORY" ("CATEGORY_CODE") ENABLE;
