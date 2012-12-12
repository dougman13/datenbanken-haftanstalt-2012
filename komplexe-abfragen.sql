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
pause
-- Bartosch's "Komplizierte" abfrage...
-- =================================
--
pause
-- Ralf's "Komplizierte" abfrage...
-- =================================
-- Der Jüngste und Älteste kranke häftling sollen gesondert überwacht werden
--
select r.vorname, r.nachname, r.gebdatum, r.krankheit, r.age, z.z_nr zellennr, z.t_id traktid
from
(select x.vorname, x.nachname, x.gebdatum, x.krankheit, (sysdate-x.gebdatum)/365 age, x.t_id, x.z_nr
from (select p.vorname, p.nachname, p.gebdatum, b.krankheit, p.t_id, p.z_nr
      from person p join behandlung b 
      on p.vorname = b.haeftlingvn and p.nachname = b.haeftlingnn and p.gebdatum = haeftlinggb) x
join (select min(haeftlinggb) mindate, max(haeftlinggb) maxdate
      from behandlung
      ) y
      on y.mindate = x.gebdatum or y.maxdate = x.gebdatum) r
      join zelle z
      on r.t_id = z.t_id and r.z_nr = z.z_nr
;
--
--
pause
-- Richard's "Komplizierte" abfrage...
-- =================================
--
pause
