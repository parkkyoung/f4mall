

-- Member DataBase --

use f4mall;
create table member (
	m_id 		varchar(200) primary key auto_increment,
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


	
/*-- Member_DB sample
-- Oracle���� date sysdate / MySQL ������ now() ó��
use f4mall;
insert into member (m_id,m_pwd,m_name,m_ip,m_regdate,m_tel) 
values('kimbongsung@hotmail.com','kbs123123','','123.456.78',now(),010-1234-1234);*/

use f4mall;
select * from member;

use f4mall;
drop table h_test;

use f4mall;
drop table member;


--���̺� �������� Ȯ��(foreign key Ȯ��)
use f4mall;
select * from information_schema.table_constraints where table_name = 'member';


-- foreign key �߰� ����(ȸ�����̺� ����)
-- on delete cascade �ɼ� => �����ϴ� �θ����̺��� column�� �����Ǹ� �ڽ� ���̺��� column�� ��� �����϶�
--ī�װ� �ڵ�
use f4mall;
alter table member add constraint
	fk_category_no FOREIGN KEY (category_no) REFERENCES category (category_no) on delete cascade;

use f4mall;
select * from member

use f4mall;
select * from category
	
--���� �ڵ�
use f4mall;
alter table member add constraint fk_m_material_no 
	FOREIGN KEY (material_no) REFERENCES material (material_no) on delete cascade;

--���� �ڵ�
use f4mall;
alter table member add constraint
	fk_m_color_no FOREIGN KEY (color_no) REFERENCES color (color_no) on delete cascade;

--���� �ڵ�
use f4mall;
alter table member add constraint
	fk_m_sex_no FOREIGN KEY (sex_no) REFERENCES sex (sex_no) on delete cascade;

--�귣�� �ڵ�
use f4mall;
alter table member add constraint
	fk_m_brand_no FOREIGN KEY (brand_no) REFERENCES brand (brand_no) on delete cascade;

--������ �ڵ�
use f4mall;
alter table member add constraint
	fk_m_size_no FOREIGN KEY (size_no) REFERENCES size (size_no) on delete cascade;


