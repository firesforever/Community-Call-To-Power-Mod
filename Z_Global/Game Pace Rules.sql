-- Insert SQL Rules Here
--TECHNOLOGY COST BY TIER & ERA
/*
Base costs for Tier 1 in each Era are( or will be) set in Technologies.sql. 
Base of 20(Ancient) Classical Base is 50(250% more than Ancient),  Medieval is 150(300% more than Classical), Renaissance is 450(300% more than Medieval), Industrial is 1575(350% more than Renaissance), 
Modern is 5512.5(350% more than Industrial), Digital is 19293.75(350% more than Modern), Information is 77175(400% more than Digital).

Here we adjust each Tier to reflect a gradiant system. Each Tier is currently(Feel free to tweak it) increased by 20% per Tier, so Tier 2 is 20% more than Tier 1, Tier 3 is 40% more so on so on.
*/

--Future Tier 5
UPDATE Technologies
SET Cost = Round(77175 * 1.8, 0) WHERE Tier = 5 AND Era = 'ERA_FUTURE';
--Future Tier 4
UPDATE Technologies
SET Cost = Round(77175 * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_FUTURE';
--Future Tier 3
UPDATE Technologies
SET Cost = Round(77175 * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_FUTURE';
--Future Tier 2
UPDATE Technologies
SET Cost = Round(77175 * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_FUTURE';
--Future Tier 1
UPDATE Technologies
SET Cost = Round(77175 * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_FUTURE';

--Digital Tier 6
UPDATE Technologies
SET Cost = Round(19293.75 * 2.0, 0) WHERE Tier = 6 AND Era = 'ERA_POSTMODERN';
--Digital Tier 5
UPDATE Technologies
SET Cost = Round(19293.75 * 1.8, 0) WHERE Tier = 5 AND Era = 'ERA_POSTMODERN';
--Digital Tier 4
UPDATE Technologies
SET Cost = Round(19293.75 * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_POSTMODERN';
--Digital Tier 3
UPDATE Technologies
SET Cost = Round(19293.75 * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_POSTMODERN';
--Digital Tier 2
UPDATE Technologies
SET Cost = Round(19293.75 * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_POSTMODERN';
--Digital Tier 1
UPDATE Technologies
SET Cost = Round(19293.75 * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_POSTMODERN';

--Modern Tier 4
UPDATE Technologies
SET Cost = Round(5512.5 * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_MODERN';
--Modern Tier 3
UPDATE Technologies
SET Cost = Round(5512.5 * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_MODERN';
--Modern Tier 2
UPDATE Technologies
SET Cost = Round(5512.5 * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_MODERN';
--Modern Tier 1
UPDATE Technologies
SET Cost = Round(5512.5 * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_MODERN';

--Industrial Tier 6
UPDATE Technologies
SET Cost = Round(1575 * 2.0, 0) WHERE Tier = 6 AND Era = 'ERA_INDUSTRIAL';
--Industrial Tier 5
UPDATE Technologies
SET Cost = Round(1575 * 1.8, 0) WHERE Tier = 5 AND Era = 'ERA_INDUSTRIAL';
--Industrial Tier 4
UPDATE Technologies
SET Cost = Round(1575 * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_INDUSTRIAL';
--Industrial Tier 3
UPDATE Technologies
SET Cost = Round(1575 * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_INDUSTRIAL';
--Industrial Tier 2
UPDATE Technologies
SET Cost = Round(1575 * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_INDUSTRIAL';
--Industrial Tier 1
UPDATE Technologies
SET Cost = Round(1575 * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_INDUSTRIAL';

--Renaissance Tier 5
UPDATE Technologies
SET Cost = Round(Cost * 1.8, 0) WHERE Tier = 5 AND Era = 'ERA_RENAISSANCE';
--Renaissance Tier 4
UPDATE Technologies
SET Cost = Round(Cost * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_RENAISSANCE';
--Renaissance Tier 3
UPDATE Technologies
SET Cost = Round(Cost * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_RENAISSANCE';
--Renaissance Tier 2
UPDATE Technologies
SET Cost = Round(Cost * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_RENAISSANCE';
--Renaissance Tier 1
UPDATE Technologies
SET Cost = Round(Cost * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_RENAISSANCE';

--Medieval Tier 4
UPDATE Technologies
SET Cost = Round(Cost * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_MEDIEVAL';
--Medieval Tier 3
UPDATE Technologies
SET Cost = Round(Cost * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_MEDIEVAL';
--Medieval Tier 2
UPDATE Technologies
SET Cost = Round(Cost * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_MEDIEVAL';
--Medieval Tier 1
UPDATE Technologies
SET Cost = Round(Cost * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_MEDIEVAL';

--Classical Tier 5
UPDATE Technologies
SET Cost = Round(Cost * 1.8, 0) WHERE Tier = 5 AND Era = 'ERA_CLASSICAL';
--Classical Tier 4
UPDATE Technologies
SET Cost = Round(Cost * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_CLASSICAL';
--Classical Tier 3
UPDATE Technologies
SET Cost = Round(Cost * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_CLASSICAL';
--Classical Tier 2
UPDATE Technologies
SET Cost = Round(Cost * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_CLASSICAL';
--Classical Tier 1
UPDATE Technologies
SET Cost = Round(Cost * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_CLASSICAL';

--Ancient Tier 5
UPDATE Technologies
SET Cost = Round(Cost * 1.8, 0) WHERE Tier = 5 AND Era = 'ERA_ANCIENT';
--Ancient Tier 4
UPDATE Technologies
SET Cost = Round(Cost * 1.6, 0) WHERE Tier = 4 AND Era = 'ERA_ANCIENT';
--Ancient Tier 3
UPDATE Technologies
SET Cost = Round(Cost * 1.4, 0) WHERE Tier = 3 AND Era = 'ERA_ANCIENT';
--Ancient Tier 2
UPDATE Technologies
SET Cost = Round(Cost * 1.2, 0) WHERE Tier = 2 AND Era = 'ERA_ANCIENT';
--Ancient Tier 1
UPDATE Technologies
SET Cost = Round(Cost * 1.0, 0) WHERE Tier = 1 AND Era = 'ERA_ANCIENT';

--BUILDING COST

--Nano
UPDATE Buildings
SET Cost = Cost * 4.8
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE' ) );

--Digital
UPDATE Buildings
SET Cost = Cost * 4.2
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN' ) );

--Modern
UPDATE Buildings
SET Cost = Cost -- was * 3.0
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN' ) );


--UNIT COST
--Nano
UPDATE Units
SET Cost = Cost * 3.6
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_FUTURE' ) );

--Digital
UPDATE Units
SET Cost = Cost * 3.07
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_POSTMODERN' ) );

--Modern
UPDATE Units
SET Cost = Cost -- WAS * 2.69
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
SET GoldMaintenance = GoldMaintenance * 1.5 -- was * 3.15
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MODERN' ) );

--Industrial
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.5 -- 30% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_INDUSTRIAL' ) );

--Renaissance
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.5 -- 30% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_RENAISSANCE' ) );

--Medieval
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.5 -- 20% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_MEDIEVAL' ) );

-- Classical
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.2 -- 20% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_CLASSICAL' ) );

--Ancient
UPDATE Buildings
SET GoldMaintenance = GoldMaintenance * 1.1 -- 10% Increase
WHERE ( PrereqTech IN ( SELECT Type FROM Technologies WHERE Era = 'ERA_ANCIENT' ) );

--Goody Huts only Ancient Techs
UPDATE Technologies
SET GoodyTech = 0
WHERE Era IN ('ERA_CLASSICAL', 'ERA_MEDIEVAL', 'ERA_RENAISSANCE', 'ERA_INDUSTRIAL', 'ERA_MODERN', 'ERA_POSTMODERN', 'ERA_FUTURE');

-- Game Options
UPDATE GameOptions SET "Default" = 1 WHERE Type = 'GAMEOPTION_POLICY_SAVING';
UPDATE GameOptions SET "Default" = 1 WHERE Type = 'GAMEOPTION_PROMOTION_SAVING';

-- Gamespeeds Adjustments 
DELETE FROM GameSpeeds WHERE Type IN ('GAMESPEED_MARATHON','GAMESPEED_EPIC','GAMESPEED_STANDARD','GAMESPEED_QUICK');
--
INSERT INTO GameSpeeds		(ID, Type,					Description,					Help,								DealDuration,	GrowthPercent,	TrainPercent,	ConstructPercent,	CreatePercent,	ResearchPercent,	GoldPercent,	GoldGiftMod,	BuildPercent,	ImprovementPercent, GreatPeoplePercent, CulturePercent, FaithPercent,	BarbPercent,	FeatureProductionPercent,	UnitDiscoverPercent,	UnitHurryPercent,	UnitTradePercent,	GoldenAgePercent,	HurryPercent,	InflationPercent,	InflationOffset,	ReligiousPressureAdjacentCity,	VictoryDelayPercent,	MinorCivElectionFreqMod,	OpinionDurationPercent, SpyRatePercent, PortraitIndex,	IconAtlas)
				 
				 SELECT		 0,	 'GAMESPEED_MARATHON',	'TXT_KEY_GAMESPEED_MARATHON',	'TXT_KEY_GAMESPEED_MARATHON_HELP',	90,				450,			300,			300,				300,			450,				300,			67,				300,			300,				300,				375,			450,			400,			300,						375,					375,				300,				200,				100,			5,					-330,				2,								300,					300,						300,					100,			0,				'GAMESPEED_ATLAS'		UNION ALL
				 SELECT		 1,	 'GAMESPEED_EPIC',		'TXT_KEY_GAMESPEED_EPIC',		'TXT_KEY_GAMESPEED_EPIC_HELP',	    45,				225,			135,			135,				150,			225,				150,			75,				150,			225,				150,				188,			188,			150,			150,						188,					188,				150,				125,				100,			10,					-169,				4,								150,					150,						150,					100,			1,				'GAMESPEED_ATLAS'		UNION ALL
				 SELECT		 2,	 'GAMESPEED_STANDARD',	'TXT_KEY_GAMESPEED_STANDARD',	'TXT_KEY_GAMESPEED_STANDARD_HELP',	30,				115,			100,			100,				100,			100,			    100,		    100,	        100,			100,				100,				125,			125,			100,			100,						125,					125,				100,				100,				100,			20,					-112,				6,								100,					100,						100,					100,			2,				'GAMESPEED_ATLAS'		UNION ALL
				 SELECT		 3,	 'GAMESPEED_QUICK',		'TXT_KEY_GAMESPEED_QUICK',		'TXT_KEY_GAMESPEED_QUICK_HELP',     25,				84,				67,				67,					67,				84,					67,				125,			67,				84,					67,					84,				84,				67,				67,							84,						84,					67,					80,					100,			35,					-90,				9,								67,						67,							67,						30,				3,				'GAMESPEED_ATLAS';

-- Calender Adjustment
DROP TABLE IF EXISTS GameSpeed_Turns;
CREATE TABLE GameSpeed_Turns (  'GameSpeedType' text , 
								'MonthIncrement' integer , 
								'TurnsPerIncrement' integer , foreign key (GameSpeedType) references GameSpeeds(Type));
-- Crawl
INSERT INTO GameSpeed_Turns (GameSpeedType,			MonthIncrement,	TurnsPerIncrement)
SELECT						'GAMESPEED_MARATHON',	180,			100					 UNION ALL -- Ancient
SELECT						'GAMESPEED_MARATHON',	120,			300					 UNION ALL -- Classical
SELECT						'GAMESPEED_MARATHON',	60,				170					 UNION ALL -- Medieval
SELECT						'GAMESPEED_MARATHON',	24,				201					 UNION ALL -- Renassiance
SELECT						'GAMESPEED_MARATHON',	12,				129					 UNION ALL -- Industrial
SELECT						'GAMESPEED_MARATHON',	6,				180					 UNION ALL -- Modern
SELECT						'GAMESPEED_MARATHON',	3,				264					 UNION ALL  -- Post Modern
SELECT						'GAMESPEED_MARATHON',	1,				156					 UNION ALL -- Future
-- Slow
SELECT						'GAMESPEED_EPIC',		247,			155					 UNION ALL -- Ancient bout 3200 years(4000BC - 800BC) - Complete
SELECT						'GAMESPEED_EPIC',		120,			140					 UNION ALL -- Classical about 1400 Years(800BC - 600AD) - Complete
SELECT						'GAMESPEED_EPIC',		70,				155					 UNION ALL -- Medieval about 900 years(600AD - 1500AD) - Complete
SELECT						'GAMESPEED_EPIC',		19,				190					 UNION ALL -- Renassiance about 250 years (1500AD - 1750AD) - Complete
SELECT						'GAMESPEED_EPIC',		24,				70					 UNION ALL -- Industrial about 150 years (1750 - 1900) - Inprogress
SELECT						'GAMESPEED_EPIC',		12,				100					 UNION ALL -- Modern about 100 years (1900 - 2000)
SELECT						'GAMESPEED_EPIC',		6,				220					 UNION ALL  -- Post Modern about 100 Years (2000 - 2100)
SELECT						'GAMESPEED_EPIC',		1,				220					 UNION ALL -- Future about 400 years (2100 - 2500)
-- Normal
SELECT						'GAMESPEED_STANDARD',	480,			75					 UNION ALL -- Ancient
SELECT						'GAMESPEED_STANDARD',	300,			60					 UNION ALL -- Classical
SELECT						'GAMESPEED_STANDARD',	240,			25					 UNION ALL -- Medieval
SELECT						'GAMESPEED_STANDARD',	120,			50					 UNION ALL -- Renassiance
SELECT						'GAMESPEED_STANDARD',	60,				60					 UNION ALL -- Industrial
SELECT						'GAMESPEED_STANDARD',	24,				50					 UNION ALL -- Modern
SELECT						'GAMESPEED_STANDARD',	12,				120					 UNION ALL  -- Post Modern
SELECT						'GAMESPEED_STANDARD',	6,				60					 UNION ALL -- Future
-- Fast
SELECT						'GAMESPEED_QUICK',		720,			50					 UNION ALL -- Ancient
SELECT						'GAMESPEED_QUICK',		480,			30					 UNION ALL -- Classical
SELECT						'GAMESPEED_QUICK',		360,			20					 UNION ALL -- Medieval
SELECT						'GAMESPEED_QUICK',		240,			30					 UNION ALL -- Renassiance
SELECT						'GAMESPEED_QUICK',		120,			25					 UNION ALL -- Industrial
SELECT						'GAMESPEED_QUICK',		60,				40					 UNION ALL -- Modern
SELECT						'GAMESPEED_QUICK',		24,				65					 UNION ALL -- Post Modern
SELECT						'GAMESPEED_QUICK',		12,				70;							   -- Future