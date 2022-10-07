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

insert into book values(11,'������ ����','�Ѽ����м���',90000);
INSERT into book values(14,'������ ����','�Ѽ����м���',null);

/* bulk insert */
insert into book(bookid,bookname,price,publisher)
        select bookid,bookname,price,publisher
        from imported_book;
        
update customer
set address = '���ѹα� �λ�'
where custid=5;

select *
from customer;

update customer
set address=(select address
             from customer
             where name='�迬��')
where name='�ڼ���';

delete from customer
where custid=5
;

select*from customer;
--1
INSERT into book values(23,'������ ����','���ѹ̵��',10000);
--2
delete
from book
where book.publisher='�Ｚ��';

delete
from book
where book.publisher='�̻�̵��';--�ܷ�Ű ����

update book
set publisher='�������ǻ�'
where publisher='���ѹ̵��';

-- �������� ������ ������ �̸�, ����, �������� �ǸŰ��� ����
select bookname, price, price-saleprice
from customer, orders, book
where customer.custid = orders.custid and
      orders.bookid = book.bookid and
      customer.name = '������';
      
select bookname,price, price-saleprice
from book, orders
where book.bookid=orders.bookid and
      orders.custid=(select custid
                     from customer
                     where customer.name='������');
                     
-- �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
select customer.name
from customer,orders,book
where customer.custid = orders.custid and
        orders.bookid = book.bookid
        and name not like '������'
        and book.publisher in (select publisher
                        from customer,orders,book
                        where customer.custid=orders.custid
                        and orders.bookid =book.bookid
                        and name = '������')
                        ;

--��ü ���� 30% �̻��� �����ѵ���
select bookname
from book,orders
where book.bookid=orders.bookid
group by bookname
having count(custid)>0.3*(select count(*)from customer);