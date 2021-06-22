
--------------------------------------------------------------------------------------
------------------------- Inserting Values -------------------------------------------
--------------------------------------------------------------------------------------

INSERT INTO agent_details VALUES (2001,'Jack','ABS1','Telecom','id_1@gmail.com', 'M')
INSERT INTO agent_details (sap_id, name, system_login_id,email_id, gender) VALUES (2002,'Mira','ABS2','id_2@gmail.com', 'F')

INSERT INTO agent_details (sap_id, name, system_login_id,email_id, gender) SELECT sap_id, name, system_login_id,email_id, gender FROM agent_det;
INSERT INTO agent_details  SELECT * FROM agent_det;

INSERT INTO agent_details  SELECT * FROM agent_det WHERE gender = 'F';
INSERT INTO agent_details  SELECT * FROM agent_det WHERE gender = 'F' and project is not null;


--------------------------------------------------------------------------------------
------------------------- UPDATE Values -------------------------------------------
--------------------------------------------------------------------------------------

SELECT * FROM agent_details;
UPDATE agent_details SET sap_id = 20010  WHERE name = 'Jack';

UPDATE agent_details SET sap_id = 200130, project = 'Transport'  WHERE name = 'Zira';

UPDATE agent_details SET sap_id = ( SELECT DISTINCT(sap_id) FROM agent_det WHERE name = 'Kira') WHERE name = 'Tira'; -- due to duplicate value added distinct

UPDATE agent_details SET agent_details.sap_id = agent_det.sap_id FROM agent_details INNER JOIN agent_det ON (agent_details.email_id = agent_det.email_id)
WHERE agent_details.name = 'Zira'; 

--------------------------------------------------------------------------------------
------------------------- DELETE Values -------------------------------------------
--------------------------------------------------------------------------------------
DELETE FROM agent_det; -- Risky , this will delete all contents from a table
DELETE FROM agent_det WHERE name = 'Zira';
DELETE TOP (2) FROM agent_det;
DELETE TOP (5) PERCENT FROM agent_det;

TRUNCATE TABLE agent_details;
