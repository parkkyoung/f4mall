
use f4mall;
create table stock_in (
	stock_no int primary key auto_increment,
	s_amt int,
	s_regdate date,
	i_no int
)

use f4mall;
create table stock_out (
	stock_no int primary key auto_increment,
	s_amt int,
	s_regdate date,
	i_no int
)

use f4mall;
create table stock_inv (
	stock_no int primary key auto_increment,
	s_amt int,
	s_regdate date,
	i_no int
)

use f4mall;
select * from stock_inv where i_no = 1

use f4mall;
create view stock_view_in as
select
p.p_name, si.*, col.color_name, size.size_name
from stock_in as si inner join items as i on si.i_no = i.i_no
inner join product as p on p.p_no = i.p_no
inner join color as col on col.color_no = i.color_no
inner join size as size on size.size_no = i.size_no

use f4mall;
create view stock_view_inv as
select
p.p_name, sv.*, col.color_name, size.size_name
from stock_inv as sv inner join items as i on sv.i_no = i.i_no
inner join product as p on p.p_no = i.p_no
inner join color as col on col.color_no = i.color_no
inner join size as size on size.size_no = i.size_no

use f4mall;
create view stock_view_out as
select
p.p_name, so.*, col.color_name, size.size_name
from stock_out as so inner join items as i on so.i_no = i.i_no
inner join product as p on p.p_no = i.p_no
inner join color as col on col.color_no = i.color_no
inner join size as size on size.size_no = i.size_no

use f4mall;
select * from stock_view_inv;

use f4mall;
alter table stock_inv add constraint fk_svi_no foreign key (i_no)
references items (i_no)
on delete cascade

use f4mall;
insert into stock_out (s_amt,s_regdate,i_no) values (10,now(),1)

use f4mall;
drop view stock_view

use f4mall;
update stock_out set s_amt = 5