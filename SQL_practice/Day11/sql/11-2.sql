drop table HPTL_MAST;
CREATE TABLE HPTL_MAST
(
 SECU_KEY_CD VARCHAR(200),
 HPTL_NM VARCHAR(500),
 TYP_CD VARCHAR(2),
 TYP_CD_NM VARCHAR(50),
 SIDO_CD VARCHAR(6),
 SIDO_CD_NM VARCHAR(50),
 SIGGU_CD VARCHAR(6),
 SIGGU_CD_NM VARCHAR(50),
 EMD VARCHAR(100),
 POST_CD VARCHAR(6),
 ADDR VARCHAR(300),
 TEL_NO VARCHAR(100),
 HPTL_URL VARCHAR(500),
 OPEN_DATE VARCHAR(10),
 DOC_NUM INT,
 DOC_GNRL_NUM INT,
 DOC_INT_NUM INT,
 DOC_RESI_NUM INT,
 DOC_SP_NUM INT,
 DENT_GNRL_NUM INT,
 DENT_INT_NUM INT,
 DENT_RESI_NUM INT,
 DENT_SP_NUM INT,
 EAST_GNRL_NUM INT,
 EAST_INT_NUM INT,
 EAST_RESI_NUM INT,
 EAST_SP_NUM INT,
 X_LOC FLOAT(10,3),
 Y_lOC FLOAT(10,3)
);



select count(*)as "총건수" from hptl_mast; 
select *
from hptl_mast ;
/*between*/
select  hptl_nm,doc_num
from hptl_mast
where DOC_NUM between 500 and 1000;

/* 서울이 아니면서 typ_cd_nm이 상급종합인 병원의
 * 병원이름, 의사 수, 위도, 경도 구하기*/
select  HPTL_NM ,DOC_NUM ,X_LOC ,Y_lOC 
from hptl_mast
where ADDR not like'서울%' and TYP_CD_NM = '상급종합';



/*CASE WHEN*/
select *
from (
select HPTL_NM,
case when DOC_NUM > 1000 then '초대형'
	 when DOC_NUM between 500 and 999 then '대형'
	 when DOC_NUM = 0 then '뭐하는 곳?'
	 when DOC_NUM < 500 then '소형'
	 end as GUBUN
from hptl_mast ) as TTT
where GUBUN = "뭐하는 곳?";





select (select count(*) as cnt from hptl_mast where ADDR like'%서울%');

/* 전국의 병원 중 서울에 있는 병원이 차지하는 비율 */
/*1번방법*/
select (select count(*) as cnt from hptl_mast where ADDR like'%서울%')/
		(select count(*) as cnt from hptl_mast) *100 as ratio from dual;

/*2번방법*/
select sum(case when ADDR like '서울%' then 1 else 0 END)
		/count(*)*100 as RATIO
from hptl_mast;

/*서울에 있는 병원 수, 부산에 있는 병원 수와 전국 대비 비율을 구하시오.*/
 select sum(case when ADDR like '서울%' then 1 else 0 END)
	/count(*)*100 as RATIO,sum(case when ADDR like '부산%' then 1 else 0 END)
	/count(*)*100 as RATIO
from hptl_mast;