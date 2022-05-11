-- apc_admin 관리자 테이블

create table apc_admin(

	admin_id varchar2(30) primary key,		-- 관리자 아이디
	admin_pwd varchar2(30) not null,		-- 관리자 비밀번호
	admin_name varchar2(50) not null,		-- 관리자 이름
	admin_email varchar2(200),				-- 관리자 이메일
	admin_date date							-- 관리자 등록 날짜

);


-- admin_shop 데이터 등록

insert into apc_admin
	values('admin', '1111', '관리자', 'admin@naver.com', sysdate);
-- apc_category
create table apc_category(

	category_no number(5) not null, 	    -- 카테고리 대분류 (1 Women 2 Men 3 Golf)
	category_code varchar2(8) primary key,  -- 카테고리 코드(중분류)
	category_name varchar2(100) not null,	-- 카테고리 이름
	category_image varchar2(100)
);

-- apc_member 

create table apc_member (

	--mem_no number(5) primary key,			--회원 번호 (생략)
	mem_id varchar2(50) primary key,		--회원 아이디
	mem_pwd varchar2(100) not null,			--회원 비밀번호
	mem_name varchar2(50) not null,			--회원 이름
	phone varchar2(100) not null,			--연락처
	email varchar2(100)not null,			--이메일
	birth date,								--생일
	addr varchar2(200),						--주소
	mem_mileage number(7) default 0,		--마일리지
	regdate date							--회원등록 일자

);

-- apc_products
create table apc_products (

	pno number(5) primary key,				--상품번호
	pname varchar2(50) not null,			--상품명
	pcategory_fk varchar2(8) not null,		--카테고리코드
	pimage varchar2(100),					--상품이미지(상품파일명)
	pqty number(5) default 0,				--상품 수량
	price number(10) default 0,				--가격
	psize varchar2(100),					--상품 규격 
	pcolor varchar2(50),					--상품 색상
	picon varchar2(30),						--제품 아이콘(인기,최신,추천,보통)
	pcontents varchar2(1000),				--상품 설명
	mileage number(6) default 0,			--상품 마일리지
	pinputdate date, 						--입고일
	
	foreign key (pcategory_fk) references apc_category(category_code) 
);

-- apc_cart
create table apc_cart (

	cart_no number(5) primary key,			-- 카트 번호
	pno_fk number(5) not null,			-- 상품 제품번호            
	cart_memid varchar2(50) not null,	    -- 카트 사용자 아이디
	cart_pname varchar2(100) not null,		-- 상품 이름
	cart_pqty number(5) not null,			-- 상품 수량
	cart_psize varchar2(100),				-- 상품 규격 
	cart_pcolor varchar2(50),				-- 상품 색상
	cart_price number(8) not null,			-- 상품 가격
	cart_trans number(8) default 3000,		-- 배송비
	cart_pimage varchar2(500),				-- 상품 이미지
	
	foreign key (pno_fk) references apc_products(pno)
	
);

-- apc_notice
create table apc_notice(


	notice_no number(5) primary key,			-- 게시글 번호
	notice_writer varchar2(30) not null,    	-- 게시글 작성자
	notice_title varchar2(200) not null,    	-- 게시글 제목
	notice_cont varchar2(1000),             	-- 게시글 내용
	notice_image varchar2(1000),				-- 게시글 이미지 첨부파일
	notice_pwd varchar2 (30),               	-- 게시글 작성/수정시 필요한 비밀번호
	notice_hit number(5) default 0, 		   	-- 게시글 글 조회수
	notice_date date,					   		-- 게시글 작성일
	notice_update date					   		-- 게시글 수정일
	
);

