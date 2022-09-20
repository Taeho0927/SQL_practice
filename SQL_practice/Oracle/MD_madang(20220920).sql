select custid
from customer
INTERSECT
SELECT custid
from orders
;

select name
from customer
where custid in(select custid from orders)
minus
SELECT name
from customer
where custid in(select custid
                from orders
                where bookid in (select bookid
                                 from book
                                 where publisher = '���ѹ̵��'));
                                 
select bookname
from book
where bookid ='1';
/* �౸�� ������ å�� id */
select bookid
from book
where bookname = '�౸�� ����';
/* �������� ������ ������ ������ �� */
SELECT sum(saleprice)
from orders
where custid = '1';
/* �������� ������ ������ �� */
select count(*)as ��
from orders,customer
where orders.custid=customer.custid
and customer.name = '������'
;
/* �߽ż��� ������ ������ ���ǻ� ��*/
select count(distinct publisher)
from book, orders
where orders.bookid = book.bookid
    and orders.custid in (select custid
                          from customer
                          where name = '�߽ż�');

/* ���ǻ��� �� ���� */
select count(distinct publisher)
from book;

/*���� �达�� ���� �̸��� �ּ�*/
select customer.name, customer.address
from customer
where customer.name like '��%';

/* �ֹ��� �ѹ��� ���� ���� ���� �̸� */
select customer.name
from customer
where customer.custid not in(select orders.custid from orders);

/* �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ� */
select sum(saleprice)as �ֹ��Ѿ�,avg(saleprice)as �ֹ��Ѿ����
from orders;

/* ���� �̸��� ���� �����Ѿ� */
select customer.name,sum(saleprice)
from customer,orders
where orders.custid = customer.custid
group by customer.name;

/* ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸��� ���Ͻÿ� */
select customer.name, avg(saleprice)
from customer,orders
where orders.custid = customer.custid
group by customer.name
having 
avg(saleprice)>(select avg(saleprice)from orders)
;

