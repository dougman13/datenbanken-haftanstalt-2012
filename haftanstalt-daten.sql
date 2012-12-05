--
-- Haftanstalt : SQL Aufbau Daten 
--
-- 28.11.12 Gruppe 9
--
--
--


set echo on
--
-- Start
-- =====
--
-- Aufbau der Daten für die Tabelle Trakt
-- =====================================
INSERT INTO Trakt 
        (T_ID)        
    VALUES ('A')
;
INSERT INTO Trakt
    VALUES ('B')
;
-- Aufbau der Daten für die Tabelle Zelle
-- ====================================
INSERT 
INTO Zelle
        (Z_Nr, T_ID, Typ)
    VALUES (12, 'A', 'Einzel')
;
INSERT 
INTO Zelle
    VALUES (15,'A', 'Einzel')
;
INSERT 
INTO Zelle
    VALUES (34, 'B', 'Einzel')
;
INSERT 
INTO Zelle
    VALUES(13, 'A', 'Zwei Mann')
;
INSERT
INTO Zelle
    VALUES(17, 'B', 'Einzel')
;
-- Aufbau der Daten für die Tabelle Person
-- ====================================
INSERT
INTO Person
          (Vorname,Nachname,Gebdatum,T_ID, Z_Nr,S_Mass,F_Mass,Taetigkeit)
    VALUES('Jack','Ripper',to_date('13.12.1954','dd.mm.yyyy'),'A',12,NULL,'Abitur','Koch')
;
INSERT 
INTO Person 
(Vorname,Nachname,Gebdatum,T_ID, Z_Nr,S_Mass,F_Mass,Taetigkeit)
    VALUES ('Bobo','Holo',to_date('24.12.1960','dd.mm.yyyy'),'B',34,'Basteln','lehre','Hausmeister')
;
INSERT 
INTO Person 
(Vorname,Nachname,Gebdatum,T_ID, Z_Nr,S_Mass,F_Mass,Taetigkeit)
    VALUES ('Hans','Meiser',to_date('01.11.1975','dd.mm.yyyy'),'A',15,Null,'Abitur','Putzen')
;
INSERT 
INTO Person
(Vorname,Nachname,Gebdatum,T_ID, Z_Nr,S_Mass,F_Mass,Taetigkeit)
    VALUES ('Doc', 'Drug', to_date('02.07.1998','dd.mm.yyyy'), NULL, NULL, NULL, NULL, NULL)
;
INSERT 
INTO Person
(Vorname,Nachname,Gebdatum,T_ID, Z_Nr,S_Mass,F_Mass,Taetigkeit)
    VALUES ('Major', 'Tom', to_date('09.07.1978','dd.mm.yyyy'),'A', NULL, NULL, NULL, NULL)
;
INSERT 
INTO Person
(Vorname,Nachname,Gebdatum,T_ID, Z_Nr,S_Mass,F_Mass,Taetigkeit)
    VALUES ('Galgen', 'Strick', to_date('10.12.1988','dd.mm.yyyy'),'B', NULL, NULL, NULL, NULL)
;
INSERT
INTO 	Person
VALUES 	('Gert', 'Grynthal', to_date('13.03.1958', 'dd.mm.yyyy'), 'A', '13', NULL, NULL, NULL)
;
INSERT
INTO	Person
VALUES	('Bardal', 'Oxnholz', to_date('09.12.1987', 'dd.mm.yyyy'), 'A', 13, NULL, NULL, 'Wäscherei')
;
INSERT
INTO	Person
VALUES	('Phyl', 'Delbens', to_date('02.08.1977', 'dd.mm.yyyy'), 'B', 17, NULL, 'Ausbildung', NULL)
;
INSERT
INTO	Person
VALUES	('Reiner', 'Weißmann', to_date('11.10.1957', 'dd.mm.yyyy'), NULL, NULL, NULL, NULL, NULL)
;

-- Aufbau der Daten für die Tabelle Behandlung
-- =========================================
INSERT 
INTO Behandlung 
               (Medikation, Krankheit, ArztVN, ArztNN, ArztGB, HaeftlingVN, HaeftlingNN, HaeftlingGB)
    VALUES ('Morphium','Krebs','Doc', 'Drug', to_date('02.07.1998', 'dd.mm.yyyy'), 'Hans', 'Meiser', to_date('01.11.1975', 'dd.mm.yyyy'))
;
INSERT 
INTO Behandlung 
    VALUES ('Asperin','Migraene','Doc', 'Drug', '02.07.1998', 'Bobo', 'Holo',to_date('24.12.1960', 'dd.mm.yyyy'))
;
INSERT
INTO 	Behandlung
VALUES	('Schmerztabletten', 'Zahnschmerzen', 'Reiner', 'Weißmann', to_date('11.10.1957', 'dd.mm.yyyy'), 'Bardal', 'Oxnholz', to_date('09.12.1987', 'dd.mm.yyyy'))
;
-- Aufbau der Daten für die Tabelle Urteil
-- =========================================
INSERT
INTO Urteil
        (Urteilsdatum, Delikt, Jahre, HaeftlingVN, HaeftlingNN, HaeftlingGB)
    VALUES (to_date('23.11.2000', 'dd.mm.yyyy'), 'Raub', 3, 'Bobo', 'Holo', to_date('24.12.1960', 'dd.mm.yyyy') );
INSERT 
INTO Urteil
    VALUES (to_date('14.03.2010', 'dd.mm.yyyy'), 'Koerperverletzung', 2,  'Hans', 'Meiser', to_date('01.11.1975', 'dd.mm.yyyy'))
;
INSERT 
INTO Urteil
    VALUES (to_date('25.12.2011', 'dd.mm.yyyy'), 'Mord', 5, 'Jack', 'Ripper', to_date('13.12.1954', 'dd.mm.yyyy'))
;INSERT
INTO	Urteil
VALUES	(to_date('07.03.1978', 'dd.mm.yyyy'), 'Versuchtes Selbstmordattentat', 73, 'Gert', 'Grynthal', to_date('13.03.1958', 'dd.mm.yyyy'))
;
INSERT
INTO 	Urteil
VALUES	(to_date('17.10.2010', 'dd.mm.yyyy'), 'Totschlag', 14,'Bardal', 'Oxnholz', to_date('09.12.1987', 'dd.mm.yyyy'))
;
INSERT
INTO	Urteil
VALUES	(to_date('27.09.1999', 'dd.mm.yyyy'), 'Bankraub', 3, 'Phyl', 'Delbens', to_date('02.08.1977', 'dd.mm.yyyy'))
;
INSERT 
INTO	Urteil
VALUES	(to_date('27.09.1999', 'dd.mm.yyyy'), 'Mord', 83, 'Phyl', 'Delbens', to_date('02.08.1977', 'dd.mm.yyyy'))
;

COMMIT;

-- Ende

