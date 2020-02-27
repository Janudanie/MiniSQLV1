CREATE OR REPLACE FUNCTION find_available_teachers ()
RETURNS TABLE (teacherid INT, firstname text, lastname text) 
AS $func$
BEGIN
    RETURN QUERY
        SELECT DISTINCT t.teacherid, t.firstname, t.lastname
        FROM classes c
        JOIN teacher_teacherteam tt ON tt.teacherteamid = c.teacherteamid
        JOIN teachers t ON t.teacherid = tt.teacherid
        --WHERE c.starts > NOW();
        WHERE c.starts > '2000-01-01' AND c.ends < '2010-01-01';
end; $func$
LANGUAGE 'plpgsql';
