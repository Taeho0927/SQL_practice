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
                                 where publisher = '대한미디어'));
                                 
select bookname
from book
where bookid ='1';
/* 축구의 역사라는 책의 id */
select bookid
from book
where bookname = '축구의 역사';
/* 박지성이 구매한 도서의 가격의 합 */
SELECT sum(saleprice)
from orders
where custid = '1';
/* 박지성이 구매한 도서의 수 */
select count(*)as 권
from orders,customer
where orders.custid=customer.custid
and customer.name = '박지성'
;
/* 추신수가 구매한 도서의 출판사 수*/
select count(distinct publisher)
from book, orders
where orders.bookid = book.bookid
    and orders.custid in (select custid
                          from customer
                          where name = '추신수');

/* 출판사의 총 갯수 */
select count(distinct publisher)
from book;

/*성이 김씨인 고객의 이름과 주소*/
select customer.name, customer.address
from customer
where customer.name like '김%';

/* 주문을 한번도 하지 않은 고객의 이름 */
select customer.name
from customer
where customer.custid not in(select orders.custid from orders);

/* 주문 금액의 총액과 주문의 평균 금액 */
select sum(saleprice)as 주문총액,avg(saleprice)as 주문총액평균
from orders;

/* 고객의 이름과 고객별 구매총액 */
select customer.name,sum(saleprice)
from customer,orders
where orders.custid = customer.custid
group by customer.name;

/* 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름을 구하시오 */
select customer.name, avg(saleprice)
from customer,orders
where orders.custid = customer.custid
group by customer.name
having 
avg(saleprice)>(select avg(saleprice)from orders)
;

