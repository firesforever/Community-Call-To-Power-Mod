-- Create new Art for farm, Polder Graphic scaled down 20%
INSERT INTO ArtDefine_Landmarks (Era,			State,					Scale,	ImprovementType,				LayoutHandler,	ResourceType,				Model,						TerrainContour, Tech)
SELECT							 'Ancient',		'UnderConstruction',	0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'SNAPSHOT',		'ART_DEF_RESOURCE_NONE',	'HB_ANC_Polder.fxsxml',		1,				null					UNION ALL
SELECT							 'Ancient',		'UnderConstruction',	0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'ANIMATED',		'ART_DEF_RESOURCE_NONE',	'ANC_Polder.fxsxml',		1,				null					UNION ALL
SELECT							 'Ancient',		'Constructed',			0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'SNAPSHOT',		'ART_DEF_RESOURCE_NONE',	'Polder_Blank.fxsxml',		1,				null					UNION ALL
SELECT							 'Ancient',		'Constructed',			0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'ANIMATED',		'ART_DEF_RESOURCE_NONE',	'ANC_Polder.fxsxml',		1,				null					UNION ALL
SELECT							 'Ancient',		'Pillaged',				0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'SNAPSHOT',		'ART_DEF_RESOURCE_NONE',	'PL_ANC_Polder.fxsxml',		1,				null					UNION ALL
SELECT							 'Ancient',		'Pillaged',				0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'ANIMATED',		'ART_DEF_RESOURCE_NONE',	'ANC_Polder.fxsxml',		1,				null					UNION ALL
SELECT							 'Ancient',		'UnderConstruction',	0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'SNAPSHOT',		'ART_DEF_RESOURCE_NONE',	'HB_IND_Polder.fxsxml',		1,				'TECH_ECONOMICS'		UNION ALL
SELECT							 'Ancient',		'UnderConstruction',	0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'ANIMATED',		'ART_DEF_RESOURCE_NONE',	'IND_Polder.fxsxml',		1,				'TECH_ECONOMICS'		UNION ALL
SELECT							 'Ancient',		'Constructed',			0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'ANIMATED',		'ART_DEF_RESOURCE_NONE',	'IND_Polder.fxsxml',		1,				'TECH_ECONOMICS'		UNION ALL
SELECT							 'Ancient',		'Constructed',			0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'SNAPSHOT',		'ART_DEF_RESOURCE_NONE',	'Polder_Blank.fxsxml',		1,				'TECH_ECONOMICS'		UNION ALL
SELECT							 'Ancient',		'Pillaged',				0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'SNAPSHOT',		'ART_DEF_RESOURCE_NONE',	'PL_IND_Polder.fxsxml',		1,				'TECH_ECONOMICS'		UNION ALL
SELECT							 'Ancient',		'Pillaged',				0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'ANIMATED',		'ART_DEF_RESOURCE_NONE',	'IND_Polder.fxsxml',		1,				'TECH_ECONOMICS'		UNION ALL
SELECT							 'Industrial',	'UnderConstruction',	0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'SNAPSHOT',		'ART_DEF_RESOURCE_NONE',	'HB_IND_Polder.fxsxml',		1,				null					UNION ALL
SELECT							 'Industrial',	'UnderConstruction',	0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'ANIMATED',		'ART_DEF_RESOURCE_NONE',	'IND_Polder.fxsxml',		1,				null					UNION ALL
SELECT							 'Industrial',	'Constructed',			0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'ANIMATED',		'ART_DEF_RESOURCE_NONE',	'IND_Polder.fxsxml',		1,				null					UNION ALL
SELECT							 'Industrial',	'Constructed',			0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'SNAPSHOT',		'ART_DEF_RESOURCE_NONE',	'Polder_Blank.fxsxml',		1,				null					UNION ALL
SELECT							 'Industrial',	'Pillaged',				0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'SNAPSHOT',		'ART_DEF_RESOURCE_NONE',	'PL_IND_Polder.fxsxml',		1,				null					UNION ALL
SELECT							 'Industrial',	'Pillaged',				0.8,	'ART_DEF_IMPROVEMENT_NEWFARM',	'ANIMATED',		'ART_DEF_RESOURCE_NONE',	'IND_Polder.fxsxml',		1,				null;
--
INSERT INTO ArtDefine_LandmarkTypes	(Type,							LandmarkType,	FriendlyName) 
VALUES								('ART_DEF_IMPROVEMENT_NEWFARM',	'Improvement',	'Farm');
-- Update Farm Art Define
UPDATE Improvements 
SET ArtDefineTag = 'ART_DEF_IMPROVEMENT_NEWFARM' WHERE Type = 'IMPROVEMENT_FARM';