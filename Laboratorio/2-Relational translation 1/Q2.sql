-- Q2:
/*
Doneu una sentència SQL per obtenir el número de llicència dels boletaires que han fet una troballa en un lloc on ningú més ha trobat bolets. Si el lloc d'una troballa és nul, considerem que aquest lloc és diferent al de qualsevol altra troballa amb lloc no nul. Dues troballes amb lloc nul es consideren fetes al mateix lloc. Ordeneu el resultat per número de llicència.

Pel joc de proves que trobareu al fitxer adjunt, la sortida seria:

numLlicencia
538
*/


-- file_id275.txt:
-- Sentències de preparació de la base de dades:
create table bolets 
(especie char(20) primary key, 
comestible char (1) not null check ((comestible = 'S') or (comestible = 'N')), 
valor integer not null check (valor >= 0 and valor <= 10), 
check ((comestible = 'S') or (valor = 0)) ); 

create table boletaires 
(nom char(20) primary key, 
numLlicencia integer unique, 
ciutat char(20), 
edat integer check (edat >= 18) ); 

create table troballes 
(nom char(20), 
especie char(20), 
jornada integer, 
quantitat integer check (quantitat > 0), 
lloc char(20), 
primary key (nom, especie, jornada), 
foreign key (nom) references boletaires, 
foreign key (especie) references bolets);

--------------------------
-- Joc de proves Públic
--------------------------

-- Sentències d'inicialització:
insert into bolets values ('mataparents', 'N', 0); 
insert into bolets values ('llanega negra', 'S', 10); 
insert into bolets values ('cep', 'S', 10); 

insert into boletaires values ('Pep', 538, null, 21); 

insert into troballes values ('Pep', 'llanega negra', 4, 12, 'Cadi');


-- Solution:
SELECT DISTINCT b.NUMLLICENCIA
FROM BOLETAIRES b, troballes t
WHERE b.nom = t.nom AND NOT EXISTS 
				(SELECT * 
				FROM troballes t2 
				WHERE t.nom <> t2.nom AND  (t.lloc = t2.lloc OR (t2.lloc IS NULL AND t.lloc IS NULL)));