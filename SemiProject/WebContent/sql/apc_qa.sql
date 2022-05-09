-- apc_qa 공지사항 테이블 

create table apc_qa(


	qa_no number(5) primary key					-- 문의게시글 번호
	mem_no_fk number(5) not null, 			   	-- 게시글 작성자
	qa_title varchar2(200) not null,    		-- 게시글 제목
	qa_cont varchar2(1000),            	 		-- 게시글 내용
	qa_pwd varchar2 (30),               		-- 게시글 작성/수정시 필요한 비밀번
	qa_hit number(5) default 0, 		  	 	-- 게시글 글 조회수
	qa_date date,					   			-- 게시글 작성일
	qa_update date,					   			-- 게시글 수정일
	qa_group number(5),							-- 게시판 글 그룹 (답글과 게시글 통합 관리할때 필요)
	qa_step number(5),							-- 게시판 글 답변 단계 , 
	qa_indent number(5)							-- 게시판 답변글 들여쓰기
	
	foreign key (mem_no_fk) references apc_member(mem_no)
	
);