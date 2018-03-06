

-- 주문테이블

USE f4mall;
CREATE TABLE demand(
	
	o_no      INT PRIMARY KEY AUTO_INCREMENT, /*주문코드*/
	cart_no   BIGINT,						  /*장바구니번호*/
	p_no 	  INT NOT NULL,					  /*상품코드*/
	p_name	  VARCHAR(200) NOT NULL,		  /*상품이름*/
	p_price   INT NOT NULL,					  /*상품가격*/
	p_sale    INT NOT NULL,					  /*할인가*/
	p_image_m VARCHAR(200),					  /*상품이미지_M*/
	m_id	  VARCHAR(200) NOT NULL,		  /*회원아이디*/
	d_no	  INT,							  /*배송번호*/
	o_amt	  INT NOT NULL,					  /*구매수량*/
	o_addr    VARCHAR(200) NOT NULL,		  /*배송지 주소*/
	o_addr_d  VARCHAR(200) NOT NULL,		  /*배송지 상세주소*/
	o_zipcode VARCHAR(200) NOT NULL,		  /*배송지 우편번호*/
	o_tel	  INT NOT NULL,					  /*배송지 연락처*/
	o_regdate DATE NOT NULL,				  /*주문일자*/
	o_payment VARCHAR(200) NOT NULL,		  /*결제방법*/
	o_remarks TEXT							  /*기타사항*/

);

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
select * from cart;

-- foreign key 추가 사항(상품테이블 관련)
-- on delete cascade 옵션 => 참조하는 부모테이블의 column이 삭제되면 자식 테이블의 column도 모두 삭제하라
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



