

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
	b_no bigint not null primary key auto_increment,	/*�Խ��ǹ�ȣPK*/
	m_id varchar(200) not null,							/*ȸ�����̵�FK*/
	b_name varchar(200) not null,						/*�Խñ�����*/
	b_content text not null,							/*����*/
	b_ip varchar(200) not null,							/*�ۼ���IP*/
	b_readhit int, 										/*��ȸ��*/
	b_regdate date,										/*�ۼ�����*/
	b_notice int,										/*��������*/
	b_ref	int,										/*���α۹�ȣ*/
	b_step int, 										/*��������*/
	b_depth int											/*����*/
	)
	/*forignkey m_id �־��� �� �׸��� create���ȿ� -- ������ �������ϴ�.*/
	
	
	