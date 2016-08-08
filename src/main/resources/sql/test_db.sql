DROP TABLE IF EXISTS `tests`;

CREATE TABLE IF NOT EXISTS `tests` (
  `id`        INT(11) NOT NULL AUTO_INCREMENT,
  `name`      VARCHAR(255)     DEFAULT NULL,
  `date_from` VARCHAR(25)      DEFAULT NULL,
  `date_to`   VARCHAR(25)      DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


DROP TABLE IF EXISTS `questions`;

CREATE TABLE IF NOT EXISTS `questions` (
  `id`     INT(11) NOT NULL AUTO_INCREMENT,
  `name`   VARCHAR(1000)    DEFAULT NULL,
  `first`  VARCHAR(1000)    DEFAULT NULL,
  `second` VARCHAR(1000)    DEFAULT NULL,
  `third`  VARCHAR(1000)    DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `testquestions`;

CREATE TABLE IF NOT EXISTS `testquestions` (
  `id_tests`     INT(11) NOT NULL,
  `id_questions` INT(11) NOT NULL,
  PRIMARY KEY (`id_questions`, `id_tests`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `result`;

CREATE TABLE IF NOT EXISTS `result` (
  `id`          INT(11) NOT NULL AUTO_INCREMENT,
  `id_test`     INT(11)          DEFAULT NULL,
  `id_question` INT(11)          DEFAULT NULL,
  `login`       VARCHAR(55)      DEFAULT NULL,
  `res`         INT(5)           DEFAULT NULL,
  `date_pass`   VARCHAR(25)      DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


DROP TABLE IF EXISTS `users`;

CREATE TABLE IF NOT EXISTS `users` (
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `enabled`  BOOLEAN      NOT NULL,
  PRIMARY KEY (`username`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `authorities`;

CREATE TABLE IF NOT EXISTS `authorities` (
  `username`  VARCHAR(255) NOT NULL,
  `authority` VARCHAR(255) NOT NULL,
  CONSTRAINT `fk_authorities_users`
  FOREIGN KEY (`username`) REFERENCES users (username)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE UNIQUE INDEX ix_auth_username ON authorities (username, authority);

#
# INSERT INTO tests
# VALUES (1, '������ ����', DATE_FORMAT(current_date, '%d.%c.%Y %T'), DATE_FORMAT(current_date, '%d.%c.%Y %T'));
# INSERT INTO tests
# VALUES (2, '������ ����', DATE_FORMAT(current_date, '%d.%c.%Y %T'), DATE_FORMAT(current_date, '%d.%c.%Y %T'));
# INSERT INTO tests
# VALUES (3, '������ ����', DATE_FORMAT(current_date, '%d.%c.%Y %T'), DATE_FORMAT(current_date, '%d.%c.%Y %T'));
#
# INSERT INTO testquestions VALUES (0, 1, '<form action="/getquestions"><b>���� 1. ������ 1.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="1" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 0 ��������.<br />
#             �������� �������� �� 15 ��������.');
#
# INSERT INTO testquestions VALUES (1, 1, '<form action="/getquestions"><b>���� 1. ������ 2.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="2" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 1 ������.<br />
#             �������� �������� �� 14 �������.');
#
# INSERT INTO testquestions VALUES (2, 1, '<form action="/getquestions"><b>���� 1. ������ 3.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="3" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 2 �������.<br />
#             �������� �������� �� 13 �������.');
#
# INSERT INTO testquestions VALUES (3, 1, '<form action="/getquestions"><b>���� 1. ������ 4.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="4" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 3 �������.<br />
#             �������� �������� �� 12 �������.');
#
# INSERT INTO testquestions VALUES (4, 1, '<form action="/getquestions"><b>���� 1. ������ 5.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="5" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 4 �������.<br />
#             �������� �������� �� 11 ������.');
#
# INSERT INTO testquestions VALUES (5, 1, '<form action="/getquestions"><b>���� 1. ������ 6.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="6" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 5 ��������.<br />
#             �������� �������� �� 10 ��������.');
#
# INSERT INTO testquestions VALUES (6, 1, '<form action="/getquestions"><b>���� 1. ������ 7.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="7" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 6 ��������.<br />
#             �������� �������� �� 9 ��������.');
#
# INSERT INTO testquestions VALUES (7, 1, '<form action="/getquestions"><b>���� 1. ������ 8.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="8" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 7 ��������.<br />
#             �������� �������� �� 8 ��������.');
#
# INSERT INTO testquestions VALUES (8, 1, '<form action="/getquestions"><b>���� 1. ������ 9.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="9" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 8 ��������.<br />
#             �������� �������� �� 7 ��������.');
#
# INSERT INTO testquestions VALUES (9, 1, '<form action="/getquestions"><b>���� 1. ������ 10.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="10" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 9 ��������.<br />
#             �������� �������� �� 6 ��������.');
#
# INSERT INTO testquestions VALUES (10, 1, '<form action="/getquestions"><b>���� 1. ������ 11.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="11" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 10 ��������.<br />
#             �������� �������� �� 5 ��������.');
#
# INSERT INTO testquestions VALUES (11, 1, '<form action="/getquestions"><b>���� 1. ������ 12.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="12" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 11 ��������.<br />
#             �������� �������� �� 4 ��������.');
#
# INSERT INTO testquestions VALUES (12, 1, '<form action="/getquestions"><b>���� 1. ������ 13.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="13" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 12 ��������.<br />
#             �������� �������� �� 3 ��������.');
#
# INSERT INTO testquestions VALUES (13, 1, '<form action="/getquestions"><b>���� 1. ������ 14.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="14" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 13 ��������.<br />
#             �������� �������� �� 2 ��������.');
#
# INSERT INTO testquestions VALUES (14, 1, '<form action="/result"><b>���� 1. ������ 15.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="15" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 14 ��������.<br />
#             �������� �������� �� 1 ��������.');
#
# INSERT INTO testquestions VALUES (15, 2, '<form action="/getquestions"><b>���� 2. ������ 1.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="1" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 0 ��������.<br />
#             �������� �������� �� 15 ��������.');
#
# INSERT INTO testquestions VALUES (16, 2, '<form action="/getquestions"><b>���� 2. ������ 2.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="2" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 1 ������.<br />
#             �������� �������� �� 14 �������.');
#
# INSERT INTO testquestions VALUES (17, 2, '<form action="/getquestions"><b>���� 2. ������ 3.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="3" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 2 �������.<br />
#             �������� �������� �� 13 �������.');
#
# INSERT INTO testquestions VALUES (18, 2, '<form action="/getquestions"><b>���� 2. ������ 4.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="4" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 3 �������.<br />
#             �������� �������� �� 12 �������.');
#
# INSERT INTO testquestions VALUES (19, 2, '<form action="/getquestions"><b>���� 2. ������ 5.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="5" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 4 �������.<br />
#             �������� �������� �� 11 ������.');
#
# INSERT INTO testquestions VALUES (20, 2, '<form action="/getquestions"><b>���� 2. ������ 6.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="6" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 5 ��������.<br />
#             �������� �������� �� 10 ��������.');
#
# INSERT INTO testquestions VALUES (21, 2, '<form action="/getquestions"><b>���� 2. ������ 7.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="7" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 6 ��������.<br />
#             �������� �������� �� 9 ��������.');
#
# INSERT INTO testquestions VALUES (22, 2, '<form action="/getquestions"><b>���� 2. ������ 8.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="8" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 7 ��������.<br />
#             �������� �������� �� 8 ��������.');
#
# INSERT INTO testquestions VALUES (23, 2, '<form action="/getquestions"><b>���� 2. ������ 9.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="9" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 8 ��������.<br />
#             �������� �������� �� 7 ��������.');
#
# INSERT INTO testquestions VALUES (24, 2, '<form action="/getquestions"><b>���� 2. ������ 10.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="10" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 9 ��������.<br />
#             �������� �������� �� 6 ��������.');
#
# INSERT INTO testquestions VALUES (25, 2, '<form action="/getquestions"><b>���� 2. ������ 11.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="11" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 10 ��������.<br />
#             �������� �������� �� 5 ��������.');
#
# INSERT INTO testquestions VALUES (26, 2, '<form action="/getquestions"><b>���� 2. ������ 12.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="12" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 11 ��������.<br />
#             �������� �������� �� 4 ��������.');
#
# INSERT INTO testquestions VALUES (27, 2, '<form action="/getquestions"><b>���� 2. ������ 13.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="13" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 12 ��������.<br />
#             �������� �������� �� 3 ��������.');
#
# INSERT INTO testquestions VALUES (28, 2, '<form action="/getquestions"><b>���� 2. ������ 14.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="14" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 13 ��������.<br />
#             �������� �������� �� 2 ��������.');
#
# INSERT INTO testquestions VALUES (29, 2, '<form action="/result"><b>���� 2. ������ 15.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="15" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 14 ��������.<br />
#             �������� �������� �� 1 ��������.');
#
# INSERT INTO testquestions VALUES (30, 3, '<form action="/getquestions"><b>���� 3. ������ 1.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="1" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 0 ��������.<br />
#             �������� �������� �� 15 ��������.');
#
# INSERT INTO testquestions VALUES (31, 3, '<form action="/getquestions"><b>���� 3. ������ 2.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="2" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 1 ������.<br />
#             �������� �������� �� 14 �������.');
#
# INSERT INTO testquestions VALUES (32, 3, '<form action="/getquestions"><b>���� 3. ������ 3.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="3" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 2 �������.<br />
#             �������� �������� �� 13 �������.');
#
# INSERT INTO testquestions VALUES (33, 3, '<form action="/getquestions"><b>���� 3. ������ 4.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="4" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 3 �������.<br />
#             �������� �������� �� 12 �������.');
#
# INSERT INTO testquestions VALUES (34, 3, '<form action="/getquestions"><b>���� 3. ������ 5.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="5" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 4 �������.<br />
#             �������� �������� �� 11 ������.');
#
# INSERT INTO testquestions VALUES (35, 3, '<form action="/getquestions"><b>���� 3. ������ 6.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="6" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 5 ��������.<br />
#             �������� �������� �� 10 ��������.');
#
# INSERT INTO testquestions VALUES (36, 3, '<form action="/getquestions"><b>���� 3. ������ 7.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="7" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 6 ��������.<br />
#             �������� �������� �� 9 ��������.');
#
# INSERT INTO testquestions VALUES (37, 3, '<form action="/getquestions"><b>���� 3. ������ 8.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="8" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 7 ��������.<br />
#             �������� �������� �� 8 ��������.');
#
# INSERT INTO testquestions VALUES (38, 3, '<form action="/getquestions"><b>���� 3. ������ 9.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="9" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 8 ��������.<br />
#             �������� �������� �� 7 ��������.');
#
# INSERT INTO testquestions VALUES (39, 3, '<form action="/getquestions"><b>���� 3. ������ 10.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="10" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 9 ��������.<br />
#             �������� �������� �� 6 ��������.');
#
# INSERT INTO testquestions VALUES (40, 3, '<form action="/getquestions"><b>���� 3. ������ 11.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="11" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 10 ��������.<br />
#             �������� �������� �� 5 ��������.');
#
# INSERT INTO testquestions VALUES (41, 3, '<form action="/getquestions"><b>���� 3. ������ 12.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="12" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 11 ��������.<br />
#             �������� �������� �� 4 ��������.');
#
# INSERT INTO testquestions VALUES (42, 3, '<form action="/getquestions"><b>���� 3. ������ 13.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="13" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 12 ��������.<br />
#             �������� �������� �� 3 ��������.');
#
# INSERT INTO testquestions VALUES (43, 3, '<form action="/getquestions"><b>���� 3. ������ 14.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="14" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 13 ��������.<br />
#             �������� �������� �� 2 ��������.');
#
# INSERT INTO testquestions VALUES (44, 3, '<form action="/result"><b>���� 3. ������ 15.</b><br />
#             <input type="radio" name="answer" value="1"> ������ �������<br />
#             <input type="radio" name="answer" value="2"> ������ �������<br />
#             <input type="radio" name="answer" value="3"> ������ �������<br />
#             <input type="hidden" name="qNumber" value="15" />
#             <input type="submit" name="button" value="��������� ������" /><br /></form>
#             �������� �� 14 ��������.<br />
#             �������� �������� �� 1 ��������.');