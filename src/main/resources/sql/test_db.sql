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
  `mark`        INT(5)           DEFAULT NULL,
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
