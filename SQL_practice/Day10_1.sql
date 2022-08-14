CREATE TABLE test(
	strdata VARCHAR(300),
	intdata int(4),
	floatdata FLOAT(10,3),
	timedata DATE
);


# table alter - column type
ALTER TABLE test MODIFY COLUMN timedata DATETIME;

SELECT*FROM test;
INSERT INTO test VALUES('AAA',100,5.304,SYSDATE());
COMMIT; #자동커밋 (변경사항 적용)

#drop table
DROP TABLE test; # table 삭제
#TRUNCATE TABLE test; # table date 삭제 : 외형은 유지
#delete tabel test; # table date 삭제 : 한건 한건씩(속도차이)