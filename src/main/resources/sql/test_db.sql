DROP TABLE IF EXISTS `tests`;

CREATE TABLE IF NOT EXISTS `tests` (
    `id` int(11) NOT NULL,
    `name` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `questions`;

CREATE TABLE IF NOT EXISTS `questions` (
    `id` int(11) NOT NULL,
    `id_tests` int(11) NOT NULL,
    `name` varchar(1000) DEFAULT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT FK_TESTS FOREIGN KEY (`id_tests`) REFERENCES `tests`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `result`;

CREATE TABLE IF NOT EXISTS `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_questions` int(11) NOT NULL,
  `login` VARCHAR(55) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_QUESTIONS FOREIGN KEY (`id_questions`) REFERENCES `questions`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO tests VALUES (1, 'Первый тест');
INSERT INTO tests VALUES (2, 'Второй тест');
INSERT INTO tests VALUES (3, 'Третий тест');

INSERT INTO questions VALUES (0, 1, '<form action="/getquestions.form"><b>Тест 1. Вопрос 1.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="1" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 0 вопросов.<br />
            Осталось ответить на 5 вопросов.');

INSERT INTO questions VALUES (1, 1, '<form action="/getquestions.form"><b>Тест 1. Вопрос 2.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="2" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 1 вопрос.<br />
            Осталось ответить на 4 вопроса.');

INSERT INTO questions VALUES (2, 1, '<form action="/getquestions.form"><b>Тест 1. Вопрос 3.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="3" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 2 вопроса.<br />
            Осталось ответить на 3 вопроса.');

INSERT INTO questions VALUES (3, 1, '<form action="/getquestions.form"><b>Тест 1. Вопрос 4.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="4" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 3 вопроса.<br />
            Осталось ответить на 2 вопроса.');

INSERT INTO questions VALUES (4, 1, '<form action="/result.form"><b>Тест 1. Вопрос 5.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="5" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 4 вопроса.<br />
            Осталось ответить на 1 вопрос.');


INSERT INTO questions VALUES (5, 2, '<form action="/getquestions.form"><b>Тест 2. Вопрос 1.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="1" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 0 вопросов.<br />
            Осталось ответить на 5 вопросов.');

INSERT INTO questions VALUES (6, 2, '<form action="/getquestions.form"><b>Тест 2. Вопрос 2.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="2" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 1 вопрос.<br />
            Осталось ответить на 4 вопроса.');

INSERT INTO questions VALUES (7, 2, '<form action="/getquestions.form"><b>Тест 2. Вопрос 3.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="3" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 2 вопроса.<br />
            Осталось ответить на 3 вопроса.');

INSERT INTO questions VALUES (8, 2, '<form action="/getquestions.form"><b>Тест 2. Вопрос 4.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="4" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 3 вопроса.<br />
            Осталось ответить на 2 вопроса.');

INSERT INTO questions VALUES (9, 2, '<form action="/result.form"><b>Тест 2. Вопрос 5.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="5" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 4 вопроса.<br />
            Осталось ответить на 1 вопрос.');


INSERT INTO questions VALUES (10, 3, '<form action="/getquestions.form"><b>Тест 3. Вопрос 1.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="1" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 0 вопросов.<br />
            Осталось ответить на 5 вопросов.');

INSERT INTO questions VALUES (11, 3, '<form action="/getquestions.form"><b>Тест 3. Вопрос 2.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="2" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 1 вопрос.<br />
            Осталось ответить на 4 вопроса.');

INSERT INTO questions VALUES (12, 3, '<form action="/getquestions.form"><b>Тест 3. Вопрос 3.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="3" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 2 вопроса.<br />
            Осталось ответить на 3 вопроса.');

INSERT INTO questions VALUES (13, 3, '<form action="/getquestions.form"><b>Тест 3. Вопрос 4.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="4" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 3 вопроса.<br />
            Осталось ответить на 2 вопроса.');

INSERT INTO questions VALUES (14, 3, '<form action="/result.form"><b>Тест 3. Вопрос 5.</b><br />
            <input type="radio" name="answer" value="one"> Первый вариант<br />
            <input type="radio" name="answer" value="two"> Второй вариант<br />
            <input type="radio" name="answer" value="three"> Третий вариант<br />
            <input type="hidden" name="qNumber" value="5" />
            <input type="submit" name="button" value="Следующий вопрос" /><br /></form>
            Отвечено на 4 вопроса.<br />
            Осталось ответить на 1 вопрос.');

