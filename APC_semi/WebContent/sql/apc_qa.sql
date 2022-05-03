-- apc_qa 공지사항 테이블 

create table apc_qa(

	
	qa_no number(5) primary key,				-- 문의게시글 번호
	qa_category varchar2(100) not null,			-- qa게시판 카테고리  /20220428추가
	qa_memid varchar2(100) not null, 			-- 회원아이디(회원,비회원)
	qa_title varchar2(200) not null,    		-- 게시글 제목
	qa_cont varchar2(1000),            	 		-- 게시글 내용
	qa_pno_fk number(5),						-- 참조제품 /20220429추가
	qa_pwd varchar2 (30),               		-- 게시글 작성/수정시 필요한 비밀번
	qa_hit number(5) default 0, 		  	 	-- 게시글 글 조회수
	qa_date date,					   			-- 게시글 작성일
	qa_update date,					   			-- 게시글 수정일
	qa_group number(5),							-- 게시판 글 그룹 (답글과 게시글 통합 관리할때 필요)
	qa_step number(5),							-- 게시판 글 답변 단계 , 
	qa_indent number(5),						-- 게시판 답변글 들여쓰기
	
	foreign key (qa_category) references apc_qa_category(category_code), 
	foreign key (qa_pno_fk) references apc_products(pno) 
	
);

-- 20220426 수정 : qa_memno 삭제 , qa_memid 추가(외래키해제)
-- 20220428 수정 : qa_category 추가 
-- 20220429 수정 : memid 데이터타입변경, 카테고리코드 외래키 지정, qa_pno 추가

-- apc_qa 데이터 추가 

insert into apc_qa values (1, 'ETC', 'hong', '질문있어요', '질문질문', '', '1111', default, sysdate, '', 1, 0, 0);
insert into apc_qa values (2, 'IQ', 'choi', '니트관련', '니트가 많이 까실거리나요?', 2, '1111', default, sysdate, '', 2, 0, 0);
insert into apc_qa values (3, 'IQ', 'funfun', '티셔츠 사이즈', '아내가 55사이즈인데 어떤사이즈를 구매해야하죠?', 1, '1111', default, sysdate, '', 3, 0, 0);
insert into apc_qa values (4, 'ETC', 'hong', '적립금 사용기한', '적립금 사용기한이 어떻게 되나요?', '', '1111', default, sysdate, '', 4, 0, 0);
insert into apc_qa 
values (5, 'DEL', 'apcceo', '배송문의', '4월28일에 주문했는데 배송일정이 어떻게되나요? 빨리보내주세요', 2, '1111', default, sysdate, '', 5, 0, 0);
insert into apc_qa 
values (6, 'DEL', 'choi', '니트지연배송', '배송지연문자받았는데 오래걸릴까요?', 2, '1111', default, sysdate, '', 6, 0, 0);
insert into apc_qa 
	values (7, 'ETC', 'funfun', '이벤트당첨', '이벤트 당첨됐는데 상품 언제보내주세요?', '', '1111', default, sysdate, '', 7, 0, 0);
insert into apc_qa 
	values (8, 'ETC', 'hong', '적립금 소멸', '적립금이 갑자기 없어졌어요 복구시켜주세요', '', '1111', default, sysdate, '', 8, 0, 0);
insert into apc_qa 
values (9, 'SB', 'funfun', '사이즈가 안맞아요', '사이즈가 안맞아요 반품해주세요', 1, '1111', default, sysdate, '', 9, 0, 0);
insert into apc_qa 
values (10, 'CR', 'choi', '지연배송 취소', '배송이 생각보다 오래걸리네요 취소하고 환불해주세요', 2, '1111', default, sysdate, '', 10, 0, 0);