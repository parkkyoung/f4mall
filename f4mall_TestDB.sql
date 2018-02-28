--데이터베이스 생성
create database testDB

<<<<<<< HEAD
create database f4mall

=======
--테이블 생성
>>>>>>> branch 'master' of https://github.com/parkkyoung/f4mall
use f4mall;
CREATE TABLE dept (
       dept_no int
    );

--데이터 베이스 사용   
use f4mall;

--생성된 데이터베이스 보기
show databases

--테이블 삭제
use f4mall;
drop table sub_test;

use f4mall;
create table test(
	test_idx int primary key auto_increment,
	test_no int,
	test_text varchar(100)
);

use f4mall;
create table sub_test(
	sub_test_idx int primary key auto_increment,
	test_idx int not null,
	test_text text not null
)

--foreing key 생성하는 방법
use f4mall;
alter table sub_test add constraint fk_idx foreign key(test_idx) references test (test_idx)

use f4mall;
select * from sub_test;

--데이터베이스 사입
use f4mall;
insert into test (test_no,test_text) values (10,'string');
use f4mall;
insert into test (test_no,test_text) values (20,'글자');

--****************
/*
 auto_increment에 대한 설명
 Oracle에서 sequence사용하는 법과 MySql에서 사용하는 방법이 다릅니다
 MySQL에서는 auto_increment하면은 자동으로 1의 수만큼 증가합니다
 그리고 insert문도 다릅니다
 필드명(column)을 테이블 옆에 추가해줘야합니다
 **참고로 insert문에서 auto_increment 필드는 생략하면 됩니다.
 위의 SQL문을 참고하세요 
 * */
--****************

--데이터베이스 데이터 보기
use f4mall;
select * from test;

SHOW GRANTS FOR CURRENT_USER;



