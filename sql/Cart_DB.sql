use f4mall;
create table cart(
	cart_no bigint primary key auto_increment,
	i_no int,
	m_id varchar(200),
	cart_regdate date,
	cart_amt int not null
)

use f4mall;
select * from items

use f4mall;
insert into cart(cart_amt,i_no,m_id,cart_regdate) values(2,16,'kimbongsung@hotmail.com',now())

use f4mall;
alter table cart 
add constraint fk_itemv_no 
foreign key(i_no) 
references items (i_no)
on delete cascade

use f4mall;
alter table cart add constraint fk_mmm_id 
foreign key(m_id) references member (m_id)

use f4mall;
select * from information_schema.table_constraints 
where table_name = 'cart';

use f4mall;
insert into cart (i_no,m_id,cart_regdate,cart_amt) values(
				  1,'kimbongsung@hotmail.com',now(),2
)

use f4mall;
select * from cart_view where m_id = 'kimbongsung@hotmail.com'

use f4mall;
select * from member

use f4mall;
drop view cart_view

use f4mall;
select sum(p_sale) from product

use f4mall;
create view cart_view as
select
p.p_no, p.p_name, c.cart_amt, p.p_price, p.p_sale,
c.cart_regdate, c.cart_no, i.i_no,p_image_m, m.m_id,
col.color_name, size.size_name,
(p_sale * cart_amt) as sale_total,
(p_price * cart_amt) as price_total
from cart as c inner join items as i on c.i_no = i.i_no
inner join member as m on m.m_id = c.m_id
inner join product as p on p.p_no = i.p_no
inner join color as col on col.color_no = i.color_no
inner join size as size on size.size_no = i.size_no

use f4mall;
update cart set cart_amt = 4 
where m_id= 'kimbongsung@hotmail.com' and i_no= 5

use f4mall;
select sum(sale_total) as sales_price from cart_view where m_id='kimbongsung@hotmail.com'

use f4mall;
<<<<<<< HEAD
alter table demand drop foreign key fk_p1_no
=======
alter table cart drop foreign key fk_itemv_no
>>>>>>> branch 'master' of https://github.com/parkkyoung/f4mall.git

use f4mall;
update cart set cart_amt = 3 where m_id= 'kimbongsung@hotmail.com' and p_no='1'

use f4mall;
select * from cart_view
where m_id = 'kimbongsung@hotmail.com' and p_no=3

use f4mall;
select * from member

select * from cart_view where p_no=#{ p_no } and m_id = #{ m_id }

use f4mall;
delete from cart
where m_id = 'kimbongsung@hotmail.com'

use f4mall;
select * from cart
where m_id = 'kimbongsung@hotmail.com'

use f4mall;
drop table cart;

use f4mall;
drop view cart_view

use f4mall;
insert into cart (cart_amt, p_no, m_id, cart_regdate) 
values( 1, 3,'kimbongsung@hotmail.com',now());

use f4mall;
select * from cart_view where p_no=1 and m_id = 'kimbongsung@hotmail.com'

use f4mall;
select
p.p_no, c.cart_amt, m.m_id
from product as p inner join cart as c on p.p_no = c.p_no
inner join member as m on c.m_id = m.m_id;