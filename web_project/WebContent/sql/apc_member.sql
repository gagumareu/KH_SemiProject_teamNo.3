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

-- apc_member 데이터 

insert into apc_member values('hong', '1111','홍길동','010-1111-1111','hong@gmail.com', '1980-12-19', '서울시 중구', default, sysdate);
insert into apc_member values('funfun', '1111','유재석','010-2111-1111','fun@gmail.com', '1979-08-23', '서울시 서초구', default, sysdate);
insert into apc_member values('choi', '1111','샤론최','010-3111-1111','choi@gmail.com', '1989-05-01', '경기도 성남시', default, sysdate);
insert into apc_member values('apcceo', '1111','김재풍','010-4111-1111','apc@gmail.com', '1975-01-13', '경기도 평택시', default, sysdate);