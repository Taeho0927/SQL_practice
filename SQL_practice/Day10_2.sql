/*TABLE ALTER EXERCISE*/
#1. TABLE CREATION
DROP TABLE movie100;
DROP TABLE movie_mast;
CREATE TABLE movie100 (
	movie_name VARCHAR(100),
	open_date VARCHAR(8)
);
INSERT INTO movie100 VALUES('007','20220814');
SELECT * FROM movie100;

#2. rename table
ALTER TABLE movie100 RENAME TO movie_mast;
SELECT * FROM movie_mast;

#3. add column
ALTER TABLE movie_mast ADD rating INT(2);

#4. modify column type
ALTER TABLE movie_mast MODIFY rating INT(3);
DESCRIBE movie_mast;

#5. change column name
ALTER TABLE movie_mast RENAME COLUMN rating TO rate;

#6. drop column
ALTER TABLE movie_mast DROP rate;

#7. drop table
DROP TABLE movie_mast;

# NOT NULL
DROP TABLE movie_mast;
CREATE TABLE movie_mast(
	movie_name VARCHAR(100),
	open_date VARCHAR(8) NOT null
);

INSERT INTO movie_mast(movie_name,open_date) VALUES('predetors',null);
SELECT * FROM movie_mast;

# default
DROP TABLE movie_mast;
CREATE TABLE movie_mast(
	movie_name VARCHAR(100),
	open_date VARCHAR(8) DEFAULT '19700101'
);
INSERT INTO movie_mast(movie_name) VALUES('독전');
SELECT * FROM movie_mast;
INSERT INTO movie_mast VALUES('the rock',NULL);


# PK(primary key)
# 테이블 생성 시
DROP TABLE movie_mast;
CREATE TABLE movie_mast(
	movie_name VARCHAR(100) PRIMARY KEY,
	open_date VARCHAR(8)
);
SELECT * FROM movie_mast;
INSERT INTO movie_mast(open_date) VALUES('20221011');
INSERT INTO movie_mast VALUES('007','20221011');
INSERT INTO movie_mast VALUES('008','20221011');
INSERT INTO movie_mast VALUES('007','20991011');
SELECT * FROM movie_mast;

#이미 생성한 테이블에 추가
DROP TABLE movie_mast;
CREATE TABLE movie_mast(
	movie_name VARCHAR(100),
	open_date VARCHAR(8)
);
ALTER TABLE movie_mast ADD CONSTRAINT PRIMARY KEY(movie_name,open_date);
INSERT INTO movie_mast VALUES ('007','20220814');
INSERT INTO movie_mast VALUES ('007','20990814');
SELECT * FROM movie_mast;