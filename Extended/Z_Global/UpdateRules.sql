/*
CCTP Extended Rules
*/
-- Gamespeeds Adjustments 
DELETE FROM GameSpeeds WHERE Type IN ('GAMESPEED_MARATHON','GAMESPEED_EPIC','GAMESPEED_STANDARD','GAMESPEED_QUICK');

INSERT INTO GameSpeeds		(ID, Type,					Description,					Help,								DealDuration,	GrowthPercent,	TrainPercent,	ConstructPercent,	CreatePercent,	ResearchPercent,	GoldPercent,	GoldGiftMod,	BuildPercent,	ImprovementPercent, GreatPeoplePercent, CulturePercent, FaithPercent,	BarbPercent,	FeatureProductionPercent,	UnitDiscoverPercent,	UnitHurryPercent,	UnitTradePercent,	GoldenAgePercent,	HurryPercent,	InflationPercent,	InflationOffset,	ReligiousPressureAdjacentCity,	VictoryDelayPercent,	MinorCivElectionFreqMod,	OpinionDurationPercent, SpyRatePercent, PortraitIndex,	IconAtlas)
				 
				 SELECT		 0,	 'GAMESPEED_MARATHON',	'TXT_KEY_GAMESPEED_MARATHON',	'TXT_KEY_GAMESPEED_MARATHON_HELP',	75,				190,			105,			95,					100,			170,			    140,			130,	        130,			130,				130,				165,			165,			130,			130,						170,					95,					130,				130,				125,			50,					-202,				9,								130,					130,						130,					100,			0,				'GAMESPEED_ATLAS'		UNION ALL
				 SELECT		 1,	 'GAMESPEED_EPIC',		'TXT_KEY_GAMESPEED_EPIC',		'TXT_KEY_GAMESPEED_EPIC_HELP',	    60,				165,			100,			90,					95,				145,			    125,			120,	        120,			120,				120,				150,			150,			120,			120,						155,					95,					120,				120,				115,			40,					-172,				8,								120,					120,						120,					100,			1,				'GAMESPEED_ATLAS'		UNION ALL
				 SELECT		 2,	 'GAMESPEED_STANDARD',	'TXT_KEY_GAMESPEED_STANDARD',	'TXT_KEY_GAMESPEED_STANDARD_HELP',	45,				140,			95,				85,					90,				120,			    110,			110,	        110,			110,				110,				135,			135,			110,			110,						140,					95,					110,				110,				105,			30,					-142,				7,								110,					110,						110,					100,			2,				'GAMESPEED_ATLAS'		UNION ALL
				 SELECT		 3,	 'GAMESPEED_QUICK',		'TXT_KEY_GAMESPEED_QUICK',		'TXT_KEY_GAMESPEED_QUICK_HELP',     30,				115,			90,				80,					85,				95,				    95,				100,	        100,			100,				100,				120,			120,			100,			100,						125,					95,					100,				100,				95,				20,					-112,				6,								100,					100,						100,					100,			3,				'GAMESPEED_ATLAS';

-- Calender Adjustment
DROP TABLE IF EXISTS GameSpeed_Turns;
CREATE TABLE GameSpeed_Turns (  'GameSpeedType' text , 
								'MonthIncrement' integer , 
								'TurnsPerIncrement' integer , foreign key (GameSpeedType) references GameSpeeds(Type));
INSERT INTO GameSpeed_Turns (GameSpeedType,			MonthIncrement,	TurnsPerIncrement)
-- 75%
SELECT						'GAMESPEED_MARATHON',	12,				1750					 UNION ALL
-- 50%
SELECT						'GAMESPEED_EPIC',		12,				1500					 UNION ALL
-- 25%
SELECT						'GAMESPEED_STANDARD',	12,				1250					 UNION ALL
-- Normal
SELECT						'GAMESPEED_QUICK',		12,				1000;

-- Adjust Timer/Calendar on Topbar
UPDATE Defines SET Value = 0 WHERE Name = 'START_YEAR';
UPDATE Defines SET Value = 5 WHERE Name = 'STANDARD_CALENDAR';
UPDATE PostDefines SET Key = 'CALENDAR_SEASONS' WHERE Name = 'STANDARD_CALENDAR';