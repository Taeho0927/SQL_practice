/*join*/
select hm.HPTL_NM , tcd.TYP_CD_nm, scd.SIDO_CD_NM 
from hptl_main hm , typ_cd_dtl tcd, sido_cd_dtl scd 
where hm.TYP_CD = tcd.typ_cd
and hm.SIDO_CD = scd.sido_cd
limit 10
;

/* scalar subquery로 똑같이 구현하기*/
# 코드성 테이블은 scalar subquery로 구현하는 경우가 많다.
# 한 번 읽은 코드 값은 저장을 해 놓는다(cache 효과)
# 결과는 무조건 1건만 나온다는 제약사항 존재(위배 시 오류)
select hptl_nm
	,(select TYP_CD_nm from typ_cd_dtl
		where  typ_cd = hm.TYP_CD ) as typ_cd_nm
		,(select sido_cd_nm from sido_cd_dtl
		where sido_cd = hm.SIDO_CD ) as sido_cd_nm
from hptl_main hm 
limit 10
;

with base as (
	select '1' as typ_cd from dual
	union
	select '11' as typ_cd from dual
)
select *
from hptl_main hm
	, base b
where 

with base as (
	select '1' as typ_cd from dual
	union
	select '11' as typ_cd from dual
)
select *
from hptl_main hm natural join base b
;

create table sido_cd_dtl2 as
select *
from sido_cd_dtl
limit 10
;
select * from sido_cd_dtl2;

# hptl_main과 sido_cd_dtl2를 사용하여
# hptl_nm, addr, sido_cd_nm
# sido_cd가 dtl2에 존재하지 않을 경우 "해당정보없음"
select sido, count(*) 
from(
select hptl_nm, addr, case when scd.sido_cd_nm is null then"해당정보없음"
						else scd.sido_cd_nm
						end as sido
from hptl_main hm left outer join sido_cd_dtl2 scd
on hm.SIDO_CD = scd.sido_cd
where hm.HPTL_NM = '경희한의원'
order by OPEN_DATE 
) as TTT
group by sido
;

-- Analytic Function
select hptl_nm, doc_num
	,lead(DOC_NUM,2) over(partition by null order by DOC_NUM desc)as "lead"
	,lag(doc_num) over(partition by null order by DOC_NUM desc)as "lag"
	, rank() over(partition by SIDO_CD order by DOC_NUM desc)as "rank"
	, sum(doc_num)over(partition by null order by DOC_NUM desc
		rows between unbounded preceding and current row)as "accum_sum"
	, avg(doc_num)over(partition by null order by DOC_NUM desc
		rows between 1 preceding and 1 following)as "avg_3"
from hptl_main hm 
;

