

-- Member DataBase --

use f4mall;
create table member (
	m_id 		varchar(200) primary key,
	o_no 		int,
	category_no int,
	material_no int,
	color_no	int,
	sex_no		int,
	brand_no	int,
	size_no		int,
	m_pwd		varchar(200) not null,
	m_name		varchar(200) not null,
	m_addr		varchar(200),
	m_addr_d	varchar(200),
	m_zipcode	varchar(200),
	m_ip		varchar(200) not null,
	m_regdate	date not null,
	m_tel		int  not null,
	m_image		text
);


-- �⺻Ű(primary key)
alter table member
	add constraint pk_m_id primary key(m_id);

	
-- Member_DB sample
-- Oracle ������ date ó���� sysdate / MySQL������ now() �� ó��
use f4mall;
insert into member (m_id,m_pwd,m_name,m_ip,m_regdate,m_tel) values('kimbongsung@hotmail.com','kbs123123','�����','123.456.78',now(),010-1234-1234);
	
	
	
	
	
	
	
	
		
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
