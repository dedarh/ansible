CREATE TABLE question (
	i_question INTEGER NOT NULL,
	question_name STRING(20) NULL,
	type STRING(20) NULL,
	CONSTRAINT "primary" PRIMARY KEY (i_question ASC),
	FAMILY "primary" (i_question, question_name, type)
);

CREATE TABLE answer (
	i_answer INT NOT NULL,
	i_question INT NOT NULL,
	correct INT NOT NULL,
	text STRING(255) NULL,
	CONSTRAINT "primary" PRIMARY KEY (i_answer ASC),
	CONSTRAINT fk_i_question_ref_question FOREIGN KEY (i_question) REFERENCES question (i_question),
	INDEX answer_auto_index_fk_i_question_ref_question (i_question ASC),
	FAMILY "primary" (i_answer, i_question, correct, text)
);

CREATE TABLE suggestions (
	id INT NOT NULL,
	login STRING(100) NULL,
	state INT NULL,
	status INT NULL,
	CONSTRAINT "primary" PRIMARY KEY (id ASC),
	FAMILY "primary" (id, login, state, status)
);

CREATE TABLE test_name (
	i_test INT NOT NULL,
	"name" STRING(20) NULL,
	CONSTRAINT "primary" PRIMARY KEY (i_test ASC),
	FAMILY "primary" (i_test, "name")
);

CREATE TABLE test_question (
	i INT NOT NULL,
	i_test INT NOT NULL,
	i_question INT NOT NULL,
	CONSTRAINT "primary" PRIMARY KEY (i ASC),
	CONSTRAINT fk_i_test_ref_test_name FOREIGN KEY (i_test) REFERENCES test_name (i_test),
	INDEX test_question_auto_index_fk_i_test_ref_test_name (i_test ASC),
	CONSTRAINT fk_i_question_ref_question FOREIGN KEY (i_question) REFERENCES question (i_question),
	INDEX test_question_auto_index_fk_i_question_ref_question (i_question ASC),
	FAMILY "primary" (i, i_test, i_question)
);

CREATE TABLE users (
	id_user INT NOT NULL,
	login STRING(20) NULL,
	password STRING(255) NOT NULL,
	permission STRING(255) NULL,
	firstname STRING(255) NULL,
	lastname STRING(255) NULL,
	CONSTRAINT "primary" PRIMARY KEY (id_user ASC),
	FAMILY "primary" (id_user, login, password, permission, firstname, lastname)
);

CREATE TABLE user_answer (
	id INT NOT NULL,
	id_user INT NOT NULL,
	id_test INT NOT NULL,
	answer_temp STRING(255) NULL,
	state STRING NULL,
	CONSTRAINT "primary" PRIMARY KEY (id ASC),
	CONSTRAINT fk_id_user_ref_users FOREIGN KEY (id_user) REFERENCES users (id_user),
	INDEX user_answer_auto_index_fk_id_user_ref_users (id_user ASC),
	CONSTRAINT fk_id_test_ref_test_name FOREIGN KEY (id_test) REFERENCES test_name (i_test),
	INDEX user_answer_auto_index_fk_id_test_ref_test_name (id_test ASC),
	FAMILY "primary" (id, id_user, id_test, answer_temp, state)
);

INSERT INTO question (i_question, question_name, type) VALUES
	(1, 'quesst1', '1'),
	(2, 'quesst2', '1'),
	(3, e'\u0422\u0435\u043A\u0441\u0442\u043E\u0432\u044B\u0439 \u0432\u043E\u043F\u0440\u043E\u0441', '0'),
	(4, e'\u0427\u0442\u043E \u0431', '1'),
	(5, 'dsadsadasdasd', '1');

INSERT INTO answer (i_answer, i_question, correct, text) VALUES
	(1, 1, 0, 'test text'),
	(2, 1, 1, 'test text'),
	(3, 1, 1, 'test text'),
	(4, 2, 1, 'answer or question 2'),
	(5, 2, 0, 'wrong answer or question 2'),
	(6, 3, 1, e'\u043A\u0443\u0440\u0438\u0446\u0430-\u044F\u0439\u0446\u043E'),
	(7, 3, 0, e'\u044F\u0439\u0446\u043E'),
	(8, 3, 0, e'\u043A\u0443\u0440\u0438\u0446\u0430');

INSERT INTO suggestions (id, login, state, status) VALUES
	(1, 'dedarh', 0, 0),
	(2, 'dedarh', 0, 0),
	(3, 'dedarh', 0, 0),
	(4, 'dedarh', 0, 0),
	(5, 'dedarh', 0, 0),
	(6, 'dedarh', 0, 0),
	(7, 'dedarh', 0, 0),
	(8, 'dedarh', 0, 0);

INSERT INTO test_name (i_test, "name") VALUES
	(1, 'first test'),
	(2, 'second test'),
	(3, 'CCNA1 v6.0'),
	(4, 'CCNA1 v6.1'),
	(5, 'Test');

