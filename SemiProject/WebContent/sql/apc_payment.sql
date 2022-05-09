-- apc_payment 결제 테이블

create table apc_payment(

	order_no number(5) primary key, 				-- 주문번호
	mem_no_fk number(5) not null,					-- 회원번호 
	category_no_fk number(5) not null,				-- 카테고리번호
	pname varchar2(50) not null,					-- 상품명	
	pqty number(5) not null,						-- 수량
	price number(10) not null,						-- 가격
	transcost number(10) not null default 3000,		-- 배송비
	paytype number(1) not null check (paytype < 3),  -- 결제타입(0 계좌이체, 1 카드결제)
	orderdate date not null,						-- 주문날짜
	ordername varchar2(50) not null,				-- 주문자 이름
	orderaddr varchar2(1000) not null,				-- 주문자 주소
	orderphone varchar2(50) not null,				-- 주문자 연락처
	
	foreign key (mem_no_fk) references apc_member(mem_no),
	foreign key (category_no_fk) references apc_category(category_no)
	
);