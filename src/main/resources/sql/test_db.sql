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




INSERT INTO tests VALUES (1, '������ ����');
INSERT INTO tests VALUES (2, '������ ����');
INSERT INTO tests VALUES (3, '������ ����');

INSERT INTO questions VALUES (0, 1, '<form action="/getquestions.form"><b>���� 1. ������ 1.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="1" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 0 ��������.<br />
            �������� �������� �� 5 ��������.');

INSERT INTO questions VALUES (1, 1, '<form action="/getquestions.form"><b>���� 1. ������ 2.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="2" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 1 ������.<br />
            �������� �������� �� 4 �������.');

INSERT INTO questions VALUES (2, 1, '<form action="/getquestions.form"><b>���� 1. ������ 3.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="3" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 2 �������.<br />
            �������� �������� �� 3 �������.');

INSERT INTO questions VALUES (3, 1, '<form action="/getquestions.form"><b>���� 1. ������ 4.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="4" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 3 �������.<br />
            �������� �������� �� 2 �������.');

INSERT INTO questions VALUES (4, 1, '<form action="/result.form"><b>���� 1. ������ 5.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="5" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 4 �������.<br />
            �������� �������� �� 1 ������.');


INSERT INTO questions VALUES (5, 2, '<form action="/getquestions.form"><b>���� 2. ������ 1.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="1" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 0 ��������.<br />
            �������� �������� �� 5 ��������.');

INSERT INTO questions VALUES (6, 2, '<form action="/getquestions.form"><b>���� 2. ������ 2.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="2" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 1 ������.<br />
            �������� �������� �� 4 �������.');

INSERT INTO questions VALUES (7, 2, '<form action="/getquestions.form"><b>���� 2. ������ 3.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="3" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 2 �������.<br />
            �������� �������� �� 3 �������.');

INSERT INTO questions VALUES (8, 2, '<form action="/getquestions.form"><b>���� 2. ������ 4.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="4" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 3 �������.<br />
            �������� �������� �� 2 �������.');

INSERT INTO questions VALUES (9, 2, '<form action="/result.form"><b>���� 2. ������ 5.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="5" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 4 �������.<br />
            �������� �������� �� 1 ������.');


INSERT INTO questions VALUES (10, 3, '<form action="/getquestions.form"><b>���� 3. ������ 1.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="1" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 0 ��������.<br />
            �������� �������� �� 5 ��������.');

INSERT INTO questions VALUES (11, 3, '<form action="/getquestions.form"><b>���� 3. ������ 2.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="2" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 1 ������.<br />
            �������� �������� �� 4 �������.');

INSERT INTO questions VALUES (12, 3, '<form action="/getquestions.form"><b>���� 3. ������ 3.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="3" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 2 �������.<br />
            �������� �������� �� 3 �������.');

INSERT INTO questions VALUES (13, 3, '<form action="/getquestions.form"><b>���� 3. ������ 4.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="4" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 3 �������.<br />
            �������� �������� �� 2 �������.');

INSERT INTO questions VALUES (14, 3, '<form action="/result.form"><b>���� 3. ������ 5.</b><br />
            <input type="radio" name="answer" value="one"> ������ �������<br />
            <input type="radio" name="answer" value="two"> ������ �������<br />
            <input type="radio" name="answer" value="three"> ������ �������<br />
            <input type="hidden" name="qNumber" value="5" />
            <input type="submit" name="button" value="��������� ������" /><br /></form>
            �������� �� 4 �������.<br />
            �������� �������� �� 1 ������.');

