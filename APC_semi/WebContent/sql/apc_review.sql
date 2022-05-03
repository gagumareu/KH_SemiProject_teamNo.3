-- apc_review 리뷰 테이블

create table apc_review(

	review_no number(7) primary key,		--리뷰 번호
	pno_fk 	number(5) not null,				--제품 번호
	pname varchar2(50),
	psize varchar2(100),
	pcolor  VARCHAR2(50),					--제품 칼라
	memid_fk varchar2(50) not null,		    --리뷰 작성자
	review_rate number(5),					--리뷰 점수
	review_cont varchar2(1000) not null,	--리뷰 내용
	review_image varchar2(100),				--리뷰 이미지
	review_pwd varchar2(50),				--리뷰 비밀번호
	review_date date,						--리뷰 날짜	
	
	foreign key (memid_fk) references apc_member(mem_id),
	foreign key (pno_fk) references apc_products(pno)
	
);

-- 20220426수정 : pno외래키추가 / memid 외래키 설정
-- 20220503수정: review_rate 추가 + pname psize, pcolor 추가 