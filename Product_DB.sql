
use f4mall;
select * from test;
=======


--��ǰ���̺�
use f4mall;
CREATE TABLE product (
       p_no int primary key auto_increment,
       o_no int,
       category_no int,
       material_no int,	
       color_no int,
       sex_no int,
       brand_no int,
       size_no int,
       e_no int,
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


-- foreign key �߰� ����(��ǰ���̺� ����)
-- on delete cascade �ɼ� => �����ϴ� �θ����̺��� column�� �����Ǹ� �ڽ� ���̺��� column�� ��� �����϶�
--ī�װ� �ڵ�
use f4mall;
alter table product add constraint
	fk_category_no FOREIGN KEY (category_no) REFERENCES category(category_no) on delete cascade;

--���� �ڵ�
use f4mall; 
alter table product add constraint
	fk_material_no FOREIGN KEY (material_no) REFERENCES material(material_no) on delete cascade;
	
--���� �ڵ�
use f4mall;
alter table product add constraint
	fk_color_no FOREIGN KEY (color_no) REFERENCES color(color_no) on delete cascade;

--���� �ڵ�
use f4mall;
alter table product add constraint
	fk_sex_no FOREIGN KEY (sex_no) REFERENCES sex(sex_no) on delete cascade;

--�귣�� �ڵ�
use f4mall;
alter table product add constraint
	fk_brand_no FOREIGN KEY (brand_no) REFERENCES brand(brand_no) on delete cascade;

--������ �ڵ�
use f4mall;
alter table product add constraint
	fk_size_no FOREIGN KEY (size_no) REFERENCES size(size_no) on delete cascade;

--ȸ�����̵�
use f4mall;
alter table product add constraint
	fk_m_id foreign key (m_id) references member(m_id);

--��ǰ����
use f4mall;
alter table product add constraint
	fk_e_no foreign key (e_no) references e(e_no);

--�ֹ��ڵ�
use f4mall;
alter table product add constraint
	fk_o_no foreign key(o_no) references demand(o_no) on delete cascade;
	
	
--���̺� �������� Ȯ��(foreign key Ȯ��)
use f4mall;
select * from information_schema.table_constraints where table_name = 'product';


