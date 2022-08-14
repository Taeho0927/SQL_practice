CREATE TABLE movie(
	movie_name VARCHAR(100),
	open_date VARCHAR(8),
	rating INT(2),
	genre VARCHAR(20),
	country VARCHAR(30),
	play_time INT(3),
	provider VARCHAR(50)
);

INSERT INTO movie VALUES('베놈2','20211013',15,'액션','미국',97,'소니픽쳐스');
INSERT INTO movie VALUES('인셉션','20100721',12,'액션','미국',147,'디스테이션');
INSERT INTO movie VALUES('007노타임투다이','20210929',12,'액션','미국',163,'유니버셜');

SELECT * FROM movie;

SELECT * 
FROM movie
#WHERE rating >= 15;
#WHERE rating >= 15 OR country '영국';
#WHERE country <> '영국' AND play_time >100 ;
#WHERE movie_name LIKE '%임%';	#임이란 글짜가 포함되어있지만 앞이랑 뒤에 몇글자인지  모 를 때
#WHERE open_date LIKE '____0___';	#5번째 글짜가 0인것 = 10월에 개봉하지 않은 영화
WHERE play_time IN (147,163);

#insert example
INSERT INTO movie(movie_name, genre, country) VALUES('007다이','멜로','한국');

SELECT * FROM movie;

#update example
UPDATE movie
SET open_date = '20220820', rating =99
WHERE movie_name = '007다이'
;

#delete example
DELETE FROM movie
WHERE rating = 99
AND movie_name NOT LIKE '%인셉%'
;
