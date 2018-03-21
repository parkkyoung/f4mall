
-- 최근 한달 회원가입 멤버 수
use f4mall;
select count(*) from member
    where date(m_regdate)  between date(subdate(now(), INTERVAL 30 DAY)) 
        and  date(now())
        
-- 최근 한달 주문 수
use f4mall;
select count(*) from demand
    where date(o_regdate)  between date(subdate(now(), INTERVAL 30 DAY)) 
        and  date(now())

-- 최근 한달 상품평 수
select count(*) from eval
    where date(eval_regdate)  between date(subdate(now(), INTERVAL 30 DAY)) 
        and  date(now())

-- 카테고리별 주문 수
use f4mall;
select
    count(case when i.category_no=1 then 1 end) as 'count01',
    count(case when i.category_no=2 then 1 end) as 'count02',
    count(case when i.category_no=3 then 1 end) as 'count03',
    count(case when i.category_no=4 then 1 end) as 'count04',
    count(case when i.category_no=5 then 1 end) as 'count05',
    count(case when i.category_no=6 then 1 end) as 'count06'
        from demand d
            join items i on d.i_no = i.i_no
            
                where date(d.o_regdate)  between date(subdate(now(), INTERVAL 30 DAY)) 
                    and  date(now())

-- 성별 주문 수
use f4mall;
select
    count(case when i.sex_no=1 then 1 end) as 'count01',
    count(case when i.sex_no=2 then 1 end) as 'count02',
    count(case when i.sex_no=3 then 1 end) as 'count03'
        from demand d
            join items i on d.i_no = i.i_no
            
                where date(d.o_regdate)  between date(subdate(now(), INTERVAL 30 DAY)) 
                    and  date(now())

-- 브랜드별 주문 수
use f4mall;
select
    count(case when i.brand_no=1 then 1 end) as 'count01',
    count(case when i.brand_no=2 then 1 end) as 'count02',
    count(case when i.brand_no=3 then 1 end) as 'count03',
    count(case when i.brand_no=4 then 1 end) as 'count04',
    count(case when i.brand_no=5 then 1 end) as 'count05',
    count(case when i.brand_no=6 then 1 end) as 'count06',
    count(case when i.brand_no=7 then 1 end) as 'count07',
    count(case when i.brand_no=8 then 1 end) as 'count08',
    count(case when i.brand_no=9 then 1 end) as 'count09'
        from demand d
            join items i on d.i_no = i.i_no
            
                where date(d.o_regdate)  between date(subdate(now(), INTERVAL 30 DAY)) 
                    and  date(now())

-- 지역별 주문
use f4mall;
select
	count(case when o_zipcode between '00%' and '10%' then 1 end) as 'count_seoul',
	count(case when o_zipcode between '10%' and '24%' then 1 end) as 'count_gyeonggi',
	count(case when o_zipcode between '24%' and '27%' then 1 end) as 'count_gangwon',
	count(case when o_zipcode between '27%' and '36%' then 1 end) as 'count_chungcheong',
	count(case when o_zipcode between '36%' and '54%' then 1 end) as 'count_gyeongsang',
	count(case when o_zipcode between '54%' and '63%' then 1 end) as 'count_jeolla',
	count(case when o_zipcode like '63%' then 1 end) as 'count_jeju'
        from demand
        
                where date(o_regdate)  between date(subdate(now(), INTERVAL 30 DAY)) 
                    and  date(now())

        
-- 최근 한달 상품 등록 수
use f4mall;
select count(*) from product
    where date(p_entry)  between date(subdate(now(), INTERVAL 30 DAY)) 
        and  date(now())



use f4mall;
select * from product


use f4mall;
select * from items

use f4mall;
select * from demand
        
        
if( i.category_no='3', count(*), 'b')
    
where i.category_no='3'


where i.category_no=(select category_no from category)

use f4mall;
select * from demand

use f4mall;
insert into demand (i_no, m_id, o_amt, o_addr, o_addr_d, o_zipcode,
        o_tel, o_regdate, o_payment, o_remarks,
        o_pay_amt, o_name, o_status)
values('90', 'admin@f4mall.com', '1', '주소1', '주소2',
       '우편번호', '01033587277', now(), '무통장입금',
       '기타사항', '99999', '경민이', '0'
        )
        
select * from demand
select count(*) from demand
