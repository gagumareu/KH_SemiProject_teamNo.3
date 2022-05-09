-- apc_notice 공지사항 테이블 

create table apc_notice(


	notice_no number(5) primary key,			-- 게시글 번호
	notice_writer varchar2(30) not null,    	-- 게시글 작성자
	notice_title varchar2(200) not null,    	-- 게시글 제목
	notice_cont varchar2(1000),             	-- 게시글 내용
	notice_image varchar2(1000),				-- 게시글 이미지 첨부파일
	notice_pwd varchar2 (30),               	-- 게시글 작성/수정시 필요한 비밀번호
	notice_hit number(5) default 0, 		   	-- 게시글 글 조회수
	notice_date date,					   		-- 게시글 작성일
	notice_update date					   		-- 게시글 수정일
	
);

-- 20220426 수정 : 게시글 이미지 추가 