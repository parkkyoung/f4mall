<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/parkkyoung/f4mall.git
use f4mall;
select * from test;
=======

use f4mall;
CREATE TABLE product (
       p_no bigint primary key auto_increment,
       o_no int,
       category_no int,
       p_material varchar(100),
       p_color varchar(100),
       sex_no int,
       p_brand varchar(100),
       p_size varchar(100),
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

--레코드 삭제
use f4mall;
delete from product where p_no=1;

use f4mall;
insert into product (p_name,p_content,p_price,
					p_image_m,p_pdate,p_country,p_entry) 
					values(
					'나이키(회색)','아름다운 커플룩입니다잉~!!',109900,
					'nike5.jpg','2018.02.01','미국',now()
					);
					

insert into product (p_name,p_content,p_price,
					p_image_m,p_pdate,p_country,p_entry) 
					values(
					'나이키(로고)','아름다운 커플룩입니다잉~!!',99900,
					'nike6.jpg','2018.02.01','미국',now()
					);
					
insert into product (p_name,p_content,p_price,
					p_image_m,p_pdate,p_country,p_entry) 
					values(
					'나이키(집업)','아름다운 커플룩입니다잉~!!',59900,
					'nike7.jpg','2018.02.01','미국',now()
					);
					
insert into product (p_name,p_content,p_price,
					p_image_m,p_pdate,p_country,p_entry) 
					values(
					'나이키(테스트)','아름다운 커플룩입니다잉~!!',209900,
					'nike8.jpg','2018.02.01','미국',now()
					);
    
use f4mall;
drop table product

use f4mall;
<<<<<<< HEAD
select * from product

use f4mall;
delete from product where p_no = 6;
=======
select * from product
>>>>>>> branch 'master' of https://github.com/parkkyoung/f4mall.git
