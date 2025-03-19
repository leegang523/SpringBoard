show databases;

create database 데이터베이스명;

create datebase spring;

use spring;

create table hun_board(
    bno int auto_increment,
    title varchar(150),
    content varchar(2000),
    writer varchar(50),
    regdate timestamp default now(),
    updatedate timestamp default now(),
    constraint pk_board PRIMARY key(bno)
);

insert into hun_board(title, content, writer) values ('테스트 제목1', '테스트 내용1', '작가');
insert into hun_board(title, content, writer) values ('테스트 제목2', '테스트 내용2', '작가');
insert into hun_board(title, content, writer) values ('테스트 제목3', '테스트 내용3', '작가');
insert into hun_board(title, content, writer) values ('테스트 제목4', '테스트 내용4', '작가');
insert into hun_board(title, content, writer) values ('테스트 제목5', '테스트 내용5', '작가');
insert into hun_board(title, content, writer) values ('테스트 제목6', '테스트 내용6', '작가');
insert into hun_board(title, content, writer) values ('테스트 제목7', '테스트 내용7', '작가');
insert into hun_board(title, content, writer) values ('테스트 제목8', '테스트 내용8', '작가');
insert into hun_board(title, content, writer) values ('테스트 제목9', '테스트 내용9', '작가');
insert into hun_board(title, content, writer) values ('테스트 제목10', '테스트 내용10', '작가');

 
select * from hun_board;