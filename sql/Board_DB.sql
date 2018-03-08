/*	2018년3월7일(seo) 	*/
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
	b_no bigint primary key auto_increment,	/*게시판번호PK*/
	m_id varchar(200) not null,							/*회원아이디FK*/
	b_name varchar(200) not null,						/*게시글제목*/
	b_content text not null,							/*내용*/
	b_ip varchar(200) not null,							/*작성자IP*/
	b_readhit int default 0, 							/*조회수*/
	b_regdate date,										/*작성일자*/
	b_notice int default 0,								/*공지사항*/
	b_ref	int default 0,								/*메인글번호 N번하위*/
	b_step int default 0, 								/*수직순서 N번하위의 순서*/
	b_depth int default 0								/*깊이  N번하위순서에 맞는 것에 하위*/
	)
	/*forignkey m_id 넣어줄 것 그리고 create문안에 -- 넣으면 오류납니다.*/

/*일반글 */
use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u1','1빠1-0다','1빠라구','111.223.0.22',now(),1,0,0)

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u2','2빠1-1다','2빠라구','111.223.0.22',now(),1,1,0)

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u3','3빠2-0다','3빠라구','111.223.0.22',now(),2,0,0)

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u4','4빠3-0다','4빠라구','111.223.0.22',now(),3,0,0)

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u5','5빠2-1다','5빠라구','111.223.0.22',now(),2,1,0)

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u6','6빠1-3다','6빠라구','111.223.0.22',now(),1,3,0)

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_ref,b_step,b_depth) values('u7','7빠1-3-1다','7빠라구','111.223.0.22',now(),1,3,1)


/*공지사항글*/

use f4mall;
insert into board (m_id,b_name,b_content,b_ip,b_regdate,b_notice) values('admin','공지사항입니다.','공지사항입니다.','111.223.0.22',now(),1)



/* 기타 Board 확인 밑 삭제*/

use f4mall;
select * from board;
	
	
use f4mall;	
drop table board

use f4mall;	
select * from board order by b_ref desc, b_step asc;

/*	//2018년3월7일(seo) 	*/