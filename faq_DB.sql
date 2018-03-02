use f4mall;
create table faq(
    f_no bigint primary key auto_increment,    /*FAQ번호PK*/
    m_id varchar(200) not null,                         /*회원아이디FK*/
    f_name varchar(200) not null,                       /*FAQ제목*/
    f_content text not null,                            /*내용*/
    f_ip varchar(200) not null,                         /*작성자IP*/
    f_regdate date                                     /*작성일자*/
)

-- 기본키(primary key)
alter table faq
	add constraint pk_f_no primary key(f_no);
	
use f4mall;
insert into faq(m_id,f_name,f_content,f_ip,f_regdate) values('admin','박경민','헬로우월드','192.168.0.13',now())

use f4mall;
select * from faq
