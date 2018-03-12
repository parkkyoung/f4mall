use f4mall;
select * from items

use f4mall;
create table items(
	i_no int primary key auto_increment,
	p_no int,
	category_no int,
	material_no int,
	color_no int,
	sex_no int,
	brand_no int,
	size_no int,
	s_no int
)

use f4mall;
insert into items (p_no,category_no,material_no,color_no,sex_no,
				   brand_no,size_no,s_no)
			values(
				   1,1,1,1,1,1,1,1,1)

use f4mall;
select * from items_view where p_no = 16

use f4mall;
select * from stock

use f4mall;
drop view items_view

use f4mall;
select * from product

use f4mall;
create view items_view as
select
p.p_no,p.p_name,p.p_pdate,p.p_country,p.p_price,p.p_sale,
i.i_no,c.color_name,s.size_name
from items as i inner join product as p on i.p_no = p.p_no
inner join color as c on i.color_no = c.color_no
inner join size as s on i.size_no = s.size_no

use f4mall;
select * from items_view where p_no =1;

use f4mall;
alter table items add constraint fk_pro_no foreign key(p_no) 
references product(p_no)

use f4mall;
alter table items add constraint fk_categ_no foreign key(category_no) 
references category(category_no)

use f4mall;
alter table items add constraint fk_mat_no foreign key(material_no) 
references material(material_no)

use f4mall;
alter table items add constraint fk_color_no foreign key(color_no) 
references color(color_no)

use f4mall;
alter table items add constraint fk_sex_no foreign key(sex_no) 
references sex(sex_no)

use f4mall;
alter table items add constraint fk_brand_no foreign key(brand_no) 
references brand(brand_no)

use f4mall;
alter table items add constraint fk_size_no foreign key(size_no) 
references size(size_no)

use f4mall;
drop table item