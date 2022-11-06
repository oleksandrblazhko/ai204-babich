/* Приклади роботи з класом Architectural_project */
DECLARE
    ap1 Architectural_project;
BEGIN 
    ap1:= NEW Architectural_project(TO_PROJECT_NAME('Country villa'));
	    dbms_output.put_line('get architectural_project_id: ' || ap1.architectural_project_id);
	    dbms_output.put_line('get project_name: ' || ap1.project_name);
    ap1.display();
END;
/

/* Приклад роботи з класами Architectural_project, Subscription */
DECLARE 
    ap1 Architectural_project;
    su1 Subscription;
BEGIN 
    ap1:= NEW Architectural_project(TO_PROJECT_NAME('Country villa'));
    su1:= Subscription(15, '13', 'Economical', '200', ap1);
    su1.display();
END;
/

/* Приклад роботи з класами Architectural_project, Subscription, Article */
DECLARE 
   ap1 Architectural_project;
   su1 Subscription;
   ar1 Article;
BEGIN
    ap1:= NEW Architectural_project(TO_PROJECT_NAME('Country villa'));
    su1:= Subscription(15, '13', 'Economical', '200', ap1);
    ar1 := Air_humidity(10, 'Business', su1);
    ar1.display(); 
END;
/

/* Приклад роботи з класами Architectural_project, Subscription, Article, User */
DECLARE 
    ap1 Architectural_project;
    su1 Subscription;
    ar1 Article;
    us1 User;
    us2 User;
BEGIN 
    ap1:= NEW Architectural_project(TO_PROJECT_NAME('Country villa'));
    su1:= Subscription(15, '13', 'Economical', '200', ap1);
    ar1 := Air_humidity(10, 'Business', su1);
    us1 := User(35, 'Artem', 'Babich', 'artem.babich@gmail.com', su1, ar1);
    us2 := User(46, 'Nikita', 'Frolov', 'nikita.frolov@gmail.com', su2, ar2);
    us1.display(); 
    us2.display(); 
END;
/
