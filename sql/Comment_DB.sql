/****************** �Խ��� ��� *******************************************************************************************/


/* comment table create*/
use f4mall;
create table b_comment(
	c_no bigint primary key auto_increment,				/*��۹�ȣPK*/
	b_no bigint not null,								/*�Խù���ȣFK*/
	constraint fk_bc_id foreign key(b_no) references board (b_no) on delete cascade,/*�Խù���ȣ ����*/
	m_id varchar(200) not null,							/*ȸ�����̵�FK*/
	constraint fk_mc_id foreign key(m_id) references member (m_id) on delete cascade, /*ȸ�����̵� ����*/
	c_content text not null,							/*����*/
	c_ip varchar(200) not null,							/*�ۼ���IP*/
	c_regdate date										/*�ۼ�����*/
	)


/*�Ϲݱ� */
use f4mall;
insert into b_comment (b_no,m_id,c_content,c_ip,c_regdate) values(1,'admin@f4mall.com','1����','111.223.0.22',sysdate());
use f4mall;
insert into b_comment (b_no,m_id,c_content,c_ip,c_regdate) values(1,'admin@f4mall.com','2����','111.223.0.22',sysdate());
use f4mall;
insert into b_comment (b_no,m_id,c_content,c_ip,c_regdate) values(1,'admin@f4mall.com','3����','111.223.0.22',sysdate());


/* ��Ÿ Comment Ȯ�� �� ����*/


use f4mall;
select * from b_comment;

use f4mall;	
drop table b_comment;

