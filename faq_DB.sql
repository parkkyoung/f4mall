use f4mall;
create table faq(
    f_no bigint primary key auto_increment,    /*FAQ��ȣPK*/
    m_id varchar(200) not null,                         /*ȸ�����̵�FK*/
    f_name varchar(200) not null,                       /*FAQ����*/
    f_content text not null,                            /*����*/
    f_ip varchar(200) not null,                         /*�ۼ���IP*/
    f_regdate date                                     /*�ۼ�����*/
)

-- �⺻Ű(primary key)
alter table faq
	add constraint pk_f_no primary key(f_no);
	
use f4mall;
insert into faq(m_id,f_name,f_content,f_ip,f_regdate) values('admin','�ڰ��','��ο����','192.168.0.13',now())

use f4mall;
select * from faq
