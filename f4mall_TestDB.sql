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
drop table test;

use f4mall;
create table test(
	test_idx int primary key auto_increment,
	test_no int,
	test_text varchar(100)
);

--�����ͺ��̽� ����
use f4mall;
insert into test (test_no,test_text) values (10,'string');
use f4mall;
insert into test (test_no,test_text) values (20,'����');

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

