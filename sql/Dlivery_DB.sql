

-- �ֹ����̺�

use f4mall;
create table delivery(

	d_no 		bigint primary key auto_increment, /*��۹�ȣ*/
	o_no 		bigint not null,				   /*�ֹ��ڵ�*/
	m_id 		varchar(200) not null,			   /*ȸ�����̵�*/
	d_br 		varchar(200),					   /*����ڹ�ȣ*/
	d_pay 		int not null,					   /*��۱ݾ�*/
	d_departure date not null,					   /*��������*/
	d_arrival   date not null					   /*��������*/

)


use f4mall;
select * from delivery

use f4mall;
delete from delivery;


use f4mall;
desc demand
USE f4mall;
SELECT * FROM information_schema.table_constraints WHERE table_name = 'delivery';

--foreign key
--�ֹ��ڵ�
use f4mall;
alter table delivery add constraint
	fk_o1_no foreign key(o_no) references demand(o_no) on delete cascade;
	

--ȸ�����̵�
use f4mall;
alter table delivery add constraint
	fk_md_id foreign key(m_id) references member(m_id) on delete cascade;
	
	
	