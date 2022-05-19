create table book(
    book_id number(5),
    title varchar2(50),
    author varchar(10),
    pub_date date
);

ALTER TABLE book ADD (pubs VARCHAR2(5));
ALTER TABLE book MODIFY (title VARCHAR2(100));
ALTER TABLE book MODIFY (title VARCHAR2(50));

ALTER TABLE book RENAME COLUMN title TO subject;

RENAME book TO article;

DROP TABLE article;

select *
from article;

drop table book;
/*
? NOT NULL : NULL값 입력불가
? UNIQUE : 중복값 입력불가(NULL값 은 허용)
? PRIMARY KEY : NOT NULL + UNIQUE 즉, 데이터들끼리의 유일성을 보장하는 칼럼에 설정
테이블당 1개만 설정 가능 (여러 개를 묶어서 설정 가능)
? FOREIGN KEY = 외래키
일반적으로 REFERENCE 테이블의 PK를 참조
REFERENCE 테이블에 없는 값은 삽입 불가
REFERENCE 테이블의 레코드 삭제 시 동작
- ON DELETE CASCADE: 해당하는 FK를 가진 참조행도 삭제
- ON DELETE SET NULL: 해당하는 FK를 NULL로 바꿈
*/

create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);

insert into author
values(1,'박경리','토지 작가');

insert into author(author_id, author_name)
values(2,'이문열');

insert into author(author_name, author_id)
values('기안84','3');

insert into author
values(4);

select *
from author;

create table book(
    book_id number(10),
    title varchar2(100) not null,
    pubs varchar2(100),
    pub_date date,
    author_id number(10),
    primary key (book_id),
    constraint book_fk foreign key (author_id)
    references author(author_id)
);

select *
from book;

insert into book
values(1,'토지','마로니에북스','2012-08-15',1);

insert into book
values(2,'삼국지','민음사','2002/03/01',2);

update author
set author_desc = '삼국지 작가'
where author_id = '2';

update author
set author_desc = '웹툰작가';

update author
set author_name = '김경리',
    author_desc = '토지작가'
where author_id = 1;

update author
set author_name = '기안84'
where author_id = '3';

delete from author
where author_id = 1;

select *
from author;

--작가 시퀸스 만들기
create sequence seq_author_id
increment by 1
start with 1
nocache;

insert into author
values(seq_author_id.nextval,'박경리','토지 작가');

insert into author
values(seq_author_id.nextval,'이문열','삼국지 작가');

insert into author
values(seq_author_id.nextval,'기안84','웹툰작가');

insert into author
values(seq_author_id.nextval,'김지수','java');

insert into author
values(seq_author_id.nextval,'유재석','개그맨');

select *
from author;

--시퀀스 조회
select *
from user_sequences;

--현재 시퀀스 조회
select  seq_author_id.currval 
from dual;

--다음 시퀀스 조회
select  seq_author_id.nextval 
from dual;

--시퀀스 삭제
drop sequence seq_author_id;

commit;

insert into author
values(seq_author_id.nextval,'이효리','가수');

rollback;