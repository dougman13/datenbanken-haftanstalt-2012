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
-- Aufbau der Daten für die Tabelle Person
-- ====================================
INSERT
INTO Person
          (Vorname,Nachname,Gebdatum,T_ID, Z_Nr,S_Mass,F_Mass,Taetigkeit)
    VALUES('Jack','Ripper',to_date('13.12.1954','dd.mm.yyyy'),'A',12,NULL,'Abitur','Koch')
;
INSERT 
INTO Person 
    VALUES ('Bobo','Holo',to_date('24.12.1960','dd.mm.yyyy'),'B',34, 'Basteln', 'lehre', 'Hausmeister')
;
INSERT 
INTO Person 
    VALUES ('Hans','Meiser',to_date('01.11.1975','dd.mm.yyyy'),'A',15, Null, 'Abitur', 'Putzen')
;
INSERT 
INTO Person
    VALUES ('Doc', 'Drug', to_date('02.07.1998','dd.mm.yyyy'), NULL, NULL, NULL, NULL, NULL)
;
INSERT 
INTO Person
    VALUES ('Major', 'Tom', to_date('09.07.1978','dd.mm.yyyy'),'A', NULL, NULL, NULL, NULL)
;
INSERT 
INTO Person
    VALUES ('Galgen', 'Strick', to_date('10.12.1988','dd.mm.yyyy'),'B', NULL, NULL, NULL, NULL)
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
;

COMMIT;

-- Ende

