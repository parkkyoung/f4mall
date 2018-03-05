

--�ֹ����̺�

use f4mall;
create table demand(
	
	o_no      int primary key auto_increment, /*�ֹ��ڵ�*/
	cart_no   bigint,						  /*��ٱ��Ϲ�ȣ*/
	p_no 	  int not null,					  /*��ǰ�ڵ�*/
	p_name	  varchar(200) not null,		  /*��ǰ�̸�*/
	p_price   int not null,					  /*��ǰ����*/
	p_sale    int not null,					  /*���ΰ�*/
	p_image_m varchar(200),					  /*��ǰ�̹���_M*/
	m_id	  varchar(200) not null,		  /*ȸ�����̵�*/
	d_no	  int,							  /*��۹�ȣ*/
	o_amt	  int not null,					  /*���ż���*/
	o_addr    varchar(200) not null,		  /*����� �ּ�*/
	o_addr_d  varchar(200) not null,		  /*����� ���ּ�*/
	o_zipcode varchar(200) not null,		  /*����� �����ȣ*/
	o_tel	  int not null,					  /*����� ����ó*/
	o_regdate date not null,				  /*�ֹ�����*/
	o_payment varchar(200) not null,		  /*�������*/
	o_remarks text							  /*��Ÿ����*/

);

use f4mall;
select * from demand;

use f4mall;
drop table demand;

--���̺� �������� Ȯ��(foreign key Ȯ��)
use f4mall;
select * from information_schema.table_constraints where table_name = 'cart';


-- foreign key �߰� ����(��ǰ���̺� ����)
-- on delete cascade �ɼ� => �����ϴ� �θ����̺��� column�� �����Ǹ� �ڽ� ���̺��� column�� ��� �����϶�
--��ٱ��Ϲ�ȣ
use f4mall;
alter table demand add constraint
	fk_cart111_no FOREIGN KEY (cart_no) REFERENCES cart (cart_no) on delete cascade;
		
--��ǰ�ڵ�
use f4mall;
alter table demand add constraint
	fk_p1_no FOREIGN KEY (p_no) REFERENCES product (p_no) on delete cascade;

--ȸ�����̵�
use f4mall;
alter table demand add constraint
	fk_m1_id FOREIGN KEY (m_id) REFERENCES member (m_id) on delete cascade;

--��ǰ��
use f4mall;
alter table demand add constraint
	fk_p1_name FOREIGN KEY (p_name) REFERENCES product (p_name) on delete cascade;

--��ǰ����
use f4mall;
alter table demand add constraint
	fk_p1_price FOREIGN KEY (p_price) REFERENCES product (p_price) on delete cascade;

--���ΰ�
use f4mall;
alter table demand add constraint
	fk_p1_sale FOREIGN KEY (p_sale) REFERENCES product (p_sale) on delete cascade;

--�̹���_M
use f4mall;
alter table demand add constraint
	fk_p1_image_m FOREIGN KEY (p_image_m) REFERENCES product (p_image_m) on delete cascade;

	
	
--��۹�ȣ
use f4mall;
alter table demand add constraint
	fk_d1_no FOREIGN KEY (d_no) REFERENCES delivery (d_no) on delete cascade;


