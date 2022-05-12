--------------------------------------------------------
--  ?뚯씪???앹꽦??- ?섏슂??5??11-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table APC_PRODUCTS
--------------------------------------------------------

  CREATE TABLE "SEMI"."APC_PRODUCTS" 
   (	"PNO" NUMBER(5,0), 
	"PNAME" VARCHAR2(50 BYTE), 
	"PCATEGORY_FK" VARCHAR2(8 BYTE), 
	"PIMAGE" VARCHAR2(1000 BYTE), 
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
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (8,'Saules T-Shirts (black)','3WAT0000','/3WAT0000/wTshirt2_1b.jpg,/3WAT0000/wTshirt2_2b.jpg,/3WAT0000/wTshirt2_3b.jpg,/3WAT0000/wTshirt2_4b.jpg',100,319000,'XS','BLACK','?ы뵆???붾━?쒖뺄?ш컧??移대씪 ?쇱씤諛곗깋???ъ씤?몃줈 媛誘명빐 ?쒖링 源붾걫?쒗븦???곗텧?섎뒗 移대씪??諛섑뙏 ?곗뀛痢좎엯?덈떎. 踰좎씠吏곹븳 ?붿옄?몄뿉 ?낆껜 濡쒓퀬 ?뷀뀒?쇱쓣 ?ъ씤?몃줈 ?곸슜???꾩씠?쒖엯?덈떎. 媛蹂띻퀬 ?좎텞?깆씠 ?곗닔???섏씪濡??ㅽ뙋 ?뚯옱???꾩씠?쒖쑝濡??곗씪由щ줈 ?ㅽ??쇰━???섍쾶 ?낆쓣 ???덉쑝硫댁꽌 ?ㅽ룷痢??쒕룞 ?쒖뿉???몄븞???쒕룞?깆쓣 ?쒓났?⑸땲??',19140,to_date('22/05/01','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (9,'?뚯뒪??,'2MCJ0000','/2MCJ0000/golf_main1.jpg,/2MCJ0000/golf_sub3.jpg,/2MCJ0000/golf_sub21.jpg,/2MCJ0000/golf_sub11.jpg',1,2500000,'m','nonedddd',null,19140,to_date('22/05/02','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (2,'Quincy Knit Vest (beige)','3WBK0000','/3WBK0000/wTshirt1_1bjpg,/3WBK0000/wTshirt1_2b.jpg,/3WBK0000/wTshirt1_3b.jpg,/3WBK0000/wTshirt1_4b.jpg,/3WBK0000/wTshirt1_5b.jpg',100,489000,'XS','BEIGE','踰좎씠吏곹븳 ?붿옄?몄쓽 釉뚯씠???덊듃 踰좎뒪?몃줈 而щ윭諛곗깋??媛誘명빐 ?쒖링 ?곕쑜??臾대뱶瑜??곗텧?⑸땲?? 源붾걫???꾩썐?뤿씪?몄쓣 ?곗텧???ㅼ뼇???섏쓽???肄붾뵒留ㅼ튂媛 醫뗭? ?꾩씠?쒖엯?덈떎. 硫댁냼?щ줈 苡뚯쟻?섍퀬 ?몄븞??李⑹슜媛먯쓣 ?쒓났?⑸땲??',29340,to_date('22/05/01','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (3,'Sermaise T-Shirts (white)','3WAT0000','/3WAT0000/wTshirt3_1.jpg,/3WAT0000/wTshirt3_2.jpg,/3WAT0000/wTshirt3_3.jpg,/3WAT0000/wTshirt3_4.jpg',100,289000,'XS','WHITE','?ы뵆??諛곗깋 ?뷀뀒?쇱뿉 濡쒓퀬 ?ъ씠???뷀뀒?쇱쓽 諛??섏씠???곗뀛痢좎엯?덈떎. ?덉씠?대뱶 ???ъ씤???대꼫濡??쒖슜 媛?ν븯硫?罹먯＜?쇳븳 ?ъ툩, ?ㅼ빱?몃벑???⑤룆 肄붾뵒 ?ㅽ??쇰쭅?대룄 硫뗭뒪?ъ슫 ?곗텧??媛?ν빀?덈떎. 媛蹂띻퀬 遺?쒕윭???곗튂媛먯뿉 ?좎텞?깆씠 ?곗닔???뚯옱濡??쇱긽?앺솢?대굹 ?ㅽ룷痢??쒕룞???몄븞??李⑹슜媛먯쓣 ?쒓났?⑸땲?? <br>紐⑤뜽?좎옣 : 177 cm / S ?ъ씠利?李⑹슜',17340,to_date('22/05/01','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (4,'Sermaise T-Shirts (white)','3WAT0000','/3WAT0000/wTshirt3_1.jpg,/3WAT0000/wTshirt3_2.jpg,/3WAT0000/wTshirt3_3.jpg,/3WAT0000/wTshirt3_4.jpg',80,289000,'S','WHITE','?ы뵆??諛곗깋 ?뷀뀒?쇱뿉 濡쒓퀬 ?ъ씠???뷀뀒?쇱쓽 諛??섏씠???곗뀛痢좎엯?덈떎. ?덉씠?대뱶 ???ъ씤???대꼫濡??쒖슜 媛?ν븯硫?罹먯＜?쇳븳 ?ъ툩, ?ㅼ빱?몃벑???⑤룆 肄붾뵒 ?ㅽ??쇰쭅?대룄 硫뗭뒪?ъ슫 ?곗텧??媛?ν빀?덈떎. 媛蹂띻퀬 遺?쒕윭???곗튂媛먯뿉 ?좎텞?깆씠 ?곗닔???뚯옱濡??쇱긽?앺솢?대굹 ?ㅽ룷痢??쒕룞???몄븞??李⑹슜媛먯쓣 ?쒓났?⑸땲?? <br>紐⑤뜽?좎옣 : 177 cm / S ?ъ씠利?李⑹슜',17340,to_date('22/05/01','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (6,'Sermaise T-Shirts (black)','3WAT0000','/3WAT0000/wTshirt3_1b.jpg,/3WAT0000/wTshirt3_2b.jpg,/3WAT0000/wTshirt3_3b.jpg,/3WAT0000/wTshirt3_2b.jpg',70,289000,'XS','BLACK','?ы뵆??諛곗깋 ?뷀뀒?쇱뿉 濡쒓퀬 ?ъ씠???뷀뀒?쇱쓽 諛??섏씠???곗뀛痢좎엯?덈떎. ?덉씠?대뱶 ???ъ씤???대꼫濡??쒖슜 媛?ν븯硫?罹먯＜?쇳븳 ?ъ툩, ?ㅼ빱?몃벑???⑤룆 肄붾뵒 ?ㅽ??쇰쭅?대룄 硫뗭뒪?ъ슫 ?곗텧??媛?ν빀?덈떎. 媛蹂띻퀬 遺?쒕윭???곗튂媛먯뿉 ?좎텞?깆씠 ?곗닔???뚯옱濡??쇱긽?앺솢?대굹 ?ㅽ룷痢??쒕룞???몄븞??李⑹슜媛먯쓣 ?쒓났?⑸땲?? <br>紐⑤뜽?좎옣 : 177 cm / S ?ъ씠利?李⑹슜',17340,to_date('22/05/01','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (5,'Sermaise T-Shirts (white)','3WAT0000','/3WAT0000/wTshirt3_1.jpg,/3WAT0000/wTshirt3_2.jpg,/3WAT0000/wTshirt3_3.jpg,/3WAT0000/wTshirt3_4.jpg',100,289000,'M','WHITE','?ы뵆??諛곗깋 ?뷀뀒?쇱뿉 濡쒓퀬 ?ъ씠???뷀뀒?쇱쓽 諛??섏씠???곗뀛痢좎엯?덈떎. ?덉씠?대뱶 ???ъ씤???대꼫濡??쒖슜 媛?ν븯硫?罹먯＜?쇳븳 ?ъ툩, ?ㅼ빱?몃벑???⑤룆 肄붾뵒 ?ㅽ??쇰쭅?대룄 硫뗭뒪?ъ슫 ?곗텧??媛?ν빀?덈떎. 媛蹂띻퀬 遺?쒕윭???곗튂媛먯뿉 ?좎텞?깆씠 ?곗닔???뚯옱濡??쇱긽?앺솢?대굹 ?ㅽ룷痢??쒕룞???몄븞??李⑹슜媛먯쓣 ?쒓났?⑸땲?? <br>紐⑤뜽?좎옣 : 177 cm / S ?ъ씠利?李⑹슜',17340,to_date('22/05/01','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (7,'Saules T-Shirts (white)','3WAT0000','/3WAT0000/wTshirt2_1.jpg,/3WAT0000/wTshirt2_2.jpg,/3WAT0000/wTshirt2_3.jpg,/3WAT0000/wTshirt2_4.jpg',20,319000,'XS','WHITE','?ы뵆???붾━?쒖뺄?ш컧??移대씪 ?쇱씤諛곗깋???ъ씤?몃줈 媛誘명빐 ?쒖링 源붾걫?쒗븦???곗텧?섎뒗 移대씪??諛섑뙏 ?곗뀛痢좎엯?덈떎. 踰좎씠吏곹븳 ?붿옄?몄뿉 ?낆껜 濡쒓퀬 ?뷀뀒?쇱쓣 ?ъ씤?몃줈 ?곸슜???꾩씠?쒖엯?덈떎. 媛蹂띻퀬 ?좎텞?깆씠 ?곗닔???섏씪濡??ㅽ뙋 ?뚯옱???꾩씠?쒖쑝濡??곗씪由щ줈 ?ㅽ??쇰━???섍쾶 ?낆쓣 ???덉쑝硫댁꽌 ?ㅽ룷痢??쒕룞 ?쒖뿉???몄븞???쒕룞?깆쓣 ?쒓났?⑸땲??',19140,to_date('22/04/28','RR/MM/DD'));
Insert into SEMI.APC_PRODUCTS (PNO,PNAME,PCATEGORY_FK,PIMAGE,PQTY,PRICE,PSIZE,PCOLOR,PCONTENTS,MILEAGE,PINPUTDATE) values (1,'Quincy Knit Vest (indigo)','3WBK0000','/3WBK0000/wTshirt1_1.jpg,/3WBK0000/wTshirt1_2.jpg,/3WBK0000/wTshirt1_3.jpg,/3WBK0000/wTshirt1_4.jpg,/3WBK0000/wTshirt1_5.jpg',100,489000,'XS','INDIGO','踰좎씠吏곹븳 ?붿옄?몄쓽 釉뚯씠???덊듃 踰좎뒪?몃줈 而щ윭諛곗깋??媛誘명빐 ?쒖링 ?곕쑜??臾대뱶瑜??곗텧?⑸땲?? 源붾걫???꾩썐?뤿씪?몄쓣 ?곗텧???ㅼ뼇???섏쓽???肄붾뵒留ㅼ튂媛 醫뗭? ?꾩씠?쒖엯?덈떎. 硫댁냼?щ줈 苡뚯쟻?섍퀬 ?몄븞??李⑹슜媛먯쓣 ?쒓났?⑸땲??',29340,to_date('22/04/28','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index SYS_C007879
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEMI"."SYS_C007879" ON "SEMI"."APC_PRODUCTS" ("PNO") 
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
