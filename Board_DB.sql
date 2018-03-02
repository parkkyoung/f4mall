

show databases;

SHOW GRANTS FOR CURRENT_USER;

use table test2();

use f4mall;
select * from product;

use f4mall;
create table abcde(

	xman int primary key auto_increment,
	xxman varchar(200) not null

)

use f4mall;
create table abc(
	test_test int,
	test_string varchar(100)
)


use f4mall;
create table abck(
	test_test int,/*eee*/
	test_string varchar(100)
)


use f4mall;
create table board(
	b_no bigint not null primary key auto_increment,	/*게시판번호PK*/
	m_id varchar(200) not null,							/*회원아이디FK*/
	b_name varchar(200) not null,						/*게시글제목*/
	b_content text not null,							/*내용*/
	b_ip varchar(200) not null,							/*작성자IP*/
	b_readhit int, 										/*조회수*/
	b_regdate date,										/*작성일자*/
	b_notice int,										/*공지사항*/
	b_ref	int,										/*메인글번호*/
	b_step int, 										/*수직순서*/
	b_depth int											/*깊이*/
	)
	/*forignkey m_id 넣어줄 것 그리고 create문안에 -- 넣으면 오류납니다.*/
	
	
	