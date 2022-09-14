SELECT *
from customer,orders
where customer.custid=orders.custid
order by customer.custid
;

SELECT customer.name,customer.custid,sum(orders.saleprice
from customer,orders
where customer.custid=orders.custid
group by customer.custid,customer.name
order by customer.name
;

select customer.name,book.bookname,orders.saleprice as ����
from customer,orders,book
where customer.custid=orders.custid and orders.bookid=book.bookid
;

select customer.name, book.bookname
from customer,orders,book
where customer.custid=orders.custid and orders.bookid=book.bookid and book.price = 20000
;

select customer.name, saleprice
from customer left join orders
on customer.custid= orders.custid
;

select bookname
from book
where price = (select max(price)from book)
;

select name
from customer
where custid in (select custid from orders)
;

select name
from customer
where custid not in(select custid
             from orders
             where bookid in(select bookid
                             from book
                             where publisher = '���ѹ̵��'))
;

select b1.bookname ,b1.publisher
from book b1
where b1.price > (Select avg(b2.price)
                 from book b2
                 where b2.publisher =b1.publisher);
                 
/* ������ ������ ����� �߿� ���ѹ̵�� å�� �ѹ��̶� �Ȼ���*/
select name
from customer
where custid  in(select custid
             from orders
             where bookid not in(select bookid
                             from book
                             where publisher = '���ѹ̵��')
                             and custid not in(select custid
                             from orders
                             where bookid in(select bookid
                             from book
                             where publisher = '���ѹ̵��')));
                             
                            