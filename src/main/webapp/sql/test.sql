create table member(
	mid varchar(20) primary key not null,
	mnick varchar(50) not null,
	mpw  varchar(50) not null,
	mname varchar(20) not null,
	mphone varchar(30) not null,
	addr varchar(70) not null,
	addrapt varchar(100) not null,
	memail varchar(100) not null
);
update member set mnick=?, mpw=?, addr=?,addrapt=?, mphone=?, meamil=? where mid=?
create table product(
	ppk int primary key not null,
	ptitle varchar(100) not null,
	ppic varchar(100),
	pcontent varchar(300) not null,
	pprice int not null,
	pmnick varchar(50) not null,
	pmphone varchar(30) not null,
	paddr varchar(70) not null,
	pdate date default sysdate,
	pcnt int default 0,
	pbkcnt int default 0,
	pstate int default 0
);

create table bucket(
	productpk int not null,
	membernick varchar(30) not null
);

update member set mphone='01066126962' where mid='tjdrhkd1234a';

drop table member;
drop table product;
drop table bucket;

select * from MEMBER;
select * from product;
select * from bucket;

insert into member values('mid','mnick','1524','이다술','010-1234-1234','서울시 광진구','1002호','ekfei@kek.com');
insert into product (ppk, ptitle, ppic, pcontent, pprice, pmnick, pmphone, paddr)values((select nvl(max(ppk),0)+1 from product),'신발','images/404.jpg','내용','1000','mnick','010-1234-1234','서울특별시 강남구 강남대로 396');
insert into product (ppk, ptitle, ppic, pcontent, pprice, pmnick, pmphone, paddr)values((select nvl(max(ppk),0)+1 from product),'신발','images/webB.PNG','내용','1000','mnick','010-1234-1234','서울시 광진구');
update product set ptitle='신발2',pcontent='신발이에오',pprice='3400',pcnt=(select nvl(max(pcnt),0)+1 from product) where ppk=1;
update product set ptitle='신발2',pcontent='신발이에오',pprice='5000',pcnt=(select nvl(max(pcnt),0)+1 from product) where ppk=1;
insert into product (ppk,ptitle,pcontent,pprice,pmid,pmnick,pmphone,paddr) values((select nvl(max(ppk),0)+1 from product),'신발','설명1','3500','이다솔','mnick','010-1234-1234','서울시 광진구');
insert into product (ppk,ptitle,pcontent,pprice,pmid) values((select nvl(max(ppk),0)+1 from product),'구두','설명2','3600','판매자2');
insert into product (ppk,ptitle,pcontent,pprice,pmid) values((select nvl(max(ppk),0)+1 from product),'제목1','설명3','3620','판매자1');
insert into product (ppk,ptitle,pcontent,pprice,pmid) values((select nvl(max(ppk),0)+1 from product),'제목3','설명4','3622','판매자3');
insert into product (ppk,ptitle,pcontent,pprice,pmid) values((select nvl(max(ppk),0)+1 from product),'제목4','설명5','3623','판매자5');

select * from product where ptitle like '%'||'신'||'%' and pprice between 20000 and 30000;

insert into bucket (productpk, membernick) values(1,'이다솔');
insert into bucket (productpk, membernick) values(2,'이다솔');
insert into bucket (productpk, membernick) values(1,'홍길동');
insert into bucket (productpk, memberpk) values(4,1);
update product set pcnt=pcnt+1 where ppk=1;

select * from product where ptitle like '%'||'최'||'%';
select * from product  where pprice BETWEEN '3000' AND '4500';
select * from product where pprice BETWEEN 20000 AND 500000;
select product.* from product join bucket on product.ppk = bucket.productpk where memberpk = 1;

delete from product where ppk=6; 

update member set mpw='1234', addr='경기도구리시',addrapt='경기도', mphone='010-1234-1234', memail='dnfrlwh@askd.com' where mid='변수철';
select * from product  where pprice BETWEEN 4000 AND 5000;

select product.* from product join bucket on product.ppk = bucket.productpk where membernick = '이다솔';


