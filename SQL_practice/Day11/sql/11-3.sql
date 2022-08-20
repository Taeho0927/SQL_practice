/*abs : 절대값*/
select abs(1.1) from dual; 
select abs(-50.1) from dual; 

/*ceil : 올림*/
select ceil (2.83) from dual;
select ceil (2.01) from dual;
select ceil (-1.6) from dual;

/*floor : 내림*/
select floor(2.83) from dual;
select floor(-1.6) from dual;

/*round : 반올림*/
select round(123.456,1) from dual;
select round(123.456) from dual;
select round(123.456,-1)from dual;

/*10개 병원의 의사수를 534->500, 36->0,178->200*/
select HPTL_NM,round(DOC_NUM,-2) 
from hptl_mast
limit 10
;

/*lower, upper, length*/
select lower('Good Morning'),upper('Good Morning'),length('Good Morning')
,length ('좋은 아침이냐?')from dual;  /*한글을 3바이트로 인식*/

/*substr : 문자열에서 특정 부분 가져오기*/
select substr('google good',4,3) from dual; /*db는 시작이 0이 아니라 1이다.*/
select substr('google good',4) from dual; 

/*병원의 전화번호의 뒷자리 4자리 가져오기*/
select hptl_nm,TEL_NO,substr(TEL_NO,-4)
from hptl_mast
limit 10;

/*lpad, rpad*/
select lpad('356',10,'*') from dual;
select rpad('356',10,'*') from dual;

/*병원 10개의 의사 수를 무조건 5자리로 만드시오. 부족하면 0을 붙일 것 534>>00534*/
select hptl_nm,lpad(DOC_NUM,5,0)
from hptl_mast
where DOC_NUM <50
limit 10;

/*concat*/
select concat('AAA','BBB') from dual;

/*replace(s1,s2,s3) s1에서 s2가 나오면 s3로 대체*/
select hptl_nm,replace(replace(hptl_nm,'병원',' Hospital'),'대학교','Univ')
from hptl_mast
limit 100;

/*add months, to char*/
select to_char(add_months(sysdate(),3),'yyyy/mm/dd')
from dual;

/*count(*)*/
select count(*) from hptl_mast;

/*distinct : 중복 제거*/
select distinct typ_cd_nm
from hptl_mast;

/*count + distinct : 얼마나 다양한 종류의 값이 있는지*/
select count(distinct typ_cd_nm)
from hptl_mast;

/*min(), max(), avg(), sum()*/
select min(doc_num) as "최소 의사 수"
 	  ,max(doc_num) as "최대 의사 수"
 	  ,round(avg(doc_num),1) as "평균 의사 수" 
 	  ,sum(doc_num) as "의사 수 총합"
from hptl_mast;