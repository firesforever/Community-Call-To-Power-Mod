-- Add a new Display column to the Tech Prereqs table, and default existing entries to "show"
ALTER TABLE Technology_PrereqTechs ADD COLUMN Display INT DEFAULT 1;

-- Add all the missing prereq techs, setting them to "hide"
INSERT INTO Technology_PrereqTechs(TechType, PrereqTech, Display)
  SELECT DISTINCT t.Type, e.EndTech AS PrereqTech, '0'
  FROM Technologies AS t,
       Technology_PrereqTechs AS r,
	   Technologies AS p,
       (SELECT DISTINCT t.Era, t.Type As EndTech
        FROM Technologies t, Technology_PrereqTechs r, Technologies n
		WHERE t.Type=r.PrereqTech
          AND r.TechType=n.Type
		  AND t.Era!=n.Era) AS e
  WHERE t.Type = r.TechType
    AND r.PrereqTech = p.Type
	AND t.Era != p.Era
	AND e.Era = p.Era
	AND e.EndTech NOT IN (SELECT x.PrereqTech FROM Technology_PrereqTechs x WHERE t.Type = x.TechType);

-- Update the entry in the Defines table to be the maximum number of prereqs for any individual tech
UPDATE Defines 
  SET Value=(SELECT Max(c) FROM (SELECT Count(PrereqTech) AS c FROM Technology_PrereqTechs GROUP BY TechType))
  WHERE Name='NUM_AND_TECH_PREREQS';