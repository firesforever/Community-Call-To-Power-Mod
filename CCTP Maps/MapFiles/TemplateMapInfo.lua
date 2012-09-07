-- MapInfo File
-- Template Author: FiresForever
-- Author: YOUR NAME HERE
-- Map Name: 
-- Map Author: AUTHOR NAME HERE
--------------------------------------------------------------
WorldSize = {
0,0
}

MapPoint = {

}

MapOptions = {
--Notes:
--(0/1) option where 1 = Available and 0 = not available
-- World size determines the default number of civs and city states, where '5' is the max and represents a huge 
-- World Sizes: 0 =  Duel, 1 = Tiny, 2 = Small, 3 = Standard, 4 = Large, 5 = Huge
-- Order:
-- True Start Locations (0/1) , Real Resource Placement (0/1), World Size,
 
0,0,0,

}


CivInfo = {
--Sets the True Starting Location of civs
--Add new Civs before the "end" entry at the end of this list
--{Civ, x location, y location)

-- Civs: 
--{"CIVILIZATION_AMERICA",0,0}, {"CIVILIZATION_ARABIA",0,0}, {"CIVILIZATION_AZTEC",0,0}, {"CIVILIZATION_CHINA",0,0}, {"CIVILIZATION_ENGLAND",0,0}, 
--{"CIVILIZATION_FRANCE",0,0}, {"CIVILIZATION_GERMANY",0,0}, {"CIVILIZATION_GREECE",0,0}, {"CIVILIZATION_INDIA",0,0}, {"CIVILIZATION_IROQUOIS",0,0}, 
--{"CIVILIZATION_JAPAN",0,0}, {"CIVILIZATION_OTTOMAN",0,0}, {"CIVILIZATION_PERSIA",0,0}, {"CIVILIZATION_ROME",0,0}, {"CIVILIZATION_RUSSIA",0,0}, 
--{"CIVILIZATION_SIAM",0,0}, {"CIVILIZATION_SONGHAI",0,0}, 
--{"CIVILIZATION_SPAIN",0,0}, {"CIVILIZATION_INCA",0,0}, {"CIVILIZATION_BABYLON",0,0}, {"CIVILIZATION_POLYNESIA",0,0}, {"CIVILIZATION_DENMARK",0,0}, 
--{"CIVILIZATION_KOREA",0,0}, {"CIVILIZATION_MONGOL",0,0},
--{"CIVILIZATION_AUSTRIA",0,0}, {"CIVILIZATION_BYZANTIUM",0,0}, {"CIVILIZATION_CARTHAGE",0,0}, {"CIVILIZATION_CELTS",0,0}, {"CIVILIZATION_ETHIOPIA",0,0}, 
--{"CIVILIZATION_HUNS",0,0}, {"CIVILIZATION_MAYA",0,0}, {"CIVILIZATION_NETHERLANDS",0,0}, {"CIVILIZATION_SWEDEN",0,0},
--{"CIVILIZATION_EGYPT",0,0},

{"end",0,0}

}

Scenario1 = {
-- These are the civs that will be used in the first scenario for the LEM Map
-- max number of civs, civs in this scenario, The civs allowed in this scenario
34,0,

}

Scenario1Details = {
--This sets up the txt and pictures for this
--Order: Title, Description, Picture


}


StateInfo = {

--This is a list of the possible city states for this map and their TSL's
--Order: {MinorCiv, x cord, y cord}
--Add new minor civs before the "end" entry at the end of the list

--{"MINOR_CIV_WARSAW",,}, {"MINOR_CIV_BUDAPEST",,}, {"MINOR_CIV_GENEVA",,}, {"MINOR_CIV_VENICE",,}, {"MINOR_CIV_GENOA",,},
--{"MINOR_CIV_FLORENCE",,}, {"MINOR_CIV_RAGUSA",,}, {"MINOR_CIV_SYDNEY",,}, {"MINOR_CIV_QUEBEC_CITY",,}, {"MINOR_CIV_BUCHAREST",,},
--{"MINOR_CIV_BELGRADE",,}, {"MINOR_CIV_BRUSSELS",,}, {"MINOR_CIV_MONACO",,}, {"MINOR_CIV_KATHMANDU",,}, {"MINOR_CIV_HANOI",,},
--{"MINOR_CIV_LHASA",,}, {"MINOR_CIV_ALMATY",,}, {"MINOR_CIV_KUALA_LUMPUR",,}, {"MINOR_CIV_SINGAPORE",,}, {"MINOR_CIV_RIO_DE_JANEIRO",,},

--{"MINOR_CAPE_TOWN",,}, {"MINOR_SIDON",,}, {"MINOR_TYRE",,},

--{"MINOR_CIV_ANTWERP",,}, {"MINOR_CIV_CAHOKIA",,}, {"MINOR_CIV_COLOMBO",,}, {"MINOR_CIV_HONG_KONG",,}, {"MINOR_CIV_JAKARTA",,},
--{"MINOR_CIV_JERUSALEM",,}, {"MINOR_CIV_LA_VENTA",,}, {"MINOR_CIV_LISBON",,}, {"MINOR_CIV_MANILA",,}, {"MINOR_CIV_MARRAKECH",,},
--{"MINOR_CIV_MILAN",,}, {"MINOR_CIV_MOMBASA",,}, {"MINOR_CIV_PRAGUE",,}, {"MINOR_CIV_VALLETTA",,}, {"MINOR_CIV_VATICAN_CITY",,},
--{"MINOR_CIV_WITTENBERG",,}, {"MINOR_CIV_YEREVAN",,}, {"MINOR_CIV_ZANZIBAR",,}, {"MINOR_CIV_ZURICH",,},

{"end",0,0}

}

NaturalWonders = {
--This is the list of possible wonders with their starting positions
--Add new Civs before the "end" entry at the end of this list
-- Order: {Wonder Type, x coord, y coord}

--{"FEATURE_CRATER",,}, {"FEATURE_FUJI",,}, {"FEATURE_MESA",,}, {"FEATURE_REEF",,}, {"FEATURE_VOLCANO",,},
--{"FEATURE_GIBRALTAR",,}, {"FEATURE_GEYSER",,}, {"FEATURE_FOUNTAIN_YOUTH",,}, {"FEATURE_POTOSI",,}, {"FEATURE_EL_DORADO",,},
--{"FEATURE_ATOLL",,}, {"FEATURE_SRI_PADA",,}, {"FEATURE_MT_SINAI",,}, {"FEATURE_MT_KAILASH",,}, {"FEATURE_ULURU",,},

{"end",0,0}

}

GoodyInfo = {

--Where goody huts should be placed - - These are not correct for LEM and need replacing
--Order: {x coord, y coord}

}
