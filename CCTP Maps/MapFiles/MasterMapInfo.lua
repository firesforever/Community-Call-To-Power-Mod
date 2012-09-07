-- This file allows the system to know what maps, etc it can use

include("LEMMapInfo");
include("YNAEMEHMapInfo");

CCTPScenarios = {
-- This is the scenario data that each world should use. 
-- Order: 
--   World Number (1), Scenario (2), MapPoint (3), Map Size (4), Civ TSL Info (5), Minor Civ TSL Info (6), Natural Wonder Locations (7),
--	 Scenario Details (8), Map Options (9)

--{1,RNEScenario1,RNEMapPoint,RNEWorldSize,RNECivInfo,RNEStateInfo,RNENaturalWonders},
--{2,RNEScenario2,RNEMapPoint,RNEWorldSize,RNECivInfo,RNEStateInfo,RNENaturalWonders},
--{3,RNEScenario3,RNEMapPoint,RNEWorldSize,RNECivInfo,RNEStateInfo,RNENaturalWonders},
--{4,RNEScenario4,RNEMapPoint,RNEWorldSize,RNECivInfo,RNEStateInfo,RNENaturalWonders},
{5,LEMScenario1,LEMMapPoint,LEMWorldSize,LEMCivInfo,LEMStateInfo,LEMNaturalWonders,LEMScenario1Details,LEMMapOptions},
{6,LEMScenario2,LEMMapPoint,LEMWorldSize,LEMCivInfo,LEMStateInfo,LEMNaturalWonders,LEMScenario2Details,LEMMapOptions},
{7,LEMScenario3,LEMMapPoint,LEMWorldSize,LEMCivInfo,LEMStateInfo,LEMNaturalWonders,LEMScenario3Details,LEMMapOptions},
{8,YNAEMEHScenario1,YNAEMEHMapPoint,YNAEMEHWorldSize,YNAEMEHCivInfo,YNAEMEHStateInfo,YNAEMEHNaturalWonders,YNAEMEHScenario1Details, YNAEMEHMapOptions},
{"end",2,3,4,5,6,7,8,9},
}
