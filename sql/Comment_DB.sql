/****************** 게시판 댓글 *******************************************************************************************/


/* comment table create*/
use f4mall;
create table b_comment(
	c_no bigint primary key auto_increment,				/*댓글번호PK*/
	b_no bigint not null,								/*게시물번호FK*/
	constraint fk_bc_id foreign key(b_no) references board (b_no) on delete cascade,/*게시물번호 참고*/
	m_id varchar(200) not null,							/*회원아이디FK*/
	constraint fk_mc_id foreign key(m_id) references member (m_id) on delete cascade, /*회원아이디 참고*/
	c_content text not null,							/*내용*/
	c_ip varchar(200) not null,							/*작성자IP*/
	c_regdate date,										/*작성일자*/
	c_ref	int default 0,								/*메인글번호 N번하위*/
	c_step int default 0, 								/*수직순서 N번하위의 순서*/
	c_depth int default 0								/*깊이  N번하위순서에 맞는 것에 하위*/
	)


/*일반글 */
use f4mall;
insert into b_comment (b_no,m_id,c_content,c_ip,c_regdate) values(1,'admin@f4mall.com','1빠라구','111.223.0.22',sysdate());
use f4mall;
insert into b_comment (b_no,m_id,c_content,c_ip,c_regdate) values(1,'admin@f4mall.com','2빠라구','111.223.0.22',sysdate());
use f4mall;
insert into b_comment (b_no,m_id,c_content,c_ip,c_regdate) values(1,'admin@f4mall.com','3빠라구','111.223.0.22',sysdate());


/* 기타 Comment 확인 밑 삭제*/

use f4mall;
alter table b_comment drop foreign key fk_mc_id;

use f4mall;
alter table b_comment add constraint
	fk_mc_id foreign key(m_id) references member(m_id) on delete cascade;


use f4mall;
select * from information_schema.table_constraints where table_name = 'b_comment';



use f4mall;
select * from b_comment;

use f4mall;	
drop table b_comment;

use f4mall;
delete from comment;
