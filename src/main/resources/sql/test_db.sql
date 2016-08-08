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
# VALUES (1, 'Первый тест', DATE_FORMAT(current_date, '%d.%c.%Y %T'), DATE_FORMAT(current_date, '%d.%c.%Y %T'));
# INSERT INTO tests
# VALUES (2, 'Второй тест', DATE_FORMAT(current_date, '%d.%c.%Y %T'), DATE_FORMAT(current_date, '%d.%c.%Y %T'));
# INSERT INTO tests
# VALUES (3, 'Третий тест', DATE_FORMAT(current_date, '%d.%c.%Y %T'), DATE_FORMAT(current_date, '%d.%c.%Y %T'));
#
# INSERT INTO testquestions VALUES (0, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 1.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="1" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 0 вопросов.<br />
#             Осталось ответить на 15 вопросов.');
#
# INSERT INTO testquestions VALUES (1, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 2.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="2" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 1 вопрос.<br />
#             Осталось ответить на 14 вопроса.');
#
# INSERT INTO testquestions VALUES (2, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 3.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="3" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 2 вопроса.<br />
#             Осталось ответить на 13 вопроса.');
#
# INSERT INTO testquestions VALUES (3, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 4.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="4" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 3 вопроса.<br />
#             Осталось ответить на 12 вопроса.');
#
# INSERT INTO testquestions VALUES (4, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 5.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="5" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 4 вопроса.<br />
#             Осталось ответить на 11 вопрос.');
#
# INSERT INTO testquestions VALUES (5, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 6.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="6" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 5 вопросов.<br />
#             Осталось ответить на 10 вопросов.');
#
# INSERT INTO testquestions VALUES (6, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 7.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="7" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 6 вопросов.<br />
#             Осталось ответить на 9 вопросов.');
#
# INSERT INTO testquestions VALUES (7, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 8.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="8" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 7 вопросов.<br />
#             Осталось ответить на 8 вопросов.');
#
# INSERT INTO testquestions VALUES (8, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 9.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="9" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 8 вопросов.<br />
#             Осталось ответить на 7 вопросов.');
#
# INSERT INTO testquestions VALUES (9, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 10.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="10" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 9 вопросов.<br />
#             Осталось ответить на 6 вопросов.');
#
# INSERT INTO testquestions VALUES (10, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 11.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="11" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 10 вопросов.<br />
#             Осталось ответить на 5 вопросов.');
#
# INSERT INTO testquestions VALUES (11, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 12.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="12" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 11 вопросов.<br />
#             Осталось ответить на 4 вопросов.');
#
# INSERT INTO testquestions VALUES (12, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 13.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="13" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 12 вопросов.<br />
#             Осталось ответить на 3 вопросов.');
#
# INSERT INTO testquestions VALUES (13, 1, '<form action="/getquestions"><b>Тест 1. Вопрос 14.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="14" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 13 вопросов.<br />
#             Осталось ответить на 2 вопросов.');
#
# INSERT INTO testquestions VALUES (14, 1, '<form action="/result"><b>Тест 1. Вопрос 15.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="15" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 14 вопросов.<br />
#             Осталось ответить на 1 вопросов.');
#
# INSERT INTO testquestions VALUES (15, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 1.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="1" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 0 вопросов.<br />
#             Осталось ответить на 15 вопросов.');
#
# INSERT INTO testquestions VALUES (16, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 2.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="2" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 1 вопрос.<br />
#             Осталось ответить на 14 вопроса.');
#
# INSERT INTO testquestions VALUES (17, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 3.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="3" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 2 вопроса.<br />
#             Осталось ответить на 13 вопроса.');
#
# INSERT INTO testquestions VALUES (18, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 4.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="4" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 3 вопроса.<br />
#             Осталось ответить на 12 вопроса.');
#
# INSERT INTO testquestions VALUES (19, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 5.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="5" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 4 вопроса.<br />
#             Осталось ответить на 11 вопрос.');
#
# INSERT INTO testquestions VALUES (20, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 6.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="6" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 5 вопросов.<br />
#             Осталось ответить на 10 вопросов.');
#
# INSERT INTO testquestions VALUES (21, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 7.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="7" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 6 вопросов.<br />
#             Осталось ответить на 9 вопросов.');
#
# INSERT INTO testquestions VALUES (22, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 8.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="8" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 7 вопросов.<br />
#             Осталось ответить на 8 вопросов.');
#
# INSERT INTO testquestions VALUES (23, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 9.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="9" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 8 вопросов.<br />
#             Осталось ответить на 7 вопросов.');
#
# INSERT INTO testquestions VALUES (24, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 10.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="10" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 9 вопросов.<br />
#             Осталось ответить на 6 вопросов.');
#
# INSERT INTO testquestions VALUES (25, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 11.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="11" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 10 вопросов.<br />
#             Осталось ответить на 5 вопросов.');
#
# INSERT INTO testquestions VALUES (26, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 12.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="12" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 11 вопросов.<br />
#             Осталось ответить на 4 вопросов.');
#
# INSERT INTO testquestions VALUES (27, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 13.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="13" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 12 вопросов.<br />
#             Осталось ответить на 3 вопросов.');
#
# INSERT INTO testquestions VALUES (28, 2, '<form action="/getquestions"><b>Тест 2. Вопрос 14.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="14" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 13 вопросов.<br />
#             Осталось ответить на 2 вопросов.');
#
# INSERT INTO testquestions VALUES (29, 2, '<form action="/result"><b>Тест 2. Вопрос 15.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="15" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 14 вопросов.<br />
#             Осталось ответить на 1 вопросов.');
#
# INSERT INTO testquestions VALUES (30, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 1.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="1" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 0 вопросов.<br />
#             Осталось ответить на 15 вопросов.');
#
# INSERT INTO testquestions VALUES (31, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 2.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="2" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 1 вопрос.<br />
#             Осталось ответить на 14 вопроса.');
#
# INSERT INTO testquestions VALUES (32, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 3.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="3" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 2 вопроса.<br />
#             Осталось ответить на 13 вопроса.');
#
# INSERT INTO testquestions VALUES (33, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 4.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="4" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 3 вопроса.<br />
#             Осталось ответить на 12 вопроса.');
#
# INSERT INTO testquestions VALUES (34, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 5.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="5" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 4 вопроса.<br />
#             Осталось ответить на 11 вопрос.');
#
# INSERT INTO testquestions VALUES (35, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 6.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="6" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 5 вопросов.<br />
#             Осталось ответить на 10 вопросов.');
#
# INSERT INTO testquestions VALUES (36, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 7.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="7" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 6 вопросов.<br />
#             Осталось ответить на 9 вопросов.');
#
# INSERT INTO testquestions VALUES (37, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 8.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="8" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 7 вопросов.<br />
#             Осталось ответить на 8 вопросов.');
#
# INSERT INTO testquestions VALUES (38, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 9.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="9" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 8 вопросов.<br />
#             Осталось ответить на 7 вопросов.');
#
# INSERT INTO testquestions VALUES (39, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 10.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="10" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 9 вопросов.<br />
#             Осталось ответить на 6 вопросов.');
#
# INSERT INTO testquestions VALUES (40, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 11.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="11" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 10 вопросов.<br />
#             Осталось ответить на 5 вопросов.');
#
# INSERT INTO testquestions VALUES (41, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 12.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="12" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 11 вопросов.<br />
#             Осталось ответить на 4 вопросов.');
#
# INSERT INTO testquestions VALUES (42, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 13.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="13" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 12 вопросов.<br />
#             Осталось ответить на 3 вопросов.');
#
# INSERT INTO testquestions VALUES (43, 3, '<form action="/getquestions"><b>Тест 3. Вопрос 14.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="14" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 13 вопросов.<br />
#             Осталось ответить на 2 вопросов.');
#
# INSERT INTO testquestions VALUES (44, 3, '<form action="/result"><b>Тест 3. Вопрос 15.</b><br />
#             <input type="radio" name="answer" value="1"> Первый вариант<br />
#             <input type="radio" name="answer" value="2"> Второй вариант<br />
#             <input type="radio" name="answer" value="3"> Третий вариант<br />
#             <input type="hidden" name="qNumber" value="15" />
#             <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
#             Отвечено на 14 вопросов.<br />
#             Осталось ответить на 1 вопросов.');