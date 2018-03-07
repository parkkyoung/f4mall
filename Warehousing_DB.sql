
show databases;

-- �԰� ���̺�
use f4mall;
CREATE TABLE warehousing(

	w_no 	  bigint primary key auto_increment, --�԰��ȣ
	p_no 	  int not null,						 --��ǰ�ڵ�
	w_amt 	  int not null,						 --�԰����
	w_regdate date not null						 --�԰�����
)

--�԰����̺� ����Ȯ��
use f4mall;
select * from warehousing;

-- foreign key(�԰����̺�<->��ǰ�ڵ�)
use f4mall;
alter table warehousing add constraint
	fk_p1_no foreign key(p_no) references product(p_no) on delete cascade; 
	
--���̺� �������� Ȯ��(foreign key Ȯ��)
use f4mall;
select * from information_schema.table_constraints where table_name = 'warehousing';

------------------------------------------------------------------------------------------

	
-- ��� ���̺�
use f4mall;
CREATE TABLE stock(

	s_no      bigint primary key auto_increment, --����ȣ
	p_no      int not null,				         --��ǰ�ڵ�
	s_amt     int not null,						 --������
	s_regdate date not null						 --�������
)

--������̺� ����Ȯ��
use f4mall;
select * from stock;

--foreign key(������̺�<->��ǰ�ڵ�)
use 4fmall;
alter table stock add constraint
	fk_p111_no foreign key(p_no) references product(p_no) on delete cascade;
	
--���̺� �������� Ȯ��(foreign key Ȯ��)
use f4mall;
select * from information_schema.table_constraints where table_name = 'stock';

------------------------------------------------------------------------------------------

-- ��� ���̺�
use f4mall;
CREATE TABLE release1(

	r_no      bigint primary key auto_increment, --����ȣ
	p_no      int not null,						 --��ǰ�ڵ�
	o_no      int not null,                      --�ֹ��ڵ�
	r_amt     int not null,						 --������
	r_regdate date not null						 --�������
)

--������̺� ����Ȯ��
use f4mall;
select * from release1;

--foreign key(������̺�<->��ǰ�ڵ�)
use 4fmall;
alter table release1 add constraint
	fk_p1111_no foreign key(p_no) references product(p_no) on delete cascade;

--foreign key(������̺�<->�ֹ��ڵ�)
use 4fmall;
alter table demand add constraint
	fk_o11_no foreign key(o_no) references demand(o_no) on delete cascade;

	
--���̺� �������� Ȯ��(foreign key Ȯ��)
use f4mall;
select * from information_schema.table_constraints where table_name = 'release1';

