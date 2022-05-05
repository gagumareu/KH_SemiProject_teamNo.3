-- apc_category 카테고리 테이블

create table apc_category(

	category_no number(5) primary key, 	-- 카테고리 번호
	category_code varchar2(8) not null,		-- 카테고리 코드
	category_name varchar2(100) not null	-- 카테고리 이름
);