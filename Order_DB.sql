

--주문테이블

use f4mall;
create table demand(
	
	o_no      int primary key auto_increment, /*주문코드*/
	cart_no   bigint,						  /*장바구니번호*/
	p_no 	  int not null,					  /*상품코드*/
	p_name	  varchar(200) not null,		  /*상품이름*/
	p_price   int not null,					  /*상품가격*/
	p_sale    int not null,					  /*할인가*/
	p_image_m varchar(200),					  /*상품이미지_M*/
	m_id	  varchar(200) not null,		  /*회원아이디*/
	d_no	  int,							  /*배송번호*/
	o_amt	  int not null,					  /*구매수량*/
	o_addr    varchar(200) not null,		  /*배송지 주소*/
	o_addr_d  varchar(200) not null,		  /*배송지 상세주소*/
	o_zipcode varchar(200) not null,		  /*배송지 우편번호*/
	o_tel	  int not null,					  /*배송지 연락처*/
	o_regdate date not null,				  /*주문일자*/
	o_payment varchar(200) not null,		  /*결제방법*/
	o_remarks text							  /*기타사항*/

);

use f4mall;
select * from demand;

use f4mall;
drop table demand;

--테이블 제약조건 확인(foreign key 확인)
use f4mall;
select * from information_schema.table_constraints where table_name = 'cart';


-- foreign key 추가 사항(상품테이블 관련)
-- on delete cascade 옵션 => 참조하는 부모테이블의 column이 삭제되면 자식 테이블의 column도 모두 삭제하라
--장바구니번호
use f4mall;
alter table demand add constraint
	fk_cart111_no FOREIGN KEY (cart_no) REFERENCES cart (cart_no) on delete cascade;
		
--상품코드
use f4mall;
alter table demand add constraint
	fk_p1_no FOREIGN KEY (p_no) REFERENCES product (p_no) on delete cascade;

--회원아이디
use f4mall;
alter table demand add constraint
	fk_m1_id FOREIGN KEY (m_id) REFERENCES member (m_id) on delete cascade;

--상품명
use f4mall;
alter table demand add constraint
	fk_p1_name FOREIGN KEY (p_name) REFERENCES product (p_name) on delete cascade;

--상품가격
use f4mall;
alter table demand add constraint
	fk_p1_price FOREIGN KEY (p_price) REFERENCES product (p_price) on delete cascade;

--할인가
use f4mall;
alter table demand add constraint
	fk_p1_sale FOREIGN KEY (p_sale) REFERENCES product (p_sale) on delete cascade;

--이미지_M
use f4mall;
alter table demand add constraint
	fk_p1_image_m FOREIGN KEY (p_image_m) REFERENCES product (p_image_m) on delete cascade;

	
	
--배송번호
use f4mall;
alter table demand add constraint
	fk_d1_no FOREIGN KEY (d_no) REFERENCES delivery (d_no) on delete cascade;


