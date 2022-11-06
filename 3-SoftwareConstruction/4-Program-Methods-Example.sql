/* Методи класу Architectural_project */
-- DROP TYPE Architectural_project FORCE;
CREATE OR REPLACE TYPE BODY Architectural_project AS 
    /* конструктор екземплярів об'єктів класів.
    	Вхідні параметри:
	    1) project_name - дослід експерименту
	   умова 1) якщо в таблиці Architectural_project вже існує вказана назва,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Architectural_project створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    CONSTRUCTOR FUNCTION Architectural_project(p_project_name VARCHAR) 
        RETURN SELF AS RESULT
    IS
        v_architectural_p_id Architectural_project.architectural_project_id%TYPE;
    BEGIN
        SELECT v_architectural_p_id INTO v_architectural_p_id
        FROM Architectural_project
        WHERE 
        project_name = p_project_name;
        SELF.architectural_project_id := v_architectural_p_id;
        SELF.project_name := p_project_name;
        RETURN;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        INSERT INTO Architectural_project (project_name)
            VALUES (p_project_name)
        RETURNING architectural_project_id INTO v_architectural_p_id;
        SELF.architectural_project_id := v_architectural_p_id;
        SELF.project_name := p_project_name;
        RETURN;
    END Architectural_project;
    
    /* Процедура зміни значень атрибутів */
	      MEMBER PROCEDURE regulateArchitecturalProject(p_architectural_project_id INT,p_project_name VARCHAR)
	      IS
	      BEGIN
        UPDATE Architectural_project SET project_name = p_project_name
		      WHERE architectural_project_id = p_id_architectural_project_id;
		      SELF.project_name := p_project_name;
	      END regulateArchitecturalProject;
	      
	/* Функції отримання значень атрибутів */
	      /* get_architectural_project_id */
        MEMBER FUNCTION get_iarchitectural_project_id
	        RETURN INT 
	      IS
        BEGIN
          RETURN SELF.architectural_project_id;
        END get_architectural_project_id;
        
        /* get_project_name */
        MEMBER FUNCTION get_project_name
	        RETURN NUMBER 
	      IS
        BEGIN
          RETURN SELF.project_name;
        END get_project_name;

        /* Процедура виводу на екран значень атрибутів */
        MEMBER PROCEDURE display 
        IS
        BEGIN 
          dbms_output.put_line('architectural_project_id: ' || architectural_project_id);
          dbms_output.put_line('project_name: ' || project_name);
        END display;
END; 
/
