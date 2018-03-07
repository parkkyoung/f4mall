
show databases;

-- 입고 테이블
use f4mall;
CREATE TABLE warehousing(

	w_no 	  bigint primary key auto_increment, --입고번호
	p_no 	  int not null,						 --상품코드
	w_amt 	  int not null,						 --입고수량
	w_regdate date not null						 --입고일자
)

--입고테이블 생성확인
use f4mall;
select * from warehousing;

-- foreign key(입고테이블<->상품코드)
use f4mall;
alter table warehousing add constraint
	fk_p1_no foreign key(p_no) references product(p_no) on delete cascade; 
	
--테이블 제약조건 확인(foreign key 확인)
use f4mall;
select * from information_schema.table_constraints where table_name = 'warehousing';

------------------------------------------------------------------------------------------

	
-- 재고 테이블
use f4mall;
CREATE TABLE stock(

	s_no      bigint primary key auto_increment, --재고번호
	p_no      int not null,				         --상품코드
	s_amt     int not null,						 --재고수량
	s_regdate date not null						 --재고일자
)

--재고테이블 생성확인
use f4mall;
select * from stock;

--foreign key(재고테이블<->상품코드)
use 4fmall;
alter table stock add constraint
	fk_p111_no foreign key(p_no) references product(p_no) on delete cascade;
	
--테이블 제약조건 확인(foreign key 확인)
use f4mall;
select * from information_schema.table_constraints where table_name = 'stock';

------------------------------------------------------------------------------------------

-- 출고 테이블
use f4mall;
CREATE TABLE release1(

	r_no      bigint primary key auto_increment, --재고번호
	p_no      int not null,						 --상품코드
	o_no      int not null,                      --주문코드
	r_amt     int not null,						 --출고수량
	r_regdate date not null						 --출고일자
)

--출고테이블 생성확인
use f4mall;
select * from release1;

--foreign key(출고테이블<->상품코드)
use 4fmall;
alter table release1 add constraint
	fk_p1111_no foreign key(p_no) references product(p_no) on delete cascade;

--foreign key(출고테이블<->주문코드)
use 4fmall;
alter table demand add constraint
	fk_o11_no foreign key(o_no) references demand(o_no) on delete cascade;

	
--테이블 제약조건 확인(foreign key 확인)
use f4mall;
select * from information_schema.table_constraints where table_name = 'release1';

