use f4mall;
create table cart(
	cart_no bigint primary key auto_increment,
	p_no int,
	m_id varchar(200),
	cart_regdate date,
	cart_amt int not null
)

use f4mall;
alter table cart 
add constraint fk_p_no 
foreign key(p_no) 
references product (p_no)

use f4mall;
alter table cart add constraint fk_mmm_id foreign key(m_id) references member (m_id)

use f4mall;
alter table board drop foreign key fk_mmm_id;

use f4mall;
delete from cart;


use f4mall;
select * from information_schema.table_constraints where table_name = 'cart';

use f4mall;
create view cart_view as
select
p.p_no p_no,p.p_image_s, p.p_name, p.p_price, p.p_sale,
m.m_id, m.m_name, m.m_addr, m.m_addr_d, m.m_zipcode, m_tel,
c.cart_no, c.cart_regdate, c.cart_amt, 
cart_amt * p_sale as sale_total, cart_amt * p_price as price_total,
sum(sale_total) as sales_price
from product as p inner join cart as c on p.p_no = c.p_no
inner join member as m on c.m_id = m.m_id

use f4mall;
select sum(sale_total) as sales_price from cart_view where m_id='kimbongsung@hotmail.com'

use f4mall;
alter table cart drop foreign key fk_memid

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