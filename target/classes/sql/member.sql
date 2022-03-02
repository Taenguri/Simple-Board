create table member(
memberId varchar2(50) not null,
memberPw varchar2(100) not null,
memberName varchar2(30) not null,
regdate date default sysdate,
primary key(memberId)
)