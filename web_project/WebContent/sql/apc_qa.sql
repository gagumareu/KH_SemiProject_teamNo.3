--------------------------------------------------------
--  파일이 생성됨 - 월요일-5월-16-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table APC_QA
--------------------------------------------------------

  CREATE TABLE "SEMI"."APC_QA" 
   (	"QA_NO" NUMBER(5,0), 
	"QA_CATEGORY" VARCHAR2(100 BYTE), 
	"QA_MEMID" VARCHAR2(100 BYTE), 
	"QA_TITLE" VARCHAR2(200 BYTE), 
	"QA_CONT" VARCHAR2(1000 BYTE), 
	"QA_PNO_FK" NUMBER(5,0), 
	"QA_PWD" VARCHAR2(30 BYTE), 
	"QA_HIT" NUMBER(5,0) DEFAULT 0, 
	"QA_DATE" DATE, 
	"QA_UPDATE" DATE, 
	"QA_GROUP" NUMBER(5,0), 
	"QA_STEP" NUMBER(5,0), 
	"QA_INDENT" NUMBER(5,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SEMI.APC_QA
SET DEFINE OFF;
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (1,'ETC','hong','질문있어요','질문질문',null,'1111',0,to_date('22/04/29','RR/MM/DD'),null,1,0,0);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (2,'IQ','choi','니트관련','니트가 많이 까실거리나요?',1,'1111',1,to_date('22/05/01','RR/MM/DD'),null,2,0,0);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (3,'IQ','funfun','티셔츠 사이즈','아내가 55사이즈인데 어떤사이즈를 구매해야하죠?',5,'1111',7,to_date('22/05/02','RR/MM/DD'),null,3,0,0);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (4,'ETC','hong','적립금 사용기한','적립금 사용기한이 어떻게 되나요?',null,'1111',5,to_date('22/05/07','RR/MM/DD'),null,4,0,0);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (5,'DEL','apcceo','배송문의','4월28일에 주문했는데 배송일정이 어떻게되나요? 빨리보내주세요',13,'1111',4,to_date('22/05/08','RR/MM/DD'),null,5,0,0);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (6,'DEL','choi','니트지연배송','배송지연문자받았는데 오래걸릴까요?111',4,'1111',23,to_date('22/05/10','RR/MM/DD'),null,6,0,0);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (7,'ETC','funfun','이벤트당첨','이벤트 당첨됐는데 상품 언제보내주세요?',null,'1111',0,to_date('22/05/11','RR/MM/DD'),null,7,0,0);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (8,'ETC','hong','적립금 소멸','적립금이 갑자기 없어졌어요 복구시켜주세요',null,'1111',0,to_date('22/05/13','RR/MM/DD'),null,8,0,0);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (9,'SB','funfun','사이즈가 안맞아요','사이즈가 안맞아요 반품해주세요',5,'1111',49,to_date('22/05/13','RR/MM/DD'),null,9,0,0);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (10,'CR','choi','지연배송 취소','배송이 생각보다 오래걸리네요 취소하고 환불해주세요',4,'1111',65,to_date('22/05/14','RR/MM/DD'),null,10,0,0);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (14,'ETC','관리자','적립금 문의에 대해 답변드립니다.','안녕하세요 고객님. A.P.C 온라인 스토어를 이용해 주셔서 감사합니다.<br><br>문의주신 적립금은 시스템 오류로 잠시 웹 페이지에서 누락됬던 것으로 확인되었습니다.<br><br>적립금은 즉시 복구 처리하였습니다.<br><br>이용해 주셔서 감사드리며, 추가 문의사항이 있으신 경우 재문의 부탁드립니다.<br><br>감사합니다. :)',null,null,1,to_date('22/05/16','RR/MM/DD'),null,8,1,1);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (15,'DEL','관리자','배송 문의에 대한 답변입니다.','안녕하세요 고객님. A.P.C 온라인 스토어를 이용해 주셔서 감사합니다.<br><br>본 제품은 배송이 시작된 것으로 확인됩니다.<br><br>이용해 주셔서 감사드리며, 추가 문의사항이 있으신 경우 재문의 부탁드립니다.<br><br>감사합니다. :)',13,null,1,to_date('22/05/16','RR/MM/DD'),null,5,1,1);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (12,'ETC','관리자','적립금 문의에 대해 답변드립니다.','안녕하세요 고객님. A.P.C 온라인 스토어를 이용해 주셔서 감사합니다.<br><br>문의주신 고객님의 적립금 사용기간은 2022년 6월30일까지 사용가능한것으로 확인됩니다.<br><br>이용해 주셔서 감사드리며, 추가 문의사항이 있으신 경우 재문의 부탁드립니다.<br><br>감사합니다. :)',null,null,1,to_date('22/05/16','RR/MM/DD'),null,4,1,1);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (13,'CR','관리자','답변입니다.','안녕하세요 고객님. A.P.C 온라인 스토어를 이용해 주셔서 감사합니다.<br><br>배송이 지연된점 사과드리며, 제품은 즉시 환불처리 해드리겠습니다.<br><br>이용에 불편을 드려 대단히 죄송합니다.<br><br>감사합니다. :)',4,null,0,to_date('22/05/16','RR/MM/DD'),null,10,1,1);
Insert into SEMI.APC_QA (QA_NO,QA_CATEGORY,QA_MEMID,QA_TITLE,QA_CONT,QA_PNO_FK,QA_PWD,QA_HIT,QA_DATE,QA_UPDATE,QA_GROUP,QA_STEP,QA_INDENT) values (11,'IQ','관리자','답변입니다.(수정)','안녕하세요 고객님. A.P.C 온라인 스토어를 이용해 주셔서 감사합니다.<br><br>본 제품은 가볍고 소프트한 원사를 사용하였기 때문에 착용감이 우수한 제품입니다.<br><br>따라서 큰 불편함 없이 착용하실 수 있으실 것으로 예상됩니다.<br><br>이용해 주셔서 감사드리며, 추가 문의사항이 있으신 경우 재문의 부탁드립니다.<br><br>감사합니다. :)',1,null,0,to_date('22/05/16','RR/MM/DD'),null,2,1,1);
--------------------------------------------------------
--  DDL for Index SYS_C009541
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEMI"."SYS_C009541" ON "SEMI"."APC_QA" ("QA_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table APC_QA
--------------------------------------------------------

  ALTER TABLE "SEMI"."APC_QA" MODIFY ("QA_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "SEMI"."APC_QA" MODIFY ("QA_MEMID" NOT NULL ENABLE);
  ALTER TABLE "SEMI"."APC_QA" MODIFY ("QA_TITLE" NOT NULL ENABLE);
  ALTER TABLE "SEMI"."APC_QA" ADD PRIMARY KEY ("QA_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table APC_QA
--------------------------------------------------------

  ALTER TABLE "SEMI"."APC_QA" ADD FOREIGN KEY ("QA_CATEGORY")
	  REFERENCES "SEMI"."APC_QA_CATEGORY" ("CATEGORY_CODE") ENABLE;
  ALTER TABLE "SEMI"."APC_QA" ADD FOREIGN KEY ("QA_PNO_FK")
	  REFERENCES "SEMI"."APC_PRODUCTS" ("PNO") ENABLE;
