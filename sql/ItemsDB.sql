use f4mall;
select * from items

use f4mall;
select * from product
use f4mall;
    select distinct p.p_no, p.p_name from
        items i inner join product p on i.p_no = p.p_no
            where category_no=
                (select category_no from category where category_name='running')

           
use f4mall;
select * from product
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

-- 아이템 리스트(상품이름 조인)
use f4mall;
create view items_list as
select
    i.i_no,
    p.p_no,
    p.p_name,
    ca.category_name,
    m.material_name,
    co.color_name,
    se.sex_name,
    b.brand_name,
    si.size_name,
    i.s_no
from items as i
inner join product as p on i.p_no = p.p_no
inner join category as ca on i.category_no = ca.category_no
inner join material as m on i.material_no = m.material_no
inner join color as co on i.color_no = co.color_no
inner join sex as se on i.sex_no = se.sex_no
inner join brand as b on i.brand_no = b.brand_no
inner join size as si on i.size_no = si.size_no

use f4mall;
select * from items_list

use f4mall;
drop view items_list


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
i.i_no,c.color_name,s.size_name,si.s_amt
from items as i inner join product as p on i.p_no = p.p_no
inner join color as c on i.color_no = c.color_no
inner join size as s on i.size_no = s.size_no
inner join stock_inv as si on i.i_no = si.i_no

use f4mall;
drop view items_view

use f4mall;
select * from items_view where p_no =1;


use f4mall;
select * from items_view

use f4mall;
alter table items drop foreign key fk_pro_no

use f4mall;
alter table items add constraint fk_pro_no foreign key(p_no) 
references product(p_no)
on delete cascade

use f4mall;
alter table items
drop constraint fk_pro_no
on delete cascade

add constraint fk_itemv_no 
foreign key(i_no) 
references items (i_no)

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