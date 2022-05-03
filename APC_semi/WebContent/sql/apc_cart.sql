-- apc_cart 테이블 

create table apc_cart (

	cart_no number(5) primary key,			-- 카트 번호
	pno_fk number(5) not null,				-- 상품 제품번호            
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

-- 20220426 수정 : memno 참조 -> cart_memid 수정 (외래키 해제)

insert into apc_cart 
values(1, 3, 'hong', 'Sermaise T-Shirts (white)', 1, 'XS', 'WHITE', 289000, default, '');