
use f4mall;
select * from product;
=======

use f4mall;
select * from product
alter table product drop o_no
alter table product drop foreign key fk_o_no -- ����Ű ����
--drop table product

--��ǰ���̺�
use f4mall;
CREATE TABLE product (
       p_no int primary key auto_increment,
       m_id varchar(200),
       p_supply varchar(200),
       p_name varchar(200) not null,
       p_content text not null,
       p_price int not null,
       p_sale int,
       p_image_m varchar(200),
       p_image_s varchar(200),
       p_pdate varchar(100) not null,
       p_country varchar(200) not null,
       p_entry date not null
    );
    

    
--��ǰ�������̺�
use f4mall;
CREATE TABLE e(

	e_no 	int primary key auto_increment, --��ǰ�����ڵ�
	e_score int					         	--��ǰ����

)

use f4mall;
select * from e;

use f4mall;
delete from product;

    
use f4mall;
alter table product add constraint fk_o_no foreign key(o_no) references order_table(o_no)

--���ڵ� ����
use f4mall;
delete from product where p_no=1;

/*
use f4mall;
insert into product (p_name,p_content,p_price,
					p_image_m,p_pdate,p_country,p_entry) 
					values(
					'����Ű(ȸ��)','�Ƹ��ٿ� Ŀ�÷��Դϴ���~!!',109900,
					'nike5.jpg','2018.02.01','�̱�',now()
					);
					

insert into product (p_name,p_content,p_price,
					p_image_m,p_pdate,p_country,p_entry) 
					values(
					'����Ű(�ΰ�)','�Ƹ��ٿ� Ŀ�÷��Դϴ���~!!',99900,
					'nike6.jpg','2018.02.01','�̱�',now()
					);
					
insert into product (p_name,p_content,p_price,
					p_image_m,p_pdate,p_country,p_entry) 
					values(
					'����Ű(����)','�Ƹ��ٿ� Ŀ�÷��Դϴ���~!!',59900,
					'nike7.jpg','2018.02.01','�̱�',now()
					);
use f4mall;
insert into product (p_name,p_content,p_price,
					p_image_m,p_pdate,p_country,p_entry) 
					values(
					'����Ű(�׽�Ʈ)','�Ƹ��ٿ� Ŀ�÷��Դϴ���~!!',209900,
					'nike8.jpg','2018.02.01','�̱�',now()
					);
*/




use f4mall;
drop table order_table

use f4mall;
select * from product where p_no = 1
	
	
--���̺� �������� Ȯ��(foreign key Ȯ��)
use f4mall;
select * from information_schema.table_constraints where table_name = 'product';


