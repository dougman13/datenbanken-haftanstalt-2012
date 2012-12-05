--
-- Aufbau der Tabellen für die Haftanstalt
-- 28.11.12 Mark Bonfert für Gruppe 9
--
--
set echo on
set pause =>
--
-- Start
-- =====
--
pause

define tablespace = "users"
-- Tabelle Person
-- ============
--
pause

CREATE TABLE Person
	(Vorname 	VARCHAR(20) 	NOT NULL
	,Nachname 	VARCHAR(20) 	NOT NULL
	,GebDatum 	DATE 		NOT NULL
	,Z_NR 		NUMBER(4) 		NULL
	,T_ID 		VARCHAR(1) 	NULL
	,S_Mass 	VARCHAR(20) 	NULL
	,F_Mass 	VARCHAR(20) 	NULL
	,Taetigkeit 	VARCHAR(20) 	NOT NULL		
	,CONSTRAINT 	Person_pk_VNNNGB 	PRIMARY KEY (Vorname,Nachname,GebDatum)
	)
	TABLESPACE &tablespace.
;
pause
--
-- Tabelle Behandlung
-- ==================
--
pause

CREATE TABLE Behandlung
	(Medikation 	VARCHAR(20) 	NOT NULL
	,Krankheit	VARCHAR(20) 	NOT NULL
	,ArztVN		VARCHAR(20) 	NOT NULL
	,ArztNN		VARCHAR(20) 	NOT NULL
	,ArztGB		DATE 		NOT NULL
	,HaeftlingVN	VARCHAR(20) 	NOT NULL
	,HaeftlingNN	VARCHAR(20) 	NOT NULL
	,HaeftlingGB	DATE 		NOT NULL
	,CONSTRAINT	Beh_pk_MedKra		PRIMARY KEY (Medikation,Krankheit,ArztVN,ArztNN,ArztGB)
	)
	TABLESPACE &tablespace.
;
pause
--
-- Tabelle Urteil
-- ==============
--
pause

CREATE TABLE Urteil
	(Urteilsdatum 	DATE 		NOT NULL
	,Delikt 	VARCHAR(20)	NOT NULL
	,Jahre		NUMBER(2)	NOT NULL
	,HaeftlingVN	VARCHAR(20) 	NOT NULL
	,HaeftlingNN	VARCHAR(20) 	NOT NULL
	,HaeftlingGB	DATE 		NOT NULL
	,CONSTRAINT 	Urteil_pk_datumdelikt 	PRIMARY KEY (Urteilsdatum,Delikt)
	)
	TABLESPACE &tablespace.
;
pause
--
-- Tabelle Trakt
-- =============
--
pause

CREATE TABLE Trakt
	(T_ID		VARCHAR(1)	NOT NULL
	,CONSTRAINT	Trakt_pk	PRIMARY KEY (T_ID)
       )
       TABLESPACE &tablespace.
;
pause
--
-- Tabelle Zelle
-- =============
--
pause

CREATE TABLE Zelle
	(Z_NR		NUMBER(4)	NOT NULL
	,T_ID		VARCHAR(1)	NOT NULL
	,Typ		VARCHAR(20)	NOT NULL
	,CONSTRAINT	Zelle_pk	PRIMARY KEY (T_ID,Z_NR)
       )
       TABLESPACE &tablespace.
;
pause
--
-- Tabellen Zuordnungen
-- ====================
--
pause
--
-- Zuordnungen Person-Tabelle
-- ==========================
--

ALTER TABLE Person ADD 
	(CONSTRAINT 	Person_fk1_T_ID 		FOREIGN KEY (T_ID,Z_NR) REFERENCES Zelle(T_ID,Z_NR)
   )
;
pause
--
-- Zuordnungen Behandlung-Tabelle
-- ==========================
--

ALTER TABLE Behandlung ADD
        (CONSTRAINT      Beh_fk1_Arzt                   FOREIGN KEY (ArztVN,ArztNN,ArztGB) REFERENCES Person(Vorname,Nachname,GebDatum)
        ,CONSTRAINT      Beh_fk4_Haeftling                FOREIGN KEY (HaeftlingVN,HaeftlingNN,HaeftlingGB) REFERENCES Person(Vorname,Nachname,GebDatum)
        )
;
pause
--
-- Zuordnungen Urteil-Tabelle
-- ==========================
--

ALTER TABLE Urteil ADD
	(CONSTRAINT     urteil_fk1_Haeftling                FOREIGN KEY (HaeftlingVN,HaeftlingNN,HaeftlingGB) REFERENCES Person(Vorname,Nachname,GebDatum)
	)
;
pause
--
-- Zuordnungen Trakt-Tabelle
-- ==========================
--
pause
--
-- Zuordnungen Zelle-Tabelle
-- ==========================
--

ALTER TABLE Zelle ADD
	(CONSTRAINT     Zelle_fk1_T-ID			FOREIGN KEY (T_ID) REFERENCES Trakt(T_ID)
	)
;
pause





-- Ende

