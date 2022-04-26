-- apc_category 카테고리 테이블

create table apc_category(

	category_no number(5) not null, 	    -- 카테고리 대분류 (1 Women 2 Men 3 Golf)
	category_code varchar2(8) primary key,  -- 카테고리 코드(중분류)
	category_name varchar2(100) not null	-- 카테고리 이름 
);

-- 20220426수정 : primary key (category_code)로 변경 