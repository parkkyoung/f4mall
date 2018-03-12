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

--�ܷ�Ű(foreign key)
use f4mall;
alter table faq add constraint
	fk_f1m_id foreign key(m_id) references member(m_id) on delete cascade; 

--�ܷ�ŰȮ��
use f4mall;
select * from information_schema.table_constraints where table_name = 'faq';

--���õ�����
use f4mall;
insert into faq(m_id,f_name,f_content,f_ip,f_regdate) values('admin','�ڰ��','��ο����','192.168.0.13',now())

--�����ͻ���
use f4mall;
delete from faq;

use f4mall;
select * from faq

use f4mall;
delete from faq where f_no=2