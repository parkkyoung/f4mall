

-- Member DataBase --

use f4mall;
create table member(
		m_id 		varchar(200) primary key,
		m_pwd 		varchar(200) not null,
		m_name 		varchar(200) not null,
		m_nick 		varchar(200) not null,
		m_addr 		varchar(200),
		m_zipcode 	varchar(200),
		m_addr_d 	varchar(200),
		m_ip 		varchar(200) not null,
		m_regdate 	datetime not null,
		m_tel 		int not null,
		m_grade 	int,
		m_image 	text
)




use f4mall;
insert into member (m_id,m_pwd,m_name,m_nick,m_ip,m_regdate,m_tel,m_grade)
values('admin@f4mall.com','f4mall','admin','f4@admin','localhost',now(),01012341234,1)


use f4mall;
select * from member;

use f4mall;
update member
set m_grade = 1
where m_id like 'admin@f4mall.com';






use f4mall;
drop table member;

use f4mall;
delete from member;
	
/*-- Member_DB sample
-- Oracle에서 date sysdate / MySQL 에서는 now() 처리
use f4mall;
insert into member (m_id,m_pwd,m_name,m_ip,m_regdate,m_tel) 
<<<<<<< HEAD
values('kimbongsung@hotmail.com','kbs123123','','123.456.78',now(),010-1234-1234);
	
		
use f4mall;
create table h_test(
	pk_no int primary key,
	fk_no int
)

use f4mall;
create table sub_h_test(
	sub_pk int primary key,
	h_fk int
)


use f4mall;
select * from member;

use f4mall;
drop table h_test;

use f4mall;
drop table member;


--테이블 제약조건 확인(foreign key 확인)
use f4mall;
select * from information_schema.table_constraints where table_name = 'member';


