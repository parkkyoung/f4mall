/*	2018��3��7��(seo) 	*/
show databases;

SHOW GRANTS FOR CURRENT_USER;

use table test2();

use f4mall;
select * from product;

use f4mall;
create table abcde(

	xman int primary key auto_increment,
	xxman varchar(200) not null

)

use f4mall;
create table abc(
	test_test int,
	test_string varchar(100)
)


use f4mall;
create table abck(
	test_test int,/*eee*/
	test_string varchar(100)
)


use f4mall;
create table board(
	b_no bigint primary key auto_increment,	/*�Խ��ǹ�ȣPK*/
	m_id varchar(200) not null,							/*ȸ�����̵�FK*/
	b_name varchar(200) not null,						/*�Խñ�����*/
	b_content text not null,							/*����*/
	b_ip varchar(200) not null,							/*�ۼ���IP*/
	b_readhit int default 0, 							/*��ȸ��*/
	b_regdate date,										/*�ۼ�����*/
	b_notice int default 0,								/*��������*/
	b_ref	int default 0,								/*���α۹�ȣ N������*/
	b_step int default 0, 								/*�������� N�������� ����*/
	b_depth int default 0								/*����  N������������ �´� �Ϳ� ����*/
	)
	/*forignkey m_id �־��� �� �׸��� create���ȿ� -- ������ �������ϴ�.*/

/*�Ϲݱ� */
use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u1','1��1-0��','1����','111.223.0.22',now(),1,0,0)

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u2','2��1-1��','2����','111.223.0.22',now(),1,1,0)

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u3','3��2-0��','3����','111.223.0.22',now(),2,0,0)

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u4','4��3-0��','4����','111.223.0.22',now(),3,0,0)

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u5','5��2-1��','5����','111.223.0.22',now(),2,1,0)

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u6','6��1-3��','6����','111.223.0.22',now(),1,3,0)

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u7','7��1-3-1��','7����','111.223.0.22',now(),1,3,1)


/*�������ױ�*/

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_notice) values('admin','���������Դϴ�.','���������Դϴ�.','111.223.0.22',now(),1)



/* ��Ÿ Board Ȯ�� �� ����*/

use f4mall;
select * from board;
	
	
use f4mall;	
drop table board

use f4mall;	
select * from board order by b_ref desc, b_step asc;

/*	//2018��3��7��(seo) 	*/