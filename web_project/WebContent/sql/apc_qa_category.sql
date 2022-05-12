-- apc_qa_category 테이블 (20220428 추가)
-- qa게시판 분류

create table apc_qa_category(

	category_code varchar2(100) primary key, 	    -- 카테고리 번호
	category_name varchar2(100) not null	-- 카테고리 이름 
	
	
);

-- apc_qa_category 데이터 

insert into apc_qa_category values('CR', '취소/환불');  --Cancel/Refund
insert into apc_qa_category values('IQ', '상품문의');	  -- Inquiry
insert into apc_qa_category values('DEL', '배송');	  -- Delievery
insert into apc_qa_category values('SB', '반품');	  -- SendBack
insert into apc_qa_category values('ETC', '기타');	  -- Etc
