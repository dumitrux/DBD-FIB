-- Q1:
/*
Per a cada projecte que té el valor nul a la columna "pressupost", obtenir la suma dels sous dels empleats assignats al projecte. Ordeneu el resultat per número de projecte..
Per als projectes sense empleats doneu NULL com a suma dels sous.

Per al joc de proves que trobareu al fitxer adjunt, la sortida seria: 

NUM_PROJ SUM 
_________ ____ 
1 40000 
*/


-- file_id586.txt:
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
	
INSERT INTO  PROJECTES VALUES (1,'IBDVID','VIDEO',NULL);
INSERT INTO  EMPLEATS VALUES (3,'ROBERTO',25000,'ZAMORA',NULL,1);
INSERT INTO  EMPLEATS VALUES (6,'MARTA',15000,'ZAMORA',NULL,1);


-- Solution:
SELECT e.NUM_PROJ, SUM(e.sou)
FROM empleats e, projectes p
WHERE p.pressupost IS NULL AND e.NUM_PROJ = p.NUM_PROJ
GROUP BY e.NUM_PROJ
ORDER BY e.NUM_PROJ;