-- pac_payment
create table apc_payment(

	order_no number(5) primary key, 				-- 주문번호
	cartno_fk number(5),							-- 카트번호
	order_id number(5) not null,					-- 주문아이디(비회원,회원통합관리) 
	category_fk varchar2(8) not null,				-- 카테고리 코드
	pname varchar2(50) not null,					-- 상품명	
	pqty number(5) not null,						-- 수량
	price number(10) not null,						-- 가격
	transcost number(10) default 3000,		-- 배송비
	paytype number(1) not null check (paytype < 3),  -- 결제타입(0 계좌이체, 1 카드결제)
	orderdate date not null,						-- 주문날짜
	ordername varchar2(50) not null,				-- 주문자 이름
	orderaddr varchar2(1000) not null,				-- 주문자 주소
	orderphone varchar2(50) not null,				-- 주문자 연락처
	
	foreign key (category_fk) references apc_category(category_code),
	foreign key (cartno_fk) references apc_cart(cart_no)
	
);

-- apc_qa
create table apc_qa(


	qa_no number(5) primary key,				-- 문의게시글 번호
	qa_memid number(5) not null, 			   	-- 회원아이디(회원,비회원)
	qa_title varchar2(200) not null,    		-- 게시글 제목
	qa_cont varchar2(1000),            	 		-- 게시글 내용
	qa_pwd varchar2 (30),               		-- 게시글 작성/수정시 필요한 비밀번
	qa_hit number(5) default 0, 		  	 	-- 게시글 글 조회수
	qa_date date,					   			-- 게시글 작성일
	qa_update date,					   			-- 게시글 수정일
	qa_group number(5),							-- 게시판 글 그룹 (답글과 게시글 통합 관리할때 필요)
	qa_step number(5),							-- 게시판 글 답변 단계 , 
	qa_indent number(5)							-- 게시판 답변글 들여쓰기
	
	
);

-- apc_review
create table apc_review(

	review_no number(7) primary key,		--리뷰 번호
	pno_fk 	number(5) not null,				--제품 번호
	memid_fk varchar2(50) not null,		    --리뷰 작성자
	review_cont varchar2(1000) not null,	--리뷰 내용
	review_image varchar2(100),				--리뷰 이미지
	review_pwd varchar2(50),				--리뷰 비밀번호
	review_date date,						--리뷰 날짜	
	
	foreign key (memid_fk) references apc_member(mem_id),
	foreign key (pno_fk) references apc_products(pno)
	
);

-- apc_category GOLF부분 데이터 (20220426)
-- GOLF 중분류 WOMEN, MEN, ACC
insert into apc_category 
	values (3, '3G100000','WOMEN');
insert into apc_category 
	values (3, '3G200000','MEN');
insert into apc_category 
	values (3, '3G300000','ACC');

-- GOLF/WOMEN 중분류
insert into apc_category 
	values (3, '3G1T0000','WOMEN/TSHIRTS');
insert into apc_category 
	values (3, '3G1K0000','WOMEN/KNIT');
insert into apc_category 
	values (3, '3G1O0000','WOMEN/OUTER');
insert into apc_category 
	values (3, '3G1P0000','WOMEN/PANTS');
insert into apc_category 
	values (3, '3G1S0000','WOMEN/SKIRTS');
insert into apc_category 
	values (3, '3G1D0000','WOMEN/DRESS');

-- GOLF/MEN 중분류
insert into apc_category 
	values (3, '3G2T0000','MEN/TSHIRTS');
insert into apc_category 
	values (3, '3G2K0000','MEN/KNIT');
insert into apc_category 
	values (3, '3G2O0000','MEN/OUTER');
insert into apc_category 
	values (3, '3G2P0000','MEN/PANTS');
    
-------GOLF/WOMEN 상세데이터
insert into apc_category 
	values (3, '3G1T0001','Quincy Knit Vest');	
insert into apc_category 
	values (3, '3G1T0002','Saules T-Shirts');	
insert into apc_category 
	values (3, '3G1T0003','Sermaise T-Shirts');	

insert into apc_category 
	values (3, '3G1K0001','Cernay Knit Vest');	

insert into apc_category 
	values (3, '3G1O0001','Nanterre Wind-Breaker');

insert into apc_category 
	values (3, '3G1P0001','Saint Maur Pants');

insert into apc_category 
	values (3, '3G1S0001','Lognes Skort');

insert into apc_category 
	values (3, '3G1D0001','Bacon One-Piece');

