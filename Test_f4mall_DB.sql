--�����ͺ��̽� ����
create database testDB

<<<<<<< HEAD
create database f4mall

=======
--���̺� ����
>>>>>>> branch 'master' of https://github.com/parkkyoung/f4mall
use f4mall;
CREATE TABLE dept (
       dept_no int
    );

--������ ���̽� ���   
use f4mall;

--������ �����ͺ��̽� ����
show databases

--���̺� ����
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

use f4mall;
create table test_hub(
	hub_no int primary key auto_increment,
	test_idx int,
	sub_test_idx int
)

use f4mall;
select t.test_idx 
from test as t 
join sub_test as s on t.test_idx = s.test_idx;

use f4mall;
select
hub_no, test_idx, sub_test_idx 
from test t inner join test_hub h on
test_idx = h.test_idx inner join sub_test s on h.sub_test_idx = s.sub_test_idx

use f4mall;
select test_test, test_idx, test_no 
from test as t  
join sub_test as s 
on t.test_idx = s.s_test_idx;

use f4mall;
alter table test_hub add constraint fk_sub_idx foreign key(sub_test_idx) 
references sub_test (sub_test_idx)

use f4mall;
alter table test_hub add constraint fk_sub_idx foreign key(test_idx) 
references test (test_idx)

--join test
use f4mall;
select 

--foreing key �����ϴ� ���
use f4mall;
alter table sub_test add constraint fk_idx foreign key(s_test_idx) 
references test (test_idx)

use f4mall;
select * from sub_test;

--�����ͺ��̽� ����
use f4mall;
insert into test (test_no,test_text) values (10,'string');
use f4mall;
insert into test (test_no,test_text) values (20,'����');

use f4mall;
select * from sub_test
use f4mall;
insert into sub_test(test_idx,test_text)
values (10,'text')


--****************
/*
 auto_increment�� ���� ����
 Oracle���� sequence����ϴ� ���� MySql���� ����ϴ� ����� �ٸ��ϴ�
 MySQL������ auto_increment�ϸ��� �ڵ����� 1�� ����ŭ �����մϴ�
 �׸��� insert���� �ٸ��ϴ�
 �ʵ��(column)�� ���̺� ���� �߰�������մϴ�
 **����� insert������ auto_increment �ʵ�� �����ϸ� �˴ϴ�.
 ���� SQL���� �����ϼ��� 
 * */
--****************

--�����ͺ��̽� ������ ����
use f4mall;
select * from test;

SHOW GRANTS FOR CURRENT_USER;



