
show databases;

use f4mall;
select * from size
use f4mall;
insert into size(size_name) values('290') -- ������ �߰�
--update size set size_name='290' where size_no='8';
--insert into size(size_name) values('ETC');
--alter table e add o_no int -- �ʵ� �߰�
--alter table e change e_count p_no int -- ���̺�� ����

-- ī�װ� ���̺�
use f4mall;
CREATE TABLE category(
	category_no int primary key auto_increment, --ī�װ��ڵ�
	category_name varchar(200)					--ī�װ���
)


use f4mall;
select * from category

-- ���� ���̺�
use f4mall;
CREATE TABLE material(

	material_no int primary key auto_increment, --�����ڵ�
	material_name varchar(200)					--������

)


-- ���� ���̺�
use f4mall;
CREATE TABLE color(

	color_no int primary key auto_increment, --�����ڵ�
	color_name varchar(200)					 --�����

)


-- ���� ���̺�
use f4mall;
CREATE TABLE sex(

	sex_no int primary key auto_increment, --�����ڵ�
	sex_name varchar(200)				   --��ǰ����

)


-- �귣�� ���̺�
use f4mall;
CREATE TABLE brand(

	brand_no int primary key auto_increment, --�귣���ڵ�
	brand_name varchar(200)					 --�귣���

)


-- ������ ���̺�
use f4mall;
CREATE TABLE size(

	size_no int primary key auto_increment, --�������ڵ�
	size_name varchar(200)					--������

)


-- ��ǰ���� ���̺�
use f4mall;
select * from e
CREATE TABLE e(
	e_no int primary key auto_increment, --��ǰ�����ڵ�
	e_score int,					         --��ǰ����
    e_count int
)

