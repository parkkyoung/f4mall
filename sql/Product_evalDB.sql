use f4mall;
create table product_eval(
	eval_no int primary key auto_increment,
	p_no int,
	m_id varchar(200),
	eval_score int,
	eval_title varchar(200) not null,
	eval_content text,
	eval_ip varchar(200),
	eval_regdate date
);

use f4mall;
drop table product_eval

use f4mall;
select * from stock_in

use f4mall;
select sum(eval_score)/count(*) as average_eval from product_eval where p_no = 44
where m_id = 'admin@f4mall.com' and o_status = 0

use f4mall;
alter table product_eval add constraint fk_pep_no foreign key
(p_no) references product (p_no);


alter table product_eval add constraint fk_pem_id foreign key
(m_id) references member(m_id);


alter table product_eval add constraint fk_peo_no foreign key
(o_no) references demand(o_no);

use f4mall;
create view select_product_eval as
select
p.p_no, d.m_id, d.o_status
from items as i 
inner join product as p on i.p_no = p.p_no
inner join demand as d on d.i_no = i.i_no

use f4mall;
select * from select_product_eval where o_status = 0 and p_no = 44

use f4mall;
drop view select_product_eval

use f4mall;
select * from product_eval where p_no = p_no order by eval_no desc