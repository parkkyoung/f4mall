

-- �ֹ����̺�

USE f4mall;
CREATE TABLE demand(
	
	o_no      INT PRIMARY KEY AUTO_INCREMENT, /*�ֹ��ڵ�*/
	cart_no   BIGINT,						  /*��ٱ��Ϲ�ȣ*/
	p_no 	  INT NOT NULL,					  /*��ǰ�ڵ�*/
	p_name	  VARCHAR(200) NOT NULL,		  /*��ǰ�̸�*/
	p_price   INT NOT NULL,					  /*��ǰ����*/
	p_sale    INT NOT NULL,					  /*���ΰ�*/
	p_image_m VARCHAR(200),					  /*��ǰ�̹���_M*/
	m_id	  VARCHAR(200) NOT NULL,		  /*ȸ�����̵�*/
	d_no	  INT,							  /*��۹�ȣ*/
	o_amt	  INT NOT NULL,					  /*���ż���*/
	o_addr    VARCHAR(200) NOT NULL,		  /*����� �ּ�*/
	o_addr_d  VARCHAR(200) NOT NULL,		  /*����� ���ּ�*/
	o_zipcode VARCHAR(200) NOT NULL,		  /*����� �����ȣ*/
	o_tel	  INT NOT NULL,					  /*����� ����ó*/
	o_regdate DATE NOT NULL,				  /*�ֹ�����*/
	o_payment VARCHAR(200) NOT NULL,		  /*�������*/
	o_remarks TEXT							  /*��Ÿ����*/

);

USE f4mall;
SELECT * FROM demand;

USE f4mall;
DROP TABLE demand;

--���̺� �������� Ȯ��(FOREIGN KEY Ȯ��)
USE f4mall;
SELECT * FROM information_schema.table_constraints WHERE table_name = 'demand';


USE f4mall;
DESC demand;

USE f4mall;
DESC cart;

use f4mall;
select * from cart;

-- foreign key �߰� ����(��ǰ���̺� ����)
-- on delete cascade �ɼ� => �����ϴ� �θ����̺��� column�� �����Ǹ� �ڽ� ���̺��� column�� ��� �����϶�
--��ٱ��Ϲ�ȣ
use f4mall;
alter table demand add constraint
	fk_cart1_no FOREIGN KEY(cart_no) REFERENCES cart(cart_no) on delete cascade;
		
--��ǰ�ڵ�
use f4mall;
alter table demand add constraint
	fk_p1_no FOREIGN KEY(p_no) REFERENCES product(p_no) on delete cascade;

--ȸ�����̵�
use f4mall;
alter table demand add constraint
	fk_m1_id FOREIGN KEY (m_id) REFERENCES member(m_id) on delete cascade;



