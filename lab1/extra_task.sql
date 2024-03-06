DECLARE
  str_command VARCHAR2(50);
  comand VARCHAR2(50);

  FUNCTION ErrOrInsert(num_id IN NUMBER, num_val IN NUMBER) RETURN VARCHAR2 IS
    is_exist NUMBER := 0;
  BEGIN
    SELECT COUNT(*) INTO is_exist
    FROM MyTable
    WHERE id = num_id;
    IF is_exist > 0 THEN
      RAISE_APPLICATION_ERROR(-20001, 'Element with id ' || num_id || ' already exists.');
    ELSE
      str_command := 'INSERT INTO MyTable(val) VALUES ( ' || num_val || ')';
    END IF;

    RETURN str_command;
  END;

BEGIN
  comand := ErrOrInsert(2, 6455);
  EXECUTE IMMEDIATE comand;
  DBMS_OUTPUT.PUT_LINE(comand);
END;

