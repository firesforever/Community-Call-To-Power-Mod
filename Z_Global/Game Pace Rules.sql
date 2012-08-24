-- Insert SQL Rules Here
 
-- Must also do techs in reverse order due to cost increases causing a tech to potentially cross
-- the next-highest threshold.

--TECHNOLOGY COST
--Nano Era
UPDATE Technologies
SET Cost = Cost * 3.0
WHERE Cost >= 8236;

--Digital Era
UPDATE Technologies
SET Cost = Cost * 2.8
WHERE Cost >= 5413
AND Cost < 8236;

--Modern Era
UPDATE Technologies
SET Cost = Cost * 2.2
WHERE Cost >= 1799
AND Cost < 5413;

--Industrial Era
UPDATE Technologies
SET Cost = Cost * 2.44
WHERE Cost >= 583
AND Cost < 1779;

--Renaissance Era
UPDATE Technologies
SET Cost = Cost * 2.75
WHERE Cost >= 190
AND Cost < 583;

--Medieval Era
UPDATE Technologies
SET Cost = Cost * 2.65
WHERE Cost >= 60
AND Cost < 190;

--Classical Era
UPDATE Technologies
SET Cost = Cost * 2.4
WHERE Cost >= 50
AND Cost < 60;

--Rest of Ancient Era
UPDATE Technologies
SET Cost = Cost * 2.25
WHERE Cost >= 30
AND Cost < 50;

--Ancient Tier 1
UPDATE Technologies
SET Cost = Cost * 1.875
WHERE Cost >= 0
AND Cost < 30;

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

--Goody Huts only Ancient Techs
UPDATE Technologies
SET GoodyTech = 0
WHERE Era IN ('ERA_CLASSICAL', 'ERA_MEDIEVAL', 'ERA_RENAISSANCE', 'ERA_INDUSTRIAL', 'ERA_MODERN', 'ERA_POSTMODERN', 'ERA_FUTURE');

-- Game Options
UPDATE GameOptions SET "Default" = 1 WHERE Type = 'GAMEOPTION_POLICY_SAVING';
UPDATE GameOptions SET "Default" = 1 WHERE Type = 'GAMEOPTION_PROMOTION_SAVING';

-- Gamespeeds Adjustments 
DELETE FROM GameSpeeds WHERE Type IN ('GAMESPEED_MARATHON','GAMESPEED_EPIC','GAMESPEED_STANDARD','GAMESPEED_QUICK');
-- Crawl 																											Crawl																													Crawl																									Crawl																										Crawl																																Crawl
INSERT INTO "GameSpeeds" (ID, Type,					Description,					Help,								DealDuration,	GrowthPercent,	TrainPercent,	ConstructPercent,	CreatePercent,	ResearchPercent,	GoldPercent,	GoldGiftMod,	BuildPercent,	ImprovementPercent, GreatPeoplePercent, CulturePercent, FaithPercent,	BarbPercent,	FeatureProductionPercent,	UnitDiscoverPercent,	UnitHurryPercent,	UnitTradePercent,	GoldenAgePercent,	HurryPercent,	InflationPercent,	InflationOffset,	ReligiousPressureAdjacentCity,	VictoryDelayPercent,	MinorCivElectionFreqMod,	OpinionDurationPercent, SpyRatePercent, PortraitIndex,	IconAtlas)
				 VALUES  ("0",'GAMESPEED_MARATHON','TXT_KEY_GAMESPEED_MARATHON',	'TXT_KEY_GAMESPEED_MARATHON_HELP',	"90",			"450",			"300",			"300",				"300",			"450",				"300",			"67",			"300",			"300",				"300",				"375",			"450",			"400",			"300",						"375",					"375",				"300",				"200",				"100",			"5",				"-330",				"2",							"300",					"300",						"300",					"100",			"0",			'GAMESPEED_ATLAS');
-- Slow
INSERT INTO "GameSpeeds" (ID, Type,				    Description,			        Help,							    DealDuration,	GrowthPercent,	TrainPercent,	ConstructPercent,	CreatePercent,	ResearchPercent,	GoldPercent,	GoldGiftMod,	BuildPercent,	ImprovementPercent, GreatPeoplePercent, CulturePercent, FaithPercent,	BarbPercent,	FeatureProductionPercent,	UnitDiscoverPercent,	UnitHurryPercent,	UnitTradePercent,	GoldenAgePercent,	HurryPercent,	InflationPercent,	InflationOffset,	ReligiousPressureAdjacentCity,	VictoryDelayPercent,	MinorCivElectionFreqMod,	OpinionDurationPercent, SpyRatePercent, PortraitIndex,	IconAtlas)
				 VALUES  ("1",'GAMESPEED_EPIC','TXT_KEY_GAMESPEED_EPIC','TXT_KEY_GAMESPEED_EPIC_HELP',	                "45",			"225",			"135",			"135",				"150",			"225",				"150",			"75",			"150",			"225",				"150",				"188",			"188",			"150",			"150",						"188",					"188",				"150",				"125",				"100",			"10",				"-169",				"4",							"150",					"150",						"150",					"100",			"1",			'GAMESPEED_ATLAS');
