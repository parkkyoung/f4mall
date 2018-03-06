use f4mall;
create table cart(
	cart_no bigint primary key auto_increment,
	p_no int,
	m_id varchar(200),
	cart_regdate date
)

use f4mall;
alter table cart add constraint fk_p_no foreign key(p_no) references product (p_no) on delete cascade
use f4mall;
alter table cart add constraint fk_mem_id foreign key(m_id) references member (m_id) on delete cascade

use f4mall;
create view cart_view as
select
p.p_no,p.p_image_m, p.p_name, p.p_price, p.p_sale,
m.m_id, m.m_name, m.m_addr, m.m_addr_d 
from product as p inner join cart as c on p.p_no = c.p_no
inner join member as m on c.m_id = m.m_id;

use f4mall;
select * from cart_view

use f4mall;
select * from cart

use f4mall;
insert into cart (p_no, m_id, cart_regdate) 
values(
				3,'kimbongsung@hotmail.com',now()
			);

use f4mall;
drop table cart

use f4mall;
drop view cart_view

use f4mall;
alter table cart drop foreign key fk_mem_id;

select * from information_schema.table_constraints 
where table_name = 'cart';

use f4mall;
select
p.p_no, c.cart_amt, m.m_id
from product as p inner join cart as c on p.p_no = c.p_no
inner join member as m on c.m_id = m.m_id;
