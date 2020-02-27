CREATE OR REPLACE PROCEDURE teacher(fname text, lname text) AS
$$
BEGIN
    IF ( SELECT current_setting('transaction_isolation') != 'serializable') THEN
	    RAISE EXCEPTION 'This transaction needs to be run in serializable level';  
    END IF;
    INSERT INTO teachers (firstname, lastname) VALUES (fname, lname);
END
$$
    LANGUAGE 'plpgsql';
  
--CALL teacher('Henrik', 'Jakobsen');
--SELECT * FROM teachers;



CREATE OR REPLACE PROCEDURE courses(title text) AS
$$
BEGIN
    IF ( SELECT current_setting('transaction_isolation') != 'serializable') THEN
	    RAISE EXCEPTION 'This transaction needs to be run in serializable level';  
    END IF;
    INSERT INTO courses (title) VALUES (title);
END
$$
    LANGUAGE 'plpgsql';

--CALL courses('Matematik')
--SELECT * FROM courses


CREATE OR REPLACE PROCEDURE teacherteam(ttID int) AS
$$
BEGIN
    IF ( SELECT current_setting('transaction_isolation') != 'serializable') THEN
	    RAISE EXCEPTION 'This transaction needs to be run in serializable level';  
    END IF;
    INSERT INTO teacherteams (teacherteamID) VALUES (ttid);
END
$$
    LANGUAGE 'plpgsql';

--CALL teacherteam(1)
--SELECT * FROM teacherteams


CREATE OR REPLACE PROCEDURE student(fname text, lname text) AS
$$
BEGIN
    IF ( SELECT current_setting('transaction_isolation') != 'serializable') THEN
	    RAISE EXCEPTION 'This transaction needs to be run in serializable level';  
    END IF;
    INSERT INTO students (firstname, lastname) VALUES (fname, lname);
END
$$
    LANGUAGE 'plpgsql';

--CALL student('Inger', 'Støjer')
--SELECT * FROM students
    

CREATE OR REPLACE PROCEDURE grade(studentID int, courseID int, grade int) AS
$$
BEGIN
    IF ( SELECT current_setting('transaction_isolation') != 'serializable') THEN
	    RAISE EXCEPTION 'This transaction needs to be run in serializable level';  
    END IF;
    INSERT INTO grades (studentID, courseID, grade) VALUES (studentID, courseID, grade);
END
$$
    LANGUAGE 'plpgsql';
    
--CALL grade(1, 1, 12)
--SELECT * FROM grades


CREATE OR REPLACE PROCEDURE ttt(tID int, ttID int) AS
$$
BEGIN
    IF ( SELECT current_setting('transaction_isolation') != 'serializable') THEN
	    RAISE EXCEPTION 'This transaction needs to be run in serializable level';  
    END IF;
    INSERT INTO teacher_teacherteam (teacherID, teacherteamID) VALUES (tID, ttID);
END
$$
    LANGUAGE 'plpgsql';
    
--CALL ttt(1, 1)
--SELECT * FROM teacher_teacherteam
    


CREATE OR REPLACE PROCEDURE klasser(kID int, cID int, starter timestamp, slutter timestamp, ttID int, ct text) AS
$$
BEGIN
    IF ( SELECT current_setting('transaction_isolation') != 'serializable') THEN
	    RAISE EXCEPTION 'This transaction needs to be run in serializable level';  
    END IF;
    INSERT INTO classes (classID, courseID, starts, ends, teacherteamID, coursetype) VALUES (kID, cID, starter, slutter, ttID, ct);
END
$$
    LANGUAGE 'plpgsql';

--CALL createClass(3, 1, '2020-02-02','2020-03-03', 1, 'Online'::text)
--SELECT * FROM classes
    
    
CREATE OR REPLACE PROCEDURE classmember(classID int, studentID int) AS
$$
BEGIN
    IF ( SELECT current_setting('transaction_isolation') != 'serializable') THEN
	    RAISE EXCEPTION 'This transaction needs to be run in serializable level';  
    END IF;
    INSERT INTO classmembers (classID, studentID) VALUES (classID, studentID);
END
$$
    LANGUAGE 'plpgsql';
    
--CALL classmember(1, 1)
--SELECT * FROM classmembers