-- Normal
INSERT INTO "GameSpeeds" (ID, Type,				    Description,					Help,								DealDuration,	GrowthPercent,	TrainPercent,	ConstructPercent,	CreatePercent,	ResearchPercent,    GoldPercent,    GoldGiftMod,    BuildPercent,   ImprovementPercent, GreatPeoplePercent, CulturePercent, FaithPercent,   BarbPercent,	FeatureProductionPercent,	UnitDiscoverPercent,	UnitHurryPercent,	UnitTradePercent,	GoldenAgePercent, HurryPercent, InflationPercent,		InflationOffset,	ReligiousPressureAdjacentCity,	VictoryDelayPercent,	MinorCivElectionFreqMod,	OpinionDurationPercent, SpyRatePercent, PortraitIndex, IconAtlas)
				 VALUES  ("2",'GAMESPEED_STANDARD','TXT_KEY_GAMESPEED_STANDARD','TXT_KEY_GAMESPEED_STANDARD_HELP',	    "30",			"115",			"100",			"100",				"100",			"100",			    "100",		    "100",	        "100",          "100",              "100",              "125",          "125",          "100",			"100",						"125",					"125",				"100",				"100",            "100",        "20",					"-112",				"6",							"100",					"100",						"100",                  "100",          "2",           'GAMESPEED_ATLAS');
-- Fast
INSERT INTO "GameSpeeds" (ID, Type,                 Description,                    Help,                               DealDuration,   GrowthPercent,  TrainPercent,   ConstructPercent,   CreatePercent,  ResearchPercent,    GoldPercent,   GoldGiftMod,     BuildPercent,   ImprovementPercent, GreatPeoplePercent, CulturePercent, FaithPercent,   BarbPercent,	FeatureProductionPercent,	UnitDiscoverPercent,	 UnitHurryPercent,	UnitTradePercent,	GoldenAgePercent, HurryPercent, InflationPercent,		InflationOffset,	ReligiousPressureAdjacentCity,	VictoryDelayPercent,	MinorCivElectionFreqMod,	OpinionDurationPercent, SpyRatePercent, PortraitIndex, IconAtlas)
				 VALUES  ("3",'GAMESPEED_QUICK','TXT_KEY_GAMESPEED_QUICK','TXT_KEY_GAMESPEED_QUICK_HELP',               "25",           "84",           "67",           "67",               "67",           "84",               "67",          "125",           "67",           "84",               "67",               "84",           "84",           "67",			"67",						"84",					 "84",				"67",				"80",             "100",        "35",					"-90",				"9",							"67",					"67",						"67",                   "30",           "3",           'GAMESPEED_ATLAS');

-- Calender Adjustment
DROP TABLE IF EXISTS "GameSpeed_Turns";
CREATE TABLE GameSpeed_Turns (  'GameSpeedType' text , 
								'MonthIncrement' integer , 
								'TurnsPerIncrement' integer , foreign key (GameSpeedType) references GameSpeeds(Type));
-- Crawl
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_MARATHON',180,100); -- Ancient
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_MARATHON',120,300); -- Classical
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_MARATHON',60,170); -- Medieval
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_MARATHON',24,201); -- Renassiance
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_MARATHON',12,129); -- Industrial
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_MARATHON',6,180); -- Modern
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_MARATHON',3,264);  -- Post Modern
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_MARATHON',1,156); -- Future
-- Slow
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_EPIC',247,155); -- Ancient bout 3200 years(4000BC - 800BC) - Complete
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_EPIC',120,140); -- Classical about 1400 Years(800BC - 600AD) - Complete
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_EPIC',70,155); -- Medieval about 900 years(600AD - 1500AD) - Complete
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_EPIC',19,190); -- Renassiance about 250 years (1500AD - 1750AD) - Complete
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_EPIC',24,70); -- Industrial about 150 years (1750 - 1900) - Inprogress
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_EPIC',12,100); -- Modern about 100 years (1900 - 2000)
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_EPIC',6,220);  -- Post Modern about 100 Years (2000 - 2100)
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_EPIC',1,220); -- Future about 400 years (2100 - 2500)
-- Normal
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_STANDARD',480,75); -- Ancient
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_STANDARD',300,60); -- Classical
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_STANDARD',240,25); -- Medieval
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_STANDARD',120,50); -- Renassiance
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_STANDARD',60,60); -- Industrial
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_STANDARD',24,50); -- Modern
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_STANDARD',12,120);  -- Post Modern
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_STANDARD',6,60); -- Future
-- Fast
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_QUICK',720,50); -- Ancient
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_QUICK',480,30); -- Classical
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_QUICK',360,20); -- Medieval
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_QUICK',240,30); -- Renassiance
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_QUICK',120,25); -- Industrial
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_QUICK',60,40); -- Modern
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_QUICK',24,65);  -- Post Modern
INSERT INTO "GameSpeed_Turns" VALUES('GAMESPEED_QUICK',12,70); -- Future









