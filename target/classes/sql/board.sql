
CREATE TABLE board(
bno number not null,
title varchar2(100) not null,
content varchar2(2000) not null,
writer varchar2(100) not null,
regdate date default sysdate,
hit number default 0,
memberId varchar2(50) not null,
primary key (bno),
constraint board_member foreign key (memberId)
	references member(memberId) on delete cascade
);

create sequence board_seq;