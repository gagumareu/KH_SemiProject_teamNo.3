-- apc_admin 관리자 테이블

create table apc_admin(

	admin_id varchar2(30) primary key,		-- 관리자 아이디
	admin_pwd varchar2(30) not null,		-- 관리자 비밀번호
	admin_name varchar2(50) not null,		-- 관리자 이름
	admin_email varchar2(200),				-- 관리자 이메일
	admin_date date							-- 관리자 등록 날짜

);


-- admin_shop 데이터 등록

insert into apc_admin
	values('admin', '1111', '관리자', 'admin@naver.com', sysdate);