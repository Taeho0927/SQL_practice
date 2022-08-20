select * from movie_mast;

/* unique key */
drop table movie_mast ;
create table movie_mast(
	movie_name varchar(100),
	open_date varchar(8)
);

alter table movie_mast add constraint primary key(movie_name);
alter table movie_mast add constraint movie_mast_u1 unique(open_date);

insert into movie_mast values('헌트','20220815');
insert into movie_mast values('헌트','20991011'); /*실패(pk위반)*/
insert into movie_mast values('한산','20220815'); /*실패(uk위반)*/
insert into movie_mast values(null,'20991011'); /*실패(pk는 null입력불가)*/
insert into movie_mast values('한산',null); /*성공(uk는null입력가능)*/
insert into movie_mast values('한산2',null); /*성공(uk는null입력가능)*/
insert into movie_mast values('한산3',null); /*성공(uk는null입력가능)*/
update movie_mast set open_date = '20220815' /*실패(uk위반)*/
where movie_name = '한산3';

/* dual = dummy */
select 1 from dual;
select sysdate() from dual;

select * from movie_mast;

select 1 from dual
union all
select 1 from dual;

/* data population - 데이터 불리기 */
select * from movie_mast,
(select 1 from dual union all select 2 from dual) as dummy,
(select 3 from dual union all select 4 from dual) as dummy2
;

select "강남성모병원" as hptl_name
, "20220301" as open_date
, 311 as doc_num from dual;








