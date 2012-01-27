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
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_NANOTECH' ) );

--Digital
UPDATE Buildings 
SET 'Cost' = Cost * 4.2
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_DIGITAL' ) );

--Modern
UPDATE Buildings 
SET 'Cost' = Cost --was 3.0
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN' ) );


--UNIT COST
--Nano
UPDATE Units
SET 'Cost' = Cost * 3.6
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_NANOTECH' ) );

--Digital
UPDATE Units
SET 'Cost' = Cost * 3.07
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_DIGITAL' ) );

--Modern
UPDATE Units
SET 'Cost' = Cost * 2.69
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN' ) );


--BUILDING MAINTENANCE

--Nano
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 4.6
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_NANOTECH' ) );

--Digital
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 3.6
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_DIGITAL' ) );

--Modern
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 3.15
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN' ) );

--Industrial
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.0 -- 20% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL' ) );

--Renaissance
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.0 -- 20% Increase
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


--














