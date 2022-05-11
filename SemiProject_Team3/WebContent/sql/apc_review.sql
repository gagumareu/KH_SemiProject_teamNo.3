-- apc_review 리뷰 테이블

create apc_review(

	review_no number(7) primary key,		--리뷰 번호
	pno_fk 	number(5) not null,				--제품 번호
	review_cont varchar2(1000) not null,	--리뷰 내용
	review_memid varchar2(50) not null,		--리뷰 작성자
	review_image varchar2(100),				--리뷰 이미지
	review_pwd varchar2(50)					--리뷰 비밀번호
	review_date date,						--리뷰 날짜
	
	


);