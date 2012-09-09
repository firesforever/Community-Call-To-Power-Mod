-- This file allows the system to know what maps, etc it can use

include("LEMMapInfo");
include("YNAEMEHMapInfo");
include("YNAEMESMapInfo");
include("YNAEMEULMapInfo");

CCTPScenarios = {
-- This is the scenario data that each world should use. 
-- Order: 
--   World Number (1), Scenario (2), MapPoint (3), Map Size (4), Civ TSL Info (5), Minor Civ TSL Info (6), Natural Wonder Locations (7),
--	 Scenario Details (8), Map Options (9)

{1,LEMScenario1,LEMMapPoint,LEMWorldSize,LEMCivInfo,LEMStateInfo,LEMNaturalWonders,LEMScenario1Details,LEMMapOptions},
{2,LEMScenario2,LEMMapPoint,LEMWorldSize,LEMCivInfo,LEMStateInfo,LEMNaturalWonders,LEMScenario2Details,LEMMapOptions},
{3,LEMScenario3,LEMMapPoint,LEMWorldSize,LEMCivInfo,LEMStateInfo,LEMNaturalWonders,LEMScenario3Details,LEMMapOptions},
{4,YNAEMEHScenario1,YNAEMEHMapPoint,YNAEMEHWorldSize,YNAEMEHCivInfo,YNAEMEHStateInfo,YNAEMEHNaturalWonders,YNAEMEHScenario1Details, YNAEMEHMapOptions},
{5,YNAEMESScenario1,YNAEMESMapPoint,YNAEMESWorldSize,YNAEMESCivInfo,YNAEMESStateInfo,YNAEMESNaturalWonders,YNAEMESScenario1Details, YNAEMESMapOptions},
{6,YNAEMEULScenario1,YNAEMEULMapPoint,YNAEMEULWorldSize,YNAEMEULCivInfo,YNAEMEULStateInfo,YNAEMEULNaturalWonders,YNAEMEULScenario1Details,YNAEMEULMapOptions},
{"end",2,3,4,5,6,7,8,9},
}
