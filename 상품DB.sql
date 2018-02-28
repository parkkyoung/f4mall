<<<<<<< HEAD
use f4mall;
select * from test;
=======

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

use f4mall;
alter table product add constraint fk_o_no foreign key(o_no) references order_table (o_no)

use f4mall;
create table order_table(
	o_no int primary key auto_increment
)
    
use f4mall;
drop table order_table

use f4mall;
select * from product
>>>>>>> branch 'master' of https://github.com/parkkyoung/f4mall
