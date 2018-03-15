
show databases;

use f4mall;
select * from size
use f4mall;
insert into size(size_name) values('290') -- 데이터 추가
--update size set size_name='290' where size_no='8';
--insert into size(size_name) values('ETC');
--alter table e add o_no int -- 필드 추가
--alter table e change e_count p_no int -- 테이블명 수정

-- 카테고리 테이블
use f4mall;
CREATE TABLE category(
	category_no int primary key auto_increment, --카테고리코드
	category_name varchar(200)					--카테고리명
)


use f4mall;
select * from category

-- 재질 테이블
use f4mall;
CREATE TABLE material(

	material_no int primary key auto_increment, --재질코드
	material_name varchar(200)					--재질명

)


-- 색상 테이블
use f4mall;
CREATE TABLE color(

	color_no int primary key auto_increment, --색상코드
	color_name varchar(200)					 --색상명

)


-- 성별 테이블
use f4mall;
CREATE TABLE sex(

	sex_no int primary key auto_increment, --성별코드
	sex_name varchar(200)				   --제품성별

)


-- 브랜드 테이블
use f4mall;
CREATE TABLE brand(

	brand_no int primary key auto_increment, --브랜드코드
	brand_name varchar(200)					 --브랜드명

)


-- 사이즈 테이블
use f4mall;
CREATE TABLE size(

	size_no int primary key auto_increment, --사이즈코드
	size_name varchar(200)					--사이즈

)


-- 상품평점 테이블
use f4mall;
select * from e
CREATE TABLE e(
	e_no int primary key auto_increment, --상품평점코드
	e_score int,					         --상품점수
    e_count int
)

