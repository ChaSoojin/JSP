use rentalcar;

CREATE TABLE `car_reserve` (
  `reserve_seq` int(11) NOT NULL AUTO_INCREMENT,
  `no` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `cnt` int(11) NOT NULL,
  `days` int(11) NOT NULL,
  `r_day` varchar(50) NOT NULL,
  `use_navi` int(11) DEFAULT NULL,
  `use_seat` int(11) DEFAULT NULL,
  PRIMARY KEY (`reserve_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


insert into car_reserve(no,id,cnt,days,r_day,use_navi,use_seat) values (17, 'abcd1234', 2, 7, '2021-01-19', 1, 2);
insert into car_reserve(no,id,cnt,days,r_day,use_navi,use_seat) values (9, 'cha1234', 1, 2, '2021-12-25', 1, 2);
insert into car_reserve(no,id,cnt,days,r_day,use_navi,use_seat) values (7, 'cha1234', 1, 3, '2022-01-03', 0, 1);


CREATE TABLE `member` (
  `id` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


insert into member values ('cha1234', 'cha1234*', 'cha', 'soo@naver.com', '01022222222', 25);
insert into member values ('hong1234', 'hong1234*', '홍길동', 'hong@naver.com', '01033333333', 21);
insert into member values ('abcd1234', 'abcd1234*', 'abcd', 'abcd@naver.com', '01011111111', 30);



CREATE TABLE `rentcar` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `category` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `use_people` int(11) NOT NULL,
  `company` varchar(50) NOT NULL,
  `img` varchar(50) DEFAULT NULL,
  `info` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


INSERT INTO rentcar VALUES (1, '아반테', 1,  2000, 4, '기아', '1.jpg' , '아반테 자동차 입니다.');
INSERT INTO rentcar VALUES (2, 'BMW', 3,  6000, 4, 'BMW', '2.jpg' , 'BMW 자동차 입니다.');
INSERT INTO rentcar VALUES (3, '카니발', 1,  4000, 7, '기아', '3.jpg' , '카니발 자동차 입니다.');
INSERT INTO rentcar VALUES (4, '카렌스', 2,  2500, 4, '기아', '4.jpg' , '카렌스 자동차 입니다.');
INSERT INTO rentcar VALUES (5, '코란도', 1,  3000, 4, '현대', '5.jpg' , '코란도 자동차 입니다.');
INSERT INTO rentcar VALUES (6, '에쿠스', 3,  6000, 4, 'BMW', '6.jpg' , '에쿠스 자동차 입니다.');
INSERT INTO rentcar VALUES (7, '제네시스', 1,  3000, 4, '기아', '7.jpg' , '제네시스 자동차 입니다.');
INSERT INTO rentcar VALUES (8, '그랜져', 1,  2400, 4, '현대', '8.jpg' , '그랜져 자동차 입니다.');
INSERT INTO rentcar VALUES (9, 'k3', 1,  2700, 4, '현대', '9.jpg' , 'k3 자동차 입니다.');
INSERT INTO rentcar VALUES (10, 'k5', 2,  5000, 4, '기아', '10.jpg' , 'k5 자동차 입니다.');
INSERT INTO rentcar VALUES (11, 'k9', 1,  6000, 4, '현대', '11.jpg' , 'k9 자동차 입니다.');
INSERT INTO rentcar VALUES (12, '라세티', 2,  2000, 5, '기아', '12.jpg' , '라세티 자동차 입니다.');
INSERT INTO rentcar VALUES (13, 'lf소나타', 1,  2000, 4, '현대', '13.jpg' , 'lf소나타 자동차 입니다.');
INSERT INTO rentcar VALUES (14, '말리부', 3,  2000, 4, 'BMW', '14.jpg' , '말리부 자동차 입니다.');
INSERT INTO rentcar VALUES (15, '모닝', 1,  23000, 4, '현대', '15.jpg' , '모닝 자동차 입니다.');
INSERT INTO rentcar VALUES (16, '올라도', 3,  5000, 4, 'BMW', '16.jpg' , '올라도 자동차 입니다.');
INSERT INTO rentcar VALUES (17, '레이', 2,  4000, 4, '현대', '17.jpg' , '레이 자동차 입니다.');
INSERT INTO rentcar VALUES (18, 'SM5', 1,  2700, 4, 'BMW', '18.jpg' , 'SM5 자동차 입니다.');


CREATE TABLE `review` (
  `reviewSeq` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `likes` int(10) DEFAULT '0',
  `enrollDate` datetime NOT NULL,
  PRIMARY KEY (`reviewSeq`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



insert into review(id, title, content, likes, enrollDate) values ('abcd1234', '리뷰', '여기 사이트 좋아요!', 2, '2021-12-20 14:12:26');
insert into review(id, title, content, likes, enrollDate) values ('cha1234', '좋아요', '한번 이용해 보세요~', 0, '2021-12-20 16:51:15');
insert into review(id, title, content, likes, enrollDate) values ('hong1234', '여기 추천해요', '추천합니다!', 2, '2021-12-22 00:16:20');
insert into review(id, title, content, likes, enrollDate) values ('hong1234', '좋아요~', '이하 동일..', 1, '2021-12-22 04:14:53');


CREATE TABLE `review_comment` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `reviewno` int(10) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `likes` int(10) DEFAULT '0',
  `notlikes` int(10) DEFAULT '0',
  `regdate` datetime NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

insert into review_comment(id, reviewno, comment, likes, notlikes, regdate) values ('abcd1234', 1, '댓글 많이 달아주세요~', 2, 1, '2021-12-20 09:13:54');
insert into review_comment(id, reviewno, comment, likes, notlikes, regdate) values ('cha1234', 1, '네~ 좋네요!', 1, 0, '2021-12-22 05:23:07');
insert into review_comment(id, reviewno, comment, likes, notlikes, regdate) values ('cha1234', 3, '굿굿', 0, 1, '2021-12-22 05:23:07');


CREATE TABLE `review_like` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `reviewno` int(10) NOT NULL,
  `id` varchar(20) NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


insert into review_like(reviewno, id) values (1, 'abcd1234');
insert into review_like(reviewno, id) values (1, 'cha1234');
insert into review_like(reviewno, id) values (3, 'hong1234');
insert into review_like(reviewno, id) values (3, 'cha1234');
insert into review_like(reviewno, id) values (4, 'cha1234');