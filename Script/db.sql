drop table board_tbl;
drop table comment_tbl;
drop sequence board_tbl_seq;
drop sequence comment_tbl_seq;

create table board_tbl(
	idx 	number(6),
	writer	varchar2(20),
	subject varchar2(255),
	content clob,
	regdate	timestamp,
	primary key (idx)
);

create table comment_tbl(
	idx		number(6),
	bidx	number(6),
	writer	varchar2(20),
	content clob,
	regdate	timestamp,
	primary key(idx)
);

create sequence board_tbl_seq
    start with 1
    increment by 1
    minvalue 1;

create sequence comment_tbl_seq
    start with 1
    increment by 1
    minvalue 1;
    
insert into board_tbl values(board_tbl_seq.nextval, '김회원', '정보처리 산업기사 쉽다', 'jsp 쉽네요'       , '2018-07-31 12:34:56');
insert into board_tbl values(board_tbl_seq.nextval, '김회원', '웹 디자인 기능사 어렵다' , 'jquery 어렵네요' , '2018-07-31 12:43:43');
insert into board_tbl values(board_tbl_seq.nextval, '이회원', '정보처리 산업기사 어렵다', 'jsp 어렵네요'    , '2018-08-01 13:34:56');
insert into board_tbl values(board_tbl_seq.nextval, '이회원', '정보처리 산업기사 쉽다'  , 'jquery 쉽네요'  , '2018-08-01 13:43:34');
insert into board_tbl values(board_tbl_seq.nextval, '박회원', 'ㅈㄱㄴ'             ,  'j제목 그대로 내용' , '2018-08-02 13:12:10');
insert into board_tbl values(board_tbl_seq.nextval, '박회원', '제목 그대로 내용'      , 'ㅈㄱㄴ'          , '2018-08-03 14:34:20');
insert into board_tbl values(board_tbl_seq.nextval, '강회원', '하드코딩하는 사람들'   , '가입하면 좋음'     , '2018-08-04 14:56:30');
insert into board_tbl values(board_tbl_seq.nextval, '나회원', 'github를 사용합시다'  , '신세계'          , '2018-08-05 15:43:35');
insert into board_tbl values(board_tbl_seq.nextval, '문회원', '노는 게 제일좋아'      , '모두들 모여라'     , '2018-08-06 16:21:40');
insert into board_tbl values(board_tbl_seq.nextval, '지회원', '여름아'             , '부탁해'          , '2018-08-07 17:01:45');


insert into comment_tbl values(comment_tbl_seq.nextval, 1, '김회원', 'Lorem ipsum dolor sit amet'  , '2018-08-01 12:34:56');
insert into comment_tbl values(comment_tbl_seq.nextval, 3, '김회원', 'consectetur adipiscing elit' , '2018-08-01 12:43:43');
insert into comment_tbl values(comment_tbl_seq.nextval, 5, '이회원', 'sed do eiusmod tempor'       , '2018-08-02 13:34:56');
insert into comment_tbl values(comment_tbl_seq.nextval, 7, '이회원', 'incididunt ut labore et'     , '2018-08-03 13:43:34');
insert into comment_tbl values(comment_tbl_seq.nextval, 9, '박회원', 'dolore magna aliqua'         , '2018-08-04 13:12:10');
insert into comment_tbl values(comment_tbl_seq.nextval, 2, '박회원', 'minim veniam, quis nostrud'  , '2018-08-04 14:34:20');
insert into comment_tbl values(comment_tbl_seq.nextval, 3, '강회원', 'exercitation ulamco laboris' , '2018-08-05 14:56:30');
insert into comment_tbl values(comment_tbl_seq.nextval, 5, '나회원', 'nisi ut aliquip'             , '2018-08-06 15:43:35');
insert into comment_tbl values(comment_tbl_seq.nextval, 7, '문회원', 'ex ea commodo consequat'     , '2018-08-07 16:21:40');
insert into comment_tbl values(comment_tbl_seq.nextval, 2, '지회원', 'Duis aute irure dolor'       , '2018-08-07 17:01:45');

select * from BOARD_TBL;
select * from comment_tbl;

select * from BOARD_TBL order by regdate desc;
select count(*) from BOARD_TBL;
select * from BOARD_TBL where idx = 1;

select writer, content, regdate from COMMENT_TBL where bidx = 10;


select sysdate from dual;




