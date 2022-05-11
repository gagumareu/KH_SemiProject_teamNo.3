-- apc_category 카테고리 테이블

create table apc_category(

	category_no number(5) not null, 	    -- 카테고리 대분류 (1 Women 2 Men 3 Golf)
	category_code varchar2(8) primary key,  -- 카테고리 코드(중분류)
	category_name varchar2(100) not null,	-- 카테고리 이름 
	category_image varchar2(100)
);

-- 20220426수정 : primary key (category_code)로 변경 

-- CATEGORY 대분류
insert into apc_category
	values(1,'10000000','WOMEN','');
insert into apc_category
	values(2,'20000000','MEN','');
insert into apc_category
	values(3,'30000000','GOLF','');

-- apc_category 데이터

-- GOLF 중분류 WOMEN, MEN, ACC
insert into apc_category 
	values (3, '3W000000','WOMEN');
insert into apc_category 
	values (3, '3M000000','MEN');
insert into apc_category 
	values (3, '3A000000','ACC');

-- GOLF/WOMEN 소분류
insert into apc_category 
	values (3, '3WAT0000','WOMEN/TSHIRTS');
insert into apc_category 
	values (3, '3WBK0000','WOMEN/KNIT');
insert into apc_category 
	values (3, '3WCO0000','WOMEN/OUTER');
insert into apc_category 
	values (3, '3WDP0000','WOMEN/PANTS');
insert into apc_category 
	values (3, '3WES0000','WOMEN/SKIRTS');
insert into apc_category 
	values (3, '3WFD0000','WOMEN/DRESS');


-- GOLF/MEN 소분류
insert into apc_category 
	values (3, '3MAT0000','MEN/TSHIRTS');
insert into apc_category 
	values (3, '3MBK0000','MEN/KNIT');
insert into apc_category 
	values (3, '3MCO0000','MEN/OUTER');
insert into apc_category 
	values (3, '3MDP0000','MEN/PANTS');



