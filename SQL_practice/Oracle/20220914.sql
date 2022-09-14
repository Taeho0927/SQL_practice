/*과제 내용 : 서브쿼리를 이용하여 마당 데이터베이스 에서 도서를 구매하지 않은 고객 중 '대한미디어'의 책을 구매하지 않은 고객의 이름을 출력하시오*/
select name
from customer
where custid  in(select custid
             from orders
             where bookid not in(select bookid
                             from book
                             where publisher = '대한미디어')
                             and custid not in(select custid
                             from orders
                             where bookid in(select bookid
                             from book
                             where publisher = '대한미디어')));
