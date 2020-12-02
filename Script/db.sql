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
    
insert into board_tbl values(board_tbl_seq.nextval, '��ȸ��', '����ó�� ������ ����', 'jsp ���׿�'       , '2018-07-31 12:34:56');
insert into board_tbl values(board_tbl_seq.nextval, '��ȸ��', '�� ������ ��ɻ� ��ƴ�' , 'jquery ��Ƴ׿�' , '2018-07-31 12:43:43');
insert into board_tbl values(board_tbl_seq.nextval, '��ȸ��', '����ó�� ������ ��ƴ�', 'jsp ��Ƴ׿�'    , '2018-08-01 13:34:56');
insert into board_tbl values(board_tbl_seq.nextval, '��ȸ��', '����ó�� ������ ����'  , 'jquery ���׿�'  , '2018-08-01 13:43:34');
insert into board_tbl values(board_tbl_seq.nextval, '��ȸ��', '������'             ,  'j���� �״�� ����' , '2018-08-02 13:12:10');
insert into board_tbl values(board_tbl_seq.nextval, '��ȸ��', '���� �״�� ����'      , '������'          , '2018-08-03 14:34:20');
insert into board_tbl values(board_tbl_seq.nextval, '��ȸ��', '�ϵ��ڵ��ϴ� �����'   , '�����ϸ� ����'     , '2018-08-04 14:56:30');
insert into board_tbl values(board_tbl_seq.nextval, '��ȸ��', 'github�� ����սô�'  , '�ż���'          , '2018-08-05 15:43:35');
insert into board_tbl values(board_tbl_seq.nextval, '��ȸ��', '��� �� ��������'      , '��ε� �𿩶�'     , '2018-08-06 16:21:40');
insert into board_tbl values(board_tbl_seq.nextval, '��ȸ��', '������'             , '��Ź��'          , '2018-08-07 17:01:45');


insert into comment_tbl values(comment_tbl_seq.nextval, 1, '��ȸ��', 'Lorem ipsum dolor sit amet'  , '2018-08-01 12:34:56');
insert into comment_tbl values(comment_tbl_seq.nextval, 3, '��ȸ��', 'consectetur adipiscing elit' , '2018-08-01 12:43:43');
insert into comment_tbl values(comment_tbl_seq.nextval, 5, '��ȸ��', 'sed do eiusmod tempor'       , '2018-08-02 13:34:56');
insert into comment_tbl values(comment_tbl_seq.nextval, 7, '��ȸ��', 'incididunt ut labore et'     , '2018-08-03 13:43:34');
insert into comment_tbl values(comment_tbl_seq.nextval, 9, '��ȸ��', 'dolore magna aliqua'         , '2018-08-04 13:12:10');
insert into comment_tbl values(comment_tbl_seq.nextval, 2, '��ȸ��', 'minim veniam, quis nostrud'  , '2018-08-04 14:34:20');
insert into comment_tbl values(comment_tbl_seq.nextval, 3, '��ȸ��', 'exercitation ulamco laboris' , '2018-08-05 14:56:30');
insert into comment_tbl values(comment_tbl_seq.nextval, 5, '��ȸ��', 'nisi ut aliquip'             , '2018-08-06 15:43:35');
insert into comment_tbl values(comment_tbl_seq.nextval, 7, '��ȸ��', 'ex ea commodo consequat'     , '2018-08-07 16:21:40');
insert into comment_tbl values(comment_tbl_seq.nextval, 2, '��ȸ��', 'Duis aute irure dolor'       , '2018-08-07 17:01:45');

select * from BOARD_TBL;
select * from comment_tbl;

select * from BOARD_TBL order by regdate desc;
select count(*) from BOARD_TBL;
select * from BOARD_TBL where idx = 1;

select writer, content, regdate from COMMENT_TBL where bidx = 10;


select sysdate from dual;




