drop table administrators CASCADE;
drop table users CASCADE;
drop table articles CASCADE;
drop table subscriptions CASCADE;
drop table user_lists CASCADE;
drop table architectural_projects CASCADE;


CREATE TABLE administrators(
	administrator_id NUMBER(4),
	administrators_name VARCHAR(30),
	surname VARCHAR(30)
);

ALTER TABLE administrators ADD CONSTRAINT administrator_pk
	PRIMARY KEY (administrator_id);

CREATE TABLE users(
	user_id NUMBER(10),
	user_name VARCHAR(30),
	surname VARCHAR(30),
	email VARCHAR(30)
);

ALTER TABLE users ADD CONSTRAINT user_pk
	PRIMARY KEY (user_id);

ALTER TABLE users ADD CONSTRAINT email_template
    CHECK (regexp_like(email, 
	           '^([a-z0-9][a-z0-9._-]*@[a-z][a-z0-9._-]*\.[a-z]{2,4})$'));

CREATE TABLE articles(
	article_id NUMBER(10),
	title VARCHAR(50),
	author VARCHAR(60)
);

ALTER TABLE articles ADD CONSTRAINT article_pk
	PRIMARY KEY (article_id);

CREATE TABLE subscriptions(
	subscription_id NUMBER(4),
	user_id INT NUMBER(10),
	name VARCHAR(30),
	price NUMBER(10, 2)
);

ALTER TABLE subscriptions ADD CONSTRAINT subscription_pk
	PRIMARY KEY (subscription_id);

ALTER TABLE subscriptions ADD CONSTRAINT subscription_user_id_fk
	FOREIGN KEY (user_id)
	REFERENCES users (user_id);

CREATE TABLE user_lists(
	article_id NUMBER(4),
	subscription_id NUMBER(4),
);

ALTER TABLE user_lists ADD CONSTRAINT article_id_fk
	FOREIGN KEY (article_id)
	REFERENCES articles (article_id);

ALTER TABLE user_lists ADD CONSTRAINT subscription_id_fk
	FOREIGN KEY (subscription_id)
	REFERENCES subscriptions (subscription_id);

CREATE TABLE architectural_projects(
	architectural_project_id NUMBER(4),
	project_name VARCHAR(50),
	description VARCHAR(3000),
	project_image bytea,
	author VARCHAR(50),
	administrator_id NUMBER(10)
	user_id NUMBER(10)
);

ALTER TABLE architectural_projects ADD CONSTRAINT architectural_project_id_pk
	PRIMARY KEY (architectural_project_id);

ALTER TABLE architectural_projects ADD CONSTRAINT administrator_id_fk
	FOREIGN KEY (administrator_id)
	REFERENCES administrators (administrator_id);

ALTER TABLE architectural_projects ADD CONSTRAINT user_id_fk
	FOREIGN KEY (user_id)
	REFERENCES users (user_id);
