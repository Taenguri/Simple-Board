create table reply(
rno number not null,
bno number not null,
replyContent varchar2(1000) not null,
replyRegdate date default sysdate,
memberId varchar2(50) not null,
primary key(rno),
constraint reply_member foreign key (memberId)
	references member(memberId) on delete cascade,
constraint reply_board foreign key(bno)
	references board(bno) on delete cascade

);

create sequence reply_seq;