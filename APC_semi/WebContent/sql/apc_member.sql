-- apc_member 회원 테이블

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

-- 20220426수정: memno삭제, mem_id (primary key)