-- apc_products 제품 테이블 

create table apc_products (

	pno number(5) primary key,				--상품번호
	pname varchar2(50) not null,			--상품명
	pcategory_fk varchar2(10) not null,		--카테고리코드
	pimage varchar2(100),					--상품이미지(상품파일명)
	pqty number(5) default 0,				--상품 수량
	price number(10) default 0,				--가격
	psize varchar2(100),					--상품 규격 
	pcolor varchar2(50),					--상품 색상
	picon varchar2(30),						--제품 아이콘(인기,최신,추천,보통)
	pcontents varchar2(1000),				--상품 설명
	mileage number(6) default 0,			--상품 마일리지
	pinputdate date 						--입고일
);