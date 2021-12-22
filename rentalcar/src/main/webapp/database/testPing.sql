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


CREATE TABLE `member` (
  `id` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


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


CREATE TABLE `review` (
  `reviewSeq` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `likes` int(10) DEFAULT '0',
  `enrollDate` datetime NOT NULL,
  PRIMARY KEY (`reviewSeq`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


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


CREATE TABLE `review_like` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `reviewno` int(10) NOT NULL,
  `id` varchar(20) NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


