

-- �ֹ����̺�

USE f4mall;
CREATE TABLE demand(
	o_serial  INT PRIMARY KEY AUTO_INCREMENT  /*�ֹ��Ϸù�ȣ*/
	o_no      INT, 							  /*�ֹ��ڵ� -> īƮ��ȣ*/
	p_no 	  INT NOT NULL,					  /*��ǰ�ڵ�*/
	m_id	  VARCHAR(200) NOT NULL,		  /*ȸ�����̵�*/
	o_amt	  INT NOT NULL,					  /*���ż��� -> cart_amt*/
	o_addr    VARCHAR(200) NOT NULL,		  /*����� �ּ�*/
	o_addr_d  VARCHAR(200) NOT NULL,		  /*����� ���ּ�*/
	o_zipcode VARCHAR(200) NOT NULL,		  /*����� �����ȣ*/
	o_tel	  INT NOT NULL,					  /*����� ����ó*/
	o_regdate DATE NOT NULL,				  /*�ֹ�����*/
	o_payment VARCHAR(200) NOT NULL,		  /*�������*/
	o_remarks TEXT							  /*��Ÿ����*/
	o_price   int 							  /*����ݾ�*/
);

use f4mall;
create view order_view as
select
cart_no, p_no, m_id,
p_image_m, p_name, p_price, p_sale,
o_amt,o_addr,o_addr_d,o_zipcode,o_tel,o_regdate,o_payment,
o_remarks,m_addr,m_addr_d,m_zipcode,m_tel
from product as p inner join demand as d on 

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
delete from demand;


use f4mall;
select * from demand;

-- foreign key �߰� ����(��ǰ���̺� ����)
-- on delete cascade �ɼ� => �����ϴ� �θ����̺��� column�� �����Ǹ� �ڽ� ���̺��� column�� ��� �����϶�

use f4mall;
alter table demand drop foreign key fk_m1_id

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






