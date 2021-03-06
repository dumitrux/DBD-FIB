-- Q4:
/*
Obtenir el número i el nom dels departaments que no tenen cap empleat que visqui a MADRID. 
Ordeneu el resultat pel nom de departament ascendentment. 

Pel joc de proves que trobareu al fitxer adjunt, la sortida seria:

NUM_DPT NOM_DPT
------- ---------------------------
3 MARKETING
*/


-- files_id7.txt:
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

INSERT INTO  PROJECTES VALUES (1,'IBDTEL','TELEVISIO',1000000);

INSERT INTO  EMPLEATS VALUES (3,'ROBERTO',25000,'ZAMORA',3,1);

COMMIT;


-- SOLUTION:
SELECT num_dpt, nom_dpt
FROM departaments d
WHERE NOT EXISTS 
    (SELECT ciutat_empl 
    FROM empleats e
    WHERE d.num_dpt = e.num_dpt AND e.ciutat_empl IN ('MADRID'))
ORDER BY nom_dpt;
