-- Insert SQL Rules Here
 
-- Must also do techs in reverse order due to cost increases causing a tech to potentially cross
-- the next-highest threshold.

--TECHNOLOGY COST
--Nano Era
UPDATE Technologies
SET 'Cost' = Cost * 3.0
WHERE Cost >= 8236; 

--Digital Era
UPDATE Technologies
SET 'Cost' = Cost * 2.8
WHERE Cost >= 5413
AND Cost < 8236; 

--Modern Era
UPDATE Technologies
SET 'Cost' = Cost * 2.2
WHERE Cost >= 1799
AND Cost < 5413; 

--Industrial Era
UPDATE Technologies
SET 'Cost' = Cost * 2.44
WHERE Cost >= 583
AND Cost < 1779; 

--Renaissance Era
UPDATE Technologies
SET 'Cost' = Cost * 2.75
WHERE Cost >= 190
AND Cost < 583; 

--Medieval Era
UPDATE Technologies
SET 'Cost' = Cost * 2.65
WHERE Cost >= 60
AND Cost < 190; 

--Classical Era
UPDATE Technologies
SET 'Cost' = Cost * 2.4
WHERE Cost >= 50
AND Cost < 60; 

--Rest of Ancient Era
UPDATE Technologies
SET 'Cost' = Cost * 2.25
WHERE Cost >= 30
AND Cost < 50; 

--Ancient Tier 1
UPDATE Technologies
SET 'Cost' = Cost * 1.875
WHERE Cost >= 0
AND Cost < 30; 

--BUILDING COST
--Nano
UPDATE Buildings 
SET 'Cost' = Cost * 4.8
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE' ) );

--Digital
UPDATE Buildings 
SET 'Cost' = Cost * 4.2
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN' ) );

--Modern
UPDATE Buildings 
SET 'Cost' = Cost -- was * 3.0
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN' ) );


--UNIT COST
--Nano
UPDATE Units
SET 'Cost' = Cost * 3.6
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE' ) );

--Digital
UPDATE Units
SET 'Cost' = Cost * 3.07
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN' ) );

--Modern
UPDATE Units
SET 'Cost' = Cost -- WAS * 2.69
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN' ) );


--BUILDING MAINTENANCE

--Nano
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 4.6
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE' ) );

--Digital
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 3.6
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN' ) );

--Modern
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance -- was * 3.15
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN' ) );

--Industrial
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.0 -- 30% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL' ) );

--Renaissance
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.0 -- 30% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE' ) );

--Medieval
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.0 -- 20% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL' ) );

-- Classical
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.0 -- 20% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL' ) );

--Ancient
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.0 -- 10% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT' ) );

--EXTRA HAPPINESS AT START
UPDATE HandicapInfos
SET HappinessDefault = HappinessDefault;


--Goody Huts only Ancient Techs
UPDATE "Technologies"
SET GoodyTech = 0
WHERE Era IN ('ERA_CLASSICAL', 'ERA_MEDIEVAL', 'ERA_RENAISSANCE', 'ERA_INDUSTRIAL', 'ERA_MODERN', 'ERA_POSTMODERN', 'ERA_FUTURE');

-- Gamespeeds Adjustment

DELETE FROM GameSpeeds WHERE Type IN ('GAMESPEED_MARATHON','GAMESPEED_EPIC','GAMESPEED_STANDARD','GAMESPEED_QUICK');
INSERT INTO GameSpeeds VALUES ("0",'GAMESPEED_MARATHON','TXT_KEY_GAMESPEED_MARATHON','TXT_KEY_GAMESPEED_MARATHON_HELP',"90","450","300","300","300","450","300","67","300","300","300","375","450","400","300","375","375","300","200","100","5","-330","2","300","300","300","100","0",'GAMESPEED_ATLAS');
INSERT INTO GameSpeeds VALUES ("1",'GAMESPEED_EPIC','TXT_KEY_GAMESPEED_EPIC','TXT_KEY_GAMESPEED_EPIC_HELP',"45","225","150","150","150","225","150","75","150","225","150","188","188","150","150","188","188","150","125","100","10","-169","4","150","150","150","100","1",'GAMESPEED_ATLAS');
INSERT INTO GameSpeeds VALUES ("2",'GAMESPEED_STANDARD','TXT_KEY_GAMESPEED_STANDARD','TXT_KEY_GAMESPEED_STANDARD_HELP',"30","125","100","100","100","100","100","100","100","100","100","125","125","100","100","125","125","100","100","100","20","-112","6","100","100","100","100","2",'GAMESPEED_ATLAS');
INSERT INTO GameSpeeds VALUES ("3",'GAMESPEED_QUICK','TXT_KEY_GAMESPEED_QUICK','TXT_KEY_GAMESPEED_QUICK_HELP',"25","84","67","67","67","84","67","125","67","84","67","84","84","67","67","84","84","67","80","100","35","-90","9","67","67","67","30","3",'GAMESPEED_ATLAS');

-- Policy Flavor Typos Fix
UPDATE Policy_Flavors SET PolicyType = 'POLICY_STATE_CHURCH' WHERE PolicyType = 'POLICY_STATE_CHRUCH';
UPDATE Policy_Flavors SET PolicyType = 'POLICY_POWER_STRUCTURES' WHERE PolicyType = 'POLICY_POWER_STRUCUTURES';














