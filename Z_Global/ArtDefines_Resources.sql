-- Coffee --------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
	VALUES	('ART_DEF_RESOURCE_COFFEE_BEANS', 'Resource', 'Art/Resources/Coffee/SV_CoffeeBean.dds');

INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
	VALUES	('ART_DEF_RESOURCE_COFFEE_BEANS', 'Resource', 'Coffee Tree');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Any', 'Any', 0.9399999976158142, 'ART_DEF_IMPROVEMENT_NONE', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/resource_coffee.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Ancient', 'UnderConstruction', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/HB_Plantation_MID_Coffee.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Ancient', 'Constructed', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/plantation_mid_coffee.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Ancient', 'Pillaged', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/PL_Plantation_MID_Coffee.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Industrial', 'UnderConstruction', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/HB_Plantation_IND_Coffee.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Industrial', 'Constructed', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/plantation_ind_coffee.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
	VALUES	('Industrial', 'Pillaged', 0.9599999785423279, 'ART_DEF_IMPROVEMENT_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_COFFEE_BEANS', 'Art/Resources/Coffee/PL_Plantation_IND_Coffee.fxsxml', 1);
-- Jade --------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_LUBORIC', 'Resource', 'Jade') ;

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Any','Any',1.0,'ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/luboric.fxsxml',1) ;

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Ancient','UnderConstruction',1.0,'ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/hb_med_luboric_mine.fxsxml',1) ;

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Ancient','Constructed',1.0,'ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/med_mine_luboric.fxsxml',1) ;

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Ancient','Pillaged',1.0,'ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/pl_med_mine_luboric.fxsxml',1) ;

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Industrial','UnderConstruction',1.0,'ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/hb_ind_luboric_mine.fxsxml',1) ;

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Industrial','Constructed',1.0,'ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/ind_mine_luboric.fxsxml',1) ;

INSERT INTO ArtDefine_Landmarks (Era,State,Scale,ImprovementType,LayoutHandler,ResourceType,Model,TerrainContour)
VALUES ('Industrial','Pillaged',1.0,'ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_LUBORIC','Art/Resources/Jade/pl_ind_mine_luboric.fxsxml',1) ;
-- Titanium ---------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_TITANIUM', 'Resource', 'Titanium');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_TITANIUM','Resource','Art/Resources/Titanium/SV_Titanium.dds');

INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_TITANIUM_HEAVY', 'Resource', 'Titanium Heavy');

INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH', 'Resource', 'Titanium Heavy Marsh');

INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_TITANIUM_MARSH', 'Resource', 'Titanium Marsh');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/HB_MED_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/MED_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/PL_MED_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/HB_IND_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/IND_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/PL_IND_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM','Art/Resources/Titanium/Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/HB_MED_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/MED_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/PL_MED_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/HB_IND_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/IND_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/PL_IND_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY','Art/Resources/Titanium/Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/HB_MED_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/MED_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/PL_MED_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/HB_IND_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/IND_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/PL_IND_Mine_Titanium_Heavy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH','Art/Resources/Titanium/Titanium_Heavy_marsh.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/HB_MED_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/MED_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/PL_MED_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/HB_IND_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/IND_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/PL_IND_Mine_Titanium.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_TITANIUM_MARSH','Art/Resources/Titanium/Titanium_marsh.fxsxml','1',null);
-- Poppy ----------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_POPPY','Resource','Poppy');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_POPPY','Resource','Art/Resources/Poppy/SV_Poppy.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','0.9399999976158142','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/MAX_File/Resource_Poppy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/HB_Plantation_MID_Poppy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/Plantation_MID_Poppy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/PL_Plantation_MID_Poppy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/HB_Plantation_IND_Poppy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/Plantation_IND_Poppy.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_POPPY','Art/Resources/Poppy/PL_Plantation_IND_Poppy.fxsxml','1',null);
-- Tobacco -------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_TOBACCO','Resource','Tobacco');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_TOBACCO','Resource','Art/Resources/Tobacco/SV_Tobacco.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','0.9800000190734863','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/Resource_Tobacco.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/HB_Plantation_MID_Tobacco.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/Plantation_MID_Tobacco.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/PL_Plantation_MID_Tobacco.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/HB_Plantation_IND_Tobacco.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/Plantation_IND_Tobacco.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_TOBACCO','Art/Resources/Tobacco/PL_Plantation_IND_Tobacco.fxsxml','1',null);
-- Tin ----------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_TIN','Resource','Tin');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_TIN','Resource','Art/Resources/Tin/SV_Tin.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/Tin.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/HB_MED_Tin_Mine.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/MED_Mine_Tin.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/PL_MED_Mine_Tin.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/HB_IND_Tin_Mine.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/IND_Mine_Tin.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_TIN','Art/Resources/Tin/PL_MED_Mine_Tin.fxsxml','1',null);
-- Aloe Vera -----------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_ALOEVERA','Resource','Aloe Vera');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_ALOEVERA','Resource','Art/Resources/Aloe Vera/SV_Aloevera.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','0.9399999976158142','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/Resource_Aloevera.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/HB_Plantation_MID_Aloevera.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/Plantation_MID_Aloevera.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Ancient','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/PL_Plantation_MID_Aloevera.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','UnderConstruction','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/HB_Plantation_IND_Aloevera.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/Plantation_IND_Aloevera.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Pillaged','0.9599999785423279','ART_DEF_IMPROVEMENT_PLANTATION','SNAPSHOT','ART_DEF_RESOURCE_ALOEVERA','Art/Resources/Aloe Vera/PL_Plantation_IND_Aloevera.fxsxml','1',null);
-- Amber ---------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_AMBER','Resource','Amber');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_AMBER','Resource','Art/Resources/Amber/SV_Amber.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/Amber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/HB_MED_Amber_Mine.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/MED_Mine_Amber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/PL_MED_Mine_Amber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/HB_IND_Amber_Mine.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech) 
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/IND_Mine_Amber.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_AMBER','Art/Resources/Amber/PL_MED_Mine_Amber.fxsxml','1',null);
-- Manganese --------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_RESOURCE_MANGANESE','Resource','Manganese');

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_RESOURCE_MANGANESE','Resource','SV_Manganese.dds');

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Ancient','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/HB_MED_Mine_Manganese.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Ancient','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/MED_Mine_Manganese.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Ancient','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/PL_MED_Mine_Manganese.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Industrial','UnderConstruction','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/HB_IND_Mine_Manganese.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Industrial','Constructed','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/IND_Mine_Manganese.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Industrial','Pillaged','1','ART_DEF_IMPROVEMENT_MINE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/PL_IND_Mine_Manganese.fxsxml','1',null);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)  
VALUES ('Any','Any','1','ART_DEF_IMPROVEMENT_NONE','SNAPSHOT','ART_DEF_RESOURCE_MANGANESE','Art/Resources/Manganese/Manganese.fxsxml','1',null);