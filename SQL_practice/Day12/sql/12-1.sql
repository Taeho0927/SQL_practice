/* order by */
/* 테이블 1개 조회 등 간단한 경우는 데이터의 순서대로 나온다.*/
/* 테이블을 조인하거나 복잡한 쿼리의 경우는 hash */
/* hash bucket, hash function, hash value, hash join */
select * from hptl_mast
order by DOC_NUM desc
;

/* 가장 오래된 전통있는 병원부터 결과가 나오도록 쿼리를 작성하시오. */
/* 병원명, 오픈일자, 주소*/
/* 오픈일자가 같으면 병원명 오름차순으로 정렬하시오*/
select hptl_nm, (case when open_date=""then "9999-12-31"
else OPEN_DATE end) as open_dt, addr
from hptl_mast
where OPEN_DATE not like '1900%'
order by OPEN_dt asc, HPTL_NM asc
;

/* group by */
/* 시도별 병원 수, 의사 수 */
select SIDO_CD_NM ,count(*), sum(DOC_NUM) 
from hptl_mast
group by SIDO_CD_NM 
;

/* 시도별, 병원타입별, 병원 수, 의사 수*/
/* 시도별, 병원 수가 많은 것부터 표시 */
select sido_cd_nm, typ_cd_nm,count(*) as cnt,sum(doc_num)
from hptl_mast
group by SIDO_CD_NM ,TYP_CD_NM 
order by  SIDO_CD_NM asc,cnt desc 
;

/* haivng */
select sido_cd_nm, count(*)
from hptl_mast
group by SIDO_CD_NM 
having count(*) > 3000  
;

with temp as (
	select sido_cd_nm, count(*)as cnt
	from hptl_mast
	group by SIDO_CD_NM
)
select *
from temp
where cnt > 3000
;

/* 이름이 똑같은 병원이 있는지 검색하고 있다면
 * 무슨 병원이고 몇 개가 똑같은 지 출력하시오. */
select hptl_nm, count(*) 
from hptl_mast
group by HPTL_NM 
having count(*)>1
order by count(*) desc 
;

/* CTAS(Create Table as Select) */
select *
from hptl_mast
;

/*typ_cd 테이블 만들기*/
create table typ_cd_dtl as
select typ_cd, typ_cd_nm
from hptl_mast
group by TYP_CD ,TYP_CD_NM 
;

/*sido_cd_dtl, siggu_cd_dtl*/
create table sido_cd_dtl as
select sido_cd, SIDO_CD_NM 
from hptl_mast
group by sido_cd ,sido_cd_nm
;
create table siggu_cd_dtl as
select siggu_cd,SIGGU_CD_NM 
from hptl_mast
group by siggu_cd ,SIGGU_CD_NM 
;
select *
from  sido_cd_dtl
;

/* hptl_mast에서 중복되는 컬럼을 제외하고 새로 만들기 */
desc hptl_main  ;

create table hptl_main as 
select
HPTL_NM,
TYP_CD,
SIDO_CD,
SIGGU_CD,
EMD,
POST_CD,
ADDR,
TEL_NO,
HPTL_URL,
OPEN_DATE,
DOC_NUM,
DOC_GNRL_NUM,
DOC_INT_NUM,
DOC_RESI_NUM,
DOC_SP_NUM,
DENT_GNRL_NUM,
DENT_INT_NUM,
DENT_RESI_NUM,
DENT_SP_NUM,
EAST_GNRL_NUM,
EAST_INT_NUM,
EAST_RESI_NUM,
EAST_SP_NUM,
X_LOC,
Y_lOC
from hptl_mast;

select *
from hptl_main ;