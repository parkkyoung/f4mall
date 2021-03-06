use f4mall;
select * from demand where m_id = 'admin@f4mall.com' and o_status = 0

-- 주문테이블

USE f4mall;
CREATE TABLE demand(
	o_no      INT primary key auto_increment, /*주문코드 -> 카트번호*/
	i_no	  int,
	m_id	  VARCHAR(200) NOT NULL,		  /*회원아이디*/
	o_amt	  INT NOT NULL,					  /*구매수량 -> cart_amt*/
	o_addr    VARCHAR(200) NOT NULL,		  /*배송지 주소*/
	o_addr_d  VARCHAR(200) NOT NULL,		  /*배송지 상세주소*/
	o_zipcode VARCHAR(200) NOT NULL,		  /*배송지 우편번호*/
	o_tel	  INT NOT NULL,					  /*배송지 연락처*/
	o_regdate DATE NOT NULL,				  /*주문일자*/
	o_payment VARCHAR(200) NOT NULL,		  /*결제방법*/
	o_remarks TEXT,							  /*기타사항*/
	o_pay_amt int,
	o_name varchar(100)
);

-- 회원 주문 목록
use f4mall;
select * from demand
    d.o_no, p.p_no, d.o_regdate, d.o_amt, d.o_pay_amt, p.p_image_m, p.p_name, d.o_status
        from demand d inner join items i on d.i_no = i.i_no
        inner join product p on i.p_no = p.p_no
            where m_id = 'admin@f4mall.com' 
                order by o_no desc

-- 회원 상세
use f4mall;
select
   d.o_status, d.o_pay_amt, d.o_zipcode, d.o_addr, d.o_addr_d, d.o_tel, d.o_pay_amt, d.o_pay_amt,
   p.p_no, p.p_image_m, p.p_name
       from demand d inner join items i on d.i_no = i.i_no
       inner join product p on i.p_no = p.p_no
           where o_no=26
                   
use f4mall;
select * from demand where o_no=26


use f4mall;
alter table demand add constraint fk_oi_no foreign key (i_no) references items(i_no) 

use f4mall;
alter table demand add constraint fk_om_id foreign key (m_id) references member(m_id)

use f4mall;
insert into demand (i_no, m_id, o_amt, o_addr, o_add_d, 
					o_zipcode, o_tel, o_regdate, 
					o_payment, o_remarks, o_pay_amt, 
					o_name) 
			values(1,'kimbongsung@hotmail.com',3,'서울시 송파구 잠실동','롯데타워 58층','111-111',01012341234,now(),'무통장결제',
			'부재시 경비실에 맡겨주세요', 329000,'김봉성')
					

use f4mall;
create view order_view as
select
cart_no, p_no, m_id,
p_image_m, p_name, p_price, p_sale,
o_amt,o_addr,o_addr_d,o_zipcode,o_tel,o_regdate,o_payment,
o_remarks,m_addr,m_addr_d,m_zipcode,m_tel
from product as p inner join demand as d on 

USE f4mall;
SELECT * FROM demand;

USE f4mall;
DROP TABLE demand;

--테이블 제약조건 확인(FOREIGN KEY 확인)
USE f4mall;
SELECT * FROM information_schema.table_constraints WHERE table_name = 'demand';

USE f4mall;
DESC demand;

USE f4mall;
DESC cart;

use f4mall;
delete from demand;


use f4mall;
select * from demand;

-- foreign key 추가 사항(상품테이블 관련)
-- on delete cascade 옵션 => 참조하는 부모테이블의 column이 삭제되면 자식 테이블의 column도 모두 삭제하라

use f4mall;
alter table demand drop foreign key fk_oi_no

--장바구니번호
use f4mall;
alter table demand add constraint
	fk_cart1_no FOREIGN KEY(cart_no) REFERENCES cart(cart_no) on delete cascade;

--상품코드
use f4mall;
alter table demand add constraint
	fk_p1_no FOREIGN KEY(p_no) REFERENCES product(p_no) on delete cascade;

--회원아이디
use f4mall;
alter table demand add constraint
	fk_m1_id FOREIGN KEY (m_id) REFERENCES member(m_id) on delete cascade;

use f4mall;
alter table demand
add CONSTRAINT `fk_oi_no` 
FOREIGN KEY (`i_no`) REFERENCES `items` (`i_no`)
on delete cascade



