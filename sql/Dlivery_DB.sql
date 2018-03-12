

-- 주문테이블

use f4mall;
create table delivery(

	d_no 		bigint primary key auto_increment, /*배송번호*/
	o_no 		bigint not null,				   /*주문코드*/
	m_id 		varchar(200) not null,			   /*회원아이디*/
	d_br 		varchar(200),					   /*사업자번호*/
	d_pay 		int not null,					   /*배송금액*/
	d_departure date not null,					   /*배송출발일*/
	d_arrival   date not null					   /*예상도착일*/

)


use f4mall;
select * from delivery

use f4mall;
delete from delivery;


use f4mall;
desc demand
USE f4mall;
SELECT * FROM information_schema.table_constraints WHERE table_name = 'delivery';

--foreign key
--주문코드
use f4mall;
alter table delivery add constraint
	fk_o1_no foreign key(o_no) references demand(o_no) on delete cascade;
	

--회원아이디
use f4mall;
alter table delivery add constraint
	fk_md_id foreign key(m_id) references member(m_id) on delete cascade;
	
	
	