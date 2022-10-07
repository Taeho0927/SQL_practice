CREATE table NewBook(
    bookid  number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

create table newcustomer(
    custid number PRIMARY KEY,
    name varchar2(40),
    address varchar2(40),
    phone varchar2(30)
);

create table neworders(
    orderid number primary key, 
    custid number not null,
    bookid number not null,
    saleprice number,
    orderdate date,
    foreign key(custid) references Newcustomer(custid)on delete cascade  
);
drop table newbook;
create table newbook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);
alter table newbook add isbn varchar(13);
alter table newbook modify isbn number;
alter table newbook drop column isbn;
alter table newbook modify bookid number not null;
alter table newbook add primary key(bookid);

drop table newbook;
drop table neworders;
drop table newcustomer;

insert into book values(11,'스포츠 의학','한솔의학서적',90000);
INSERT into book values(14,'스포츠 의학','한솔의학서적',null);

/* bulk insert */
insert into book(bookid,bookname,price,publisher)
        select bookid,bookname,price,publisher
        from imported_book;
        
update customer
set address = '대한민국 부산'
where custid=5;

select *
from customer;

update customer
set address=(select address
             from customer
             where name='김연아')
where name='박세리';

delete from customer
where custid=5
;

select*from customer;
--1
INSERT into book values(23,'스포츠 세계','대한미디어',10000);
--2
delete
from book
where book.publisher='삼성당';

delete
from book
where book.publisher='이상미디어';--외래키 위배

update book
set publisher='대한출판사'
where publisher='대한미디어';

-- 박지성이 구매한 도서의 이름, 가격, 정가와의 판매가격 차이
select bookname, price, price-saleprice
from customer, orders, book
where customer.custid = orders.custid and
      orders.bookid = book.bookid and
      customer.name = '박지성';
      
select bookname,price, price-saleprice
from book, orders
where book.bookid=orders.bookid and
      orders.custid=(select custid
                     from customer
                     where customer.name='박지성');
                     
-- 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select customer.name
from customer,orders,book
where customer.custid = orders.custid and
        orders.bookid = book.bookid
        and name not like '박지성'
        and book.publisher in (select publisher
                        from customer,orders,book
                        where customer.custid=orders.custid
                        and orders.bookid =book.bookid
                        and name = '박지성')
                        ;

--전체 고객의 30% 이상이 구매한도서
select bookname
from book,orders
where book.bookid=orders.bookid
group by bookname
having count(custid)>0.3*(select count(*)from customer);