set echo on
define tablespace = "users"
-- Mark's "Komplizierte" abfrage...
-- =================================
-- Die Gefängnisverwaltung möchte zur besseren Organisation
-- der Haftanstalt eine Abfrage wieviele Jahre gesamt die Häftlinge
-- jeden Traktes verbüssen müssen. Die Ausgabe soll die T-ID, die Anzahl
-- Häftline pro Trakt sowie die Gesamtsumme der Haftjahre pro Trakt enthalten.
-- Aufgrund der Datenbankstruktur(Wächter und Ärzte sind in einer Tabelle mit den HA)
-- soll sichergestellt werden das diese nicht mitgezähl werden.
pause
SELECT t.T_ID, sum(u.jahre) AS ANZJahre, c.ANZHaeftlinge
FROM trakt t
LEFT JOIN person p ON (p.T_ID = t.T_ID)
JOIN urteil u ON (p.vorname = u.haeftlingVN AND p.nachname = u.haeftlingNN AND p.gebdatum = u.haeftlingGB)
JOIN (	SELECT tr.T_ID, Count(pe.nachname) AS ANZHaeftlinge
		FROM trakt tr
		LEFT JOIN person pe ON (pe.T_ID = tr.T_ID)
		WHERE pe.T_ID IS NOT NULL AND pe.Z_NR IS NOT NULL
		GROUP BY tr.T_ID
	 ) c ON (c.T_ID = t.T_ID) 
GROUP BY t.T_ID, c.ANZHaeftlinge
ORDER BY t.T_ID
;
-- AUSGABE
-- =======
--T   ANZJAHRE ANZHAEFTLINGE
--- ---------- -------------
--A         99             5
--B        211             4
--C         92             1
-- Bartosch's "Komplizierte" abfrage...
-- =================================
--
-- Ralf's "Komplizierte" abfrage...
-- =================================
--
-- Richard's "Komplizierte" abfrage...
-- =================================
