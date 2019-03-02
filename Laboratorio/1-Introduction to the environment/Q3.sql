-- Q3:
/*
Obtenir el número i nom dels departaments que tenen 2 o més empleats que viuen a la mateixa ciutat. 

Pel joc de proves que trobareu al fitxer adjunt, la sortida seria:

NUM_DPT NOM_DPT
------- ---------------------------
3 MARKETING
*/


-- file_id8.txt:
CREATE TABLE DEPARTAMENTS
         (	NUM_DPT INTEGER,
	NOM_DPT CHAR(20),
	PLANTA INTEGER,
	EDIFICI CHAR(30),
	CIUTAT_DPT CHAR(20),
	PRIMARY KEY (NUM_DPT));

CREATE TABLE PROJECTES
         (	NUM_PROJ INTEGER,
	NOM_PROJ CHAR(10),
	PRODUCTE CHAR(20),
	PRESSUPOST INTEGER,
	PRIMARY KEY (NUM_PROJ));

CREATE TABLE EMPLEATS
         (	NUM_EMPL INTEGER,
	NOM_EMPL CHAR(30),
	SOU INTEGER,
	CIUTAT_EMPL CHAR(20),
	NUM_DPT INTEGER,
	NUM_PROJ INTEGER,
	PRIMARY KEY (NUM_EMPL),
	FOREIGN KEY (NUM_DPT) REFERENCES DEPARTAMENTS (NUM_DPT),
	FOREIGN KEY (NUM_PROJ) REFERENCES PROJECTES (NUM_PROJ));

INSERT INTO  DEPARTAMENTS VALUES (3,'MARKETING',3,'RIOS ROSAS','MADRID');

INSERT INTO  EMPLEATS VALUES (3,'ROBERTO',25000,'BARCELONA',3,null);
INSERT INTO  EMPLEATS VALUES (5,'EULALIA',150000,'BARCELONA',3,null);

COMMIT;


-- SOLUTION:
SELECT DISTINCT num_dpt, nom_dpt
FROM departaments NATURAL INNER JOIN empleats e1
WHERE EXISTS
    (SELECT ciutat_empl 
    FROM empleats e2 
    WHERE e1.ciutat_empl = e2.ciutat_empl AND e1.num_empl <> e2.num_empl);
