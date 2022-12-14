drop table administrators CASCADE;
drop table users CASCADE;
drop table articles CASCADE;
drop table subscriptions CASCADE;
drop table user_lists CASCADE;
drop table architectural_projects CASCADE;


CREATE TABLE administrators(
	administrator_id INT PRIMARY KEY,
	administrators_name VARCHAR,
	surname VARCHAR
);

CREATE TABLE users(
	user_id INT PRIMARY KEY,
	user_name VARCHAR,
	surname VARCHAR,
	email VARCHAR CHECK(email ~* '^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
);

CREATE TABLE articles(
	article_id INT PRIMARY KEY,
	title VARCHAR,
	author VARCHAR
);

CREATE TABLE subscriptions(
	subscription_id INT PRIMARY KEY,
	user_id INT REFERENCES users(user_id),
	name VARCHAR,
	price DECIMAL(10, 2)
);

CREATE TABLE user_lists(
	article_id INT REFERENCES articles(article_id),
	subscription_id INT REFERENCES subscriptions(subscription_id),
	PRIMARY KEY(article_id_id, subscription_id)
);

CREATE TABLE architectural_projects(
	architectural_project_id INT PRIMARY KEY,
	project_name VARCHAR,
	description VARCHAR,
	project_image bytea,
	author VARCHAR,
	administrator_id INT REFERENCES administrators(administrator_id),
	user_id INT REFERENCES users(user_id)
);

