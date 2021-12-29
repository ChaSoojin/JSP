use board;

CREATE TABLE `board` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `likes` int(10) DEFAULT '0',
  `regdate` datetime NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

insert into board(id,pw,title,content,likes,regdate) values ('admin', '2222', '관리자공지', '공지사항 전해드립니다.', 1,'2021-12-01 00:00:00');
insert into board(id,pw,title,content,regdate) values ('abc1234', '4444', 'abcabc', 'abcabcabc.....','2021-12-28 05:53:39');


CREATE TABLE `users` (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pw` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `regDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

insert into users(id,pw,regDate) values ('abc1234', 'abc1234*', '2021-12-28 06:05:22');
insert into users(id,pw,regDate) values ('admin', 'admin1234*', '2021-12-18 05:19:39');