INSERT INTO test_question (i, i_test, i_question) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 3, 1),
	(4, 4, 1),
	(5, 4, 2),
	(6, 5, 3);

INSERT INTO users (id_user, login, password, permission, firstname, lastname) VALUES
	(1, 'dedarh', 'abe7931f8bad8f2852e6c0e8787f6cc01a8cdcf207b0edad2ac5134f4ffbda42', 'admin', 'Polinsky', 'Artem');

INSERT INTO user_answer (id, id_user, id_test, answer_temp, state) VALUES
	(1, 1, 1, '{"countCorrect":1,"countWrong":1}', NULL),
	(2, 1, 1, '{"countCorrect":2,"countWrong":0}', NULL),
	(3, 1, 1, '{"countCorrect":1,"countWrong":1}', NULL),
	(4, 1, 1, '{"countCorrect":1,"countWrong":1}', NULL),
	(5, 1, 1, '{"countCorrect":1,"countWrong":1}', NULL),
	(6, 1, 1, '{"countCorrect":1,"countWrong":1}', NULL),
	(7, 1, 1, '{"countCorrect":1,"countWrong":1}', NULL),
	(8, 1, 1, '{"countCorrect":0,"countWrong":0}', NULL),
	(9, 1, 1, '{"countCorrect":2,"countWrong":1}', NULL),
	(10, 1, 1, '{"countCorrect":1,"countWrong":1}', NULL),
	(11, 1, 1, '{"countCorrect":2,"countWrong":1}', NULL),
	(12, 1, 1, '{"countCorrect":2,"countWrong":1}', NULL),
	(13, 1, 1, '{"countCorrect":1,"countWrong":1}', NULL),
	(14, 1, 1, '{"countCorrect":1,"countWrong":1}', NULL),
	(15, 1, 1, '{"countCorrect":3,"countWrong":2}', NULL),
	(16, 1, 1, '{"countCorrect":1,"countWrong":1}', NULL),
	(17, 1, 1, '{"countCorrect":3,"countWrong":2}', NULL),
	(18, 1, 1, '{"countCorrect":2,"countWrong":2}', NULL),
	(19, 1, 2, '{"countCorrect":0,"countWrong":0}', NULL),
	(20, 1, 1, '{"countCorrect":3,"countWrong":2}', NULL),
	(21, 1, 1, '{"countCorrect":3,"countWrong":2}', NULL),
	(22, 1, 1, '{"countCorrect":3,"countWrong":2}', NULL),
	(23, 1, 1, '{"countCorrect":3,"countWrong":2}', 'Failed test'),
	(24, 1, 1, '{"countCorrect":1,"countWrong":0}', 'Completed test'),
	(25, 1, 1, '{"countCorrect":2,"countWrong":1}', 'Failed test'),
	(26, 1, 1, '{"countCorrect":2,"countWrong":1}', 'Failed test'),
	(27, 1, 1, '{"countCorrect":2,"countWrong":0}', 'Completed test'),
	(28, 1, 1, '{"countCorrect":1,"countWrong":1}', 'Failed test'),
	(29, 1, 1, '{"countCorrect":1,"countWrong":1}', 'Failed test'),
	(30, 1, 1, '{"countCorrect":2,"countWrong":0}', 'Completed test'),
	(31, 1, 1, '{"countCorrect":2,"countWrong":0}', 'Completed test'),
	(32, 1, 1, '{"countCorrect":2,"countWrong":0}', 'Completed test'),
	(33, 1, 1, '{"countCorrect":2,"countWrong":1}', 'Failed test'),
	(34, 1, 1, '{"countCorrect":2,"countWrong":2}', 'Failed test'),
	(35, 1, 1, '{"countCorrect":2,"countWrong":0}', 'Completed test'),
	(36, 1, 1, '{"countCorrect":1,"countWrong":1}', 'Failed test'),
	(37, 1, 1, '{"countCorrect":3,"countWrong":2}', 'Failed test'),
	(38, 1, 1, '{"countCorrect":2,"countWrong":0}', 'Completed test'),
	(39, 1, 1, '{"countCorrect":0,"countWrong":2}', 'Failed test'),
	(40, 1, 1, '{"countCorrect":3,"countWrong":2}', 'Failed test'),
	(41, 1, 1, '{"countCorrect":1,"countWrong":1}', 'Failed test'),
	(42, 1, 1, '{"countCorrect":0,"countWrong":0}', 'Failed test'),
	(43, 1, 1, '{"countCorrect":2,"countWrong":2}', 'Failed test'),
	(44, 1, 1, '{"countCorrect":2,"countWrong":0}', 'Completed test'),
	(45, 1, 2, '{"countCorrect":0,"countWrong":0}', 'Failed test');
