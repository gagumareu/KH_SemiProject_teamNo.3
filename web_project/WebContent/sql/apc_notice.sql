--------------------------------------------------------
--  파일이 생성됨 - 월요일-5월-16-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table APC_NOTICE
--------------------------------------------------------

  CREATE TABLE "SEMI"."APC_NOTICE" 
   (	"NOTICE_NO" NUMBER(5,0), 
	"NOTICE_WRITER" VARCHAR2(30 BYTE), 
	"NOTICE_TITLE" VARCHAR2(200 BYTE), 
	"NOTICE_CONT" VARCHAR2(1000 BYTE), 
	"NOTICE_IMAGE" VARCHAR2(1000 BYTE), 
	"NOTICE_PWD" VARCHAR2(30 BYTE), 
	"NOTICE_HIT" NUMBER(5,0) DEFAULT 0, 
	"NOTICE_DATE" DATE, 
	"NOTICE_UPDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SEMI.APC_NOTICE
SET DEFINE OFF;
Insert into SEMI.APC_NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONT,NOTICE_IMAGE,NOTICE_PWD,NOTICE_HIT,NOTICE_DATE,NOTICE_UPDATE) values (4,'관리자','A.P.C KOREA 회원 혜택 안내','1. 신규 회원 가입 시 3만원 쿠폰 즉시 발급<br>- 쿠폰 유형: 장바구니 쿠폰<br>- 30만원 이상 구매 시 사용 가능 <br>- 사용 기간: 발급일 기준 30일 이내<br><br><br>2. 정상 구매시 제품 금액의 3%, OVERSTOCK 구매시 1% 적립 혜택<br><br><br>3. 개런티 카드 발급<br>- 가방, 지갑류 구매 시 정품 개런티카드가 발급됩니다.<br>- 개런티카드 보유 시 제품 수선(유/무상)이 가능합니다.  ',null,'1234',1,to_date('22/05/11','RR/MM/DD'),null);
Insert into SEMI.APC_NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONT,NOTICE_IMAGE,NOTICE_PWD,NOTICE_HIT,NOTICE_DATE,NOTICE_UPDATE) values (5,'관리자',' A.P.C. 액세서리 수선 관련 공지사항',null,'/2022-5-11/관리자_notice2.PNG','1234',1,to_date('22/05/11','RR/MM/DD'),null);
Insert into SEMI.APC_NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONT,NOTICE_IMAGE,NOTICE_PWD,NOTICE_HIT,NOTICE_DATE,NOTICE_UPDATE) values (1,'관리자','배송 및 반품 지연안내','안녕하세요. A.P.C. KOREA 입니다.<br><br>주문량 급증으로 인해 배송 및 반품 처리가 지연되고 있음을 알려드립니다.<br><br>순차적으로 배송 및 반품 처리될 예정이며, 평소보다 2~3일정도 지연되는 점 양해 부탁드립니다.<br><br>빠르게 처리 될 수 있도록 노력하겠습니다.<br><br>A.P.C. KOREA를 항상 사랑해주셔서 감사합니다 :D',null,'1234',1,to_date('22/05/11','RR/MM/DD'),null);
Insert into SEMI.APC_NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONT,NOTICE_IMAGE,NOTICE_PWD,NOTICE_HIT,NOTICE_DATE,NOTICE_UPDATE) values (2,'관리자','시스템점검 안내','안녕하세요. A.P.C. KOREA 입니다.<br><br>항상 A.P.C. KOREA를 이용해 주시고 사랑해 주시는 회원님께 감사의 말씀을 드립니다. <br>보다 안정적인 서비스 제공을 위해 A.P.C. KOREA 사이트 점검이 진행 될 예정입니다. <br><br>-   점검시간 : 5월 12일 (목) 06:00 ~ 07:00 (약 1시간 예상) <br><br><br>해당 점검시간에는 A.P.C. KOREA 사이트 접속이 불가하오니,<br>회원님의 깊은 양해바랍니다.<br><br>감사합니다.',null,'1234',0,to_date('22/05/11','RR/MM/DD'),null);
Insert into SEMI.APC_NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONT,NOTICE_IMAGE,NOTICE_PWD,NOTICE_HIT,NOTICE_DATE,NOTICE_UPDATE) values (3,'관리자',' A.P.C. 아이디룩몰 입점기념! 단독 이벤트 + 추가 혜택',null,'/2022-5-11/관리자_notice.PNG','1234',3,to_date('22/05/11','RR/MM/DD'),null);
Insert into SEMI.APC_NOTICE (NOTICE_NO,NOTICE_WRITER,NOTICE_TITLE,NOTICE_CONT,NOTICE_IMAGE,NOTICE_PWD,NOTICE_HIT,NOTICE_DATE,NOTICE_UPDATE) values (6,'관리자','CJ대한통운 파업으로 인한 배송지연 안내(수정)','안녕하세요, 아이디룩몰입니다.<br>CJ대한통운 파업으로 인한 배송지연 안내드립니다.<br><br><br>CJ대한통운 노조파업으로 인하여, 배송 및 반품 서비스가 원활하게 이루어지지 않고 있습니다.<br>해당 이슈로 불편함을 느끼고 있는 고객님께 죄송한 말씀을 드리며<br>택배사 파업 현황 및 해제여부는 확인되는대로 공지사항에 업데이트 할 수 있도록 하겠습니다.<br>파업지역 배송 주소지에 따라 배송이 지연될 수 있으니 이점 양해 부탁드립니다.<br><br><br>고객님의 배송서비스 이용에 불편을 드려 죄송합니다.<br>감사합니다.',null,'1234',3,to_date('22/05/12','RR/MM/DD'),to_date('22/05/12','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index SYS_C009443
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEMI"."SYS_C009443" ON "SEMI"."APC_NOTICE" ("NOTICE_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table APC_NOTICE
--------------------------------------------------------

  ALTER TABLE "SEMI"."APC_NOTICE" MODIFY ("NOTICE_WRITER" NOT NULL ENABLE);
  ALTER TABLE "SEMI"."APC_NOTICE" MODIFY ("NOTICE_TITLE" NOT NULL ENABLE);
  ALTER TABLE "SEMI"."APC_NOTICE" ADD PRIMARY KEY ("NOTICE_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
