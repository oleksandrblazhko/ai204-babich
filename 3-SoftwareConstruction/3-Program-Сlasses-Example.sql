/* Створення об'єктного типу (класу) User */
CREATE OR REPLACE TYPE User AS OBJECT (

	user_id NUBMER(4), --N користувача
	user_name VARCHAR(30), -- ім'я користувача
	surname VARCHAR(30), -- призвище користувача
  email VARCHAR CHECK(email ~* '^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'), -- пошта користувача
  NOT FINAL MEMBER PROCEDURE display
) NOT FINAL 
/

/* Cтворення об'єктного типу (класу) Administator, що успадковує об'єктний тип User */
CREATE OR REPLACE TYPE Administator UNDER User (
  administrator_id NUMBER(4), -- N адміністратора
	administrators_name VARCHAR(30), --ім'я адміністратора 
	surname VARCHAR(30) -- призвище адміністратора
	/* перевизначення методу-процедури класу User */
    	OVERRIDING MEMBER PROCEDURE display 
);
/

/* Створення типу для зберігання списку адіністраторів - "Колекція екземплярів об`єктів класу Administrator */
CREATE TYPE Administrator_List IS TABLE OF Administrator;
/



/* Створення об'єктного типу (клас) Article */
-- DROP TYPE Article FORCE;
CREATE OR REPLACE TYPE Article AS OBJECT (
	article_id NUMBER(10), -- N статі
	title VARCHAR(70), -- назва статті
	author VARCHAR(70) -- автор статті
    	/* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) title - дата прогнозу погоди
	   умова 1) якщо в таблиці Article вже існує вказана назва,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Article створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION Article(title VARCHAR)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_title(p_title_id NUMBER, p_title VARCHAR),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_title_id RETURN NUMBER,
		MEMBER FUNCTION get_title RETURN VARCHAR,
    	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/

/* Створення типу для зберігання списку статтей - "Колекція екземплярів об`єктів класу Article */
CREATE TYPE Article_List IS TABLE OF Article;
/
-- show errors;

/* Створення об'єктного типу (класу) Subscription */
CREATE OR REPLACE TYPE Subscription AS OBJECT (
	subscription_id NUMBER(5), -- N підпіски
	user_id INT NUMBER(5), -- N користувача
	name VARCHAR(60), -- назва підписки
	price DECIMAL(10, 2), -- ціна підписки
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/

/* Створення об'єктного типу (класу) Architectural_project */
CREATE OR REPLACE TYPE Architectural_project AS OBJECT (
  architectural_project_id NUMBER(10) ,
	project_name VARCHAR(60),
	description VARCHAR(2000),
	project_image bytea,
	author VARCHAR(60),
	administrator_id NUMBER(4),
	user_id NUMBER(4)
	/* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) project_name - дослід експерименту
	   умова 1) якщо в таблиці Architectural_project вже існує вказана назва,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Architectural_project створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION Architectural_project(p_project_name VARCHAR)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_project_name(p_architectural_project_id NUMBER, p_project_name VARCHAR),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_architectural_project_id RETURN NUMBER,
		MEMBER FUNCTION get_project_name RETURN VARCHAR,
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/

/* Створення типу для зберігання списку експериментів - "Колекція екземплярів об`єктів класу Architectural_project */
CREATE TYPE Architectural_project_List IS TABLE OF Architectural_project;
/

