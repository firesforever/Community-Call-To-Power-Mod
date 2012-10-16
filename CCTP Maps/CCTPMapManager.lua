-- CCTP MapManager
-- By: Firesforever
-- Thanks: Seraphim for the RNE mod
--------------------------------------------------------------

include("MapGenerator");
include("FeatureGenerator");
include("TerrainGenerator");
include("AssignStartingPlots");

include("MasterMapInfo");

local tmpstring;
local tmpint;
function GetMapScriptInfo()
	local world_age, temperature, rainfall, sea_level, resources = GetCoreMapOptions()
	return {
		Name = "TXT_KEY_MAP_CCTP_TITLE",
		Description = "TXT_KEY_CCTP_TITLE",
		SupportsMultiplayer = true,
		IconIndex = 3,

	}
end

function GetMapInitData(worldSize)
	-- This function can reset map grid sizes or world wrap settings. w124, h68
	modver = 1;
	modid = "CCTP";
	modUserData = Modding.OpenUserData(modid, modver);
	
	local i = 1;
	local WorldChosen = modUserData.GetValue ("MapSelected")
	local worldxy
	local WorldSizes = {}
	local WorldSize = {}
	
	for k, v in ipairs(CCTPScenarios) do
		WorldSizes = CCTPScenarios [k]
		if WorldChosen == WorldSizes [1] then
			worldxy = WorldSizes [4]
		end
	end

	return {
		Width = worldxy[1],
		Height = worldxy[2],
		WrapX = true,
	};      
end

function GeneratePlotTypes()
	print("CCTP - Generating Plot Types");
	local WorldChosen = modUserData.GetValue ("MapSelected")
	local MapPoint
	local MapPoints = {}

	-- Need to Add here, identifies which map data the chosen world uses
	for k, v in ipairs(CCTPScenarios) do
		MapPoints = CCTPScenarios [k]
		if WorldChosen == MapPoints [1] then
			MapPoint = MapPoints [3]
		end
	end
	
	local sPlotInfo = nil;
	local iArray = {};
	for i = 1,  Map.GetNumPlots() , 1 do
		if MapPoint[i] == nil then
			break;
		end
		sPlotInfo = MapPoint[i];
		tmpstring = string.sub(sPlotInfo, 1, 1);
		tmpint = tonumber(tmpstring, 16);
		if tmpint > 5 then
			iArray[i] = PlotTypes.PLOT_OCEAN;
			--plot:SetPlotType(PlotTypes.PLOT_OCEAN, false, false);
		else
			tmpint = tonumber(string.sub(sPlotInfo, 8, 8), 16);
			if tmpint == 2 then
				iArray[i] = PlotTypes.PLOT_MOUNTAIN;
			elseif tmpint == 1 then
				iArray[i] = PlotTypes.PLOT_HILLS;
			elseif tmpint == 5 then
				iArray[i] = PlotTypes.PLOT_COAST;
			else
				iArray[i] = PlotTypes.PLOT_LAND;
			end
		end
	end
	SetPlotTypes(iArray);
	print("CCTP - Setting coasts and oceans");
	local shallowWater = GameDefines.SHALLOW_WATER_TERRAIN;
	local deepWater = GameDefines.DEEP_WATER_TERRAIN;

	for i, plot in Plots() do
		if iArray[i] == PlotTypes.PLOT_COAST then
			plot:SetTerrainType(shallowWater, false, false);
		end
		if iArray[i] == PlotTypes.PLOT_OCEAN then
			plot:SetTerrainType(deepWater, false, false);
		end
	end
end

----------------------------------------------------------------------------------
function GenerateTerrain()
	print("CCTP - Setting Land Terrains");
	local WorldChosen = modUserData.GetValue ("MapSelected")
	local MapPoint
	local MapPoints = {}

	-- Need to Add here, identifies which map data the chosen world uses
	for k, v in ipairs(CCTPScenarios) do
		MapPoints = CCTPScenarios [k]
		if WorldChosen == MapPoints [1] then
			MapPoint = MapPoints [3]
		end
	end
	
	local TerrainsArg = { GameInfoTypes["TERRAIN_GRASS"], GameInfoTypes["TERRAIN_PLAINS"], GameInfoTypes["TERRAIN_DESERT"], GameInfoTypes["TERRAIN_TUNDRA"],
		GameInfoTypes["TERRAIN_SNOW"], GameDefines.SHALLOW_WATER_TERRAIN, GameDefines.DEEP_WATER_TERRAIN}

	local sPlotInfo = nil;
	local iArray = {};
	for i = 0,  Map.GetNumPlots() - 1, 1 do
		if MapPoint[i+1] == nil then
			break;
		end
		
		sPlotInfo = MapPoint[i+1];
		tmpstring = string.sub(sPlotInfo, 1, 1);
		tmpint = tonumber(tmpstring, 16) + 1;

		iArray[i] = TerrainsArg[tmpint];
		--print(TerrainsArg[tmpint]);
	end
	local mount = GameInfoTypes["TERRAIN_MOUNTAIN"];
	local hill = GameInfoTypes["TERRAIN_HILL"];
	for i, plot in Plots() do
		plot:SetTerrainType(iArray[i], false, false);
	end
end
----------------------------------------------------------------------------------
function AddFeatures()
	print("CCTP - Setting Features");
	local WorldChosen = modUserData.GetValue ("MapSelected")
	local MapPoint
	local MapPoints = {}

	-- Need to Add here, identifies which map data the chosen world uses
	for k, v in ipairs(CCTPScenarios) do
		MapPoints = CCTPScenarios [k]
		if WorldChosen == MapPoints [1] then
			MapPoint = MapPoints [3]
		end
	end
	
	local FeaturesArg = { FeatureTypes.FEATURE_ICE, FeatureTypes.FEATURE_JUNGLE, FeatureTypes.FEATURE_MARSH,
		FeatureTypes.FEATURE_OASIS, FeatureTypes.FEATURE_FLOOD_PLAINS, FeatureTypes.FEATURE_FOREST, FeatureTypes.FEATURE_FALLOUT,
		GameInfo.Features.FEATURE_ATOLL}
	if FeaturesArg[8] then
		FeaturesArg[8] = FeaturesArg[8].ID;
	end
	local sPlotInfo = nil;
	local iArray = {};
	for i = 0,  Map.GetNumPlots() - 1, 1 do
		if MapPoint[i+1] == nil then
			break;
		end
		
		sPlotInfo = MapPoint[i+1];
		tmpstring = string.sub(sPlotInfo, 4, 5);
		if tmpstring == "FF" then
			iArray[i] = FeatureTypes.NO_FEATURE;
			--print(i, iArray[i]);
		else
			tmpint = tonumber(tmpstring, 16) + 1;
			iArray[i] = FeaturesArg[tmpint];
			--print("F",tmpstring, tmpint, FeaturesArg[tmpint], i)
		end
	end
	--SetTerrainTypes(iArray);
	for i, plot in Plots() do
		if iArray[i] ~= FeatureTypes.NO_FEATURE then
			plot:SetFeatureType(iArray[i], -1);
		end
	end


end

function AddRivers()
	print("CCTP - Adding Rivers");
	local WorldChosen = modUserData.GetValue ("MapSelected")
	local MapPoint
	local MapPoints = {}

	-- Need to Add here, identifies which map data the chosen world uses
	for k, v in ipairs(CCTPScenarios) do
		MapPoints = CCTPScenarios [k]
		if WorldChosen == MapPoints [1] then
			MapPoint = MapPoints [3]
		end
	end
	
	local LastPlotstring = nil;
	local iArray = {};
	for i, plot in Plots() do
		if MapPoint[i+1] == nil then
			break;
		end
		LastPlotstring = MapPoint[i+1];
		tmpstring = string.sub(LastPlotstring, 7, 7);
		--print("river",i,LastPlotstring,tmpstring);
		LastPlot = plot;
		if tonumber(tmpstring, 16) > 0 and LastPlot ~= nil then
			tmpint = tonumber(tmpstring, 16);
			local d1 = FlowDirectionTypes.FLOWDIRECTION_NORTH;
			local r1 = false;
			local r2 = false;
			local r3 = false;
			local d2 = FlowDirectionTypes.FLOWDIRECTION_SOUTHWEST;
			local d3 = FlowDirectionTypes.FLOWDIRECTION_SOUTHEAST;
			if tmpint > 7 then
				d1 = FlowDirectionTypes.FLOWDIRECTION_SOUTH;
				tmpint = tmpint - 8;
			end
			if tmpint > 3 then
				r3 = true;
				tmpint = tmpint - 4;
			end
			if tmpint > 1 then
				r2 = true;
				tmpint = tmpint - 2;
			end
			if tmpint > 0 then
				r1 = true;
			end
			tmpstring = string.sub(LastPlotstring, 6, 6);
			tmpint = tonumber(tmpstring, 16);
			if tmpint > 7 then
				tmpint = tmpint - 8;
			end
			if tmpint > 3 then
				tmpint = tmpint - 4;
			end
			if tmpint > 1 then
				d3 = FlowDirectionTypes.FLOWDIRECTION_NORTHWEST;
				tmpint = tmpint - 2;
			end
			if tmpint > 0 then
				d2 = FlowDirectionTypes.FLOWDIRECTION_NORTHEAST;
			end
			if r1 then
				LastPlot:SetWOfRiver(r1, d1);
			end
			if r2 then
				LastPlot:SetNWOfRiver(r2, d2);
			end
			if r3 then
				LastPlot:SetNEOfRiver(r3, d3);
			end
			--print("river",i,r1,r2,r3,d1,d2,d3);
		end
	end
end

function StartPlotSystem()
	
	print("Creating start plot database.");
	local start_plot_database = AssignStartingPlots.Create()
	
	print("CCTP - Placing Natural Wonders.");
	CCTPPlaceNaturalWonders()

	local TRL = modUserData.GetValue ("TRL")
	print ("TRL Option", TRL)
	
	
	if TRL == 1 then
		print("CCTP - Placing Real Resources.");
		CCTPPlaceResources()
	else
		print("CCTP - Placing Random Resources");
		start_plot_database:PlaceResourcesAndCityStates()
	end
	
	print("CCTP - Placing Units of Barbarian.");
	--CCTPPlaceBarbarianUnits()
	
	local TSLorRSL = modUserData.GetValue ("TSLorRSL")
	print ("TSL Option", TSLorRSL)
	
	if TSLorRSL == 2 then
		print("Choosing Random locations for Players.");
		start_plot_database:GenerateRegions();
		start_plot_database:ChooseLocations()
		start_plot_database:BalanceAndAssign()
	else
		print("CCTP - Assigning TSL locations to Players.");
		CCTPBalanceAndAssign()
	end
end

function CCTPPlaceResources()

--	local sPlotInfo = nil;
--	local iArray = {};
--	local iArray2 = {};
--	for i = 0,  Map.GetNumPlots() - 1, 1 do
--		if MapPoint[i+1] == nil then
--			break;
--		end
		
--		sPlotInfo = MapPoint[i+1];
--		tmpstring = string.sub(sPlotInfo, 2, 3);
--		if tmpstring ~= "FF" then
--			tmpint = tonumber(tmpstring, 16) ;
--			tmpstring = string.sub(sPlotInfo, -1, -1);
--			iArray[i] = tmpint;
--			tmpint = tonumber(tmpstring, 16);
--			iArray2[i] = tmpint;
--		else
--			iArray[i] = -1;
--		end
--	end
--	for i, plot in Plots() do
--		if iArray[i] ~= -1 then
--			--print(i,iArray[i],iArray2[i]);
--			plot:SetResourceType(iArray[i], iArray2[i]);
--		end
--	end
end

function CCTPPlaceNaturalWonders()
	local WorldChosen = modUserData.GetValue ("MapSelected")
	local NWonderlist = {}
	local NWonders = {}
	local NWonder = {}
	
	--Lets get a list of possible features
	local sql = [[	SELECT 
					Features.ID AS ID, 
					Features.Type AS Type
					FROM Features
				]];	

	for k, v in ipairs(CCTPScenarios) do
		NWonderlist = CCTPScenarios [k]
		if WorldChosen == NWonderlist [1] then
			NWonders = NWonderlist [7]
		end
	end
	

	for row in DB.Query(sql) do
		local n = 1
		local found = 0
		
		repeat
			NWonder = NWonders [n]
			if row.Type == NWonder [1] then
				local plot = Map.GetPlot(NWonder[2], NWonder[3]);
				--plot:SetPlotType(PlotTypes.PLOT_MOUNTAIN, false, false);
				plot:SetFeatureType(row.ID, -1)
				--plot:SetTerrainType(row.ID, false, false)
				
				found = 1
			else
				n = n + 1
			end
		until found == 1 or NWonder[1] == "end"
	
	end

end

function CCTPBalanceAndAssign()
	
	local WorldChosen = modUserData.GetValue ("MapSelected")
	local civxy = {}
	local civxys = {}
	local civsxy = {}

	-- Identifies which map data the chosen world uses
	for k, v in ipairs(CCTPScenarios) do
		civxys = CCTPScenarios [k]
		if WorldChosen == civxys [1] then
			civxy = civxys [5]
		end
	end
	
	local sql = [[	SELECT 
					Civilizations.ID AS ID, 
					Civilizations.Type AS Type 
					FROM Civilizations
				]];	
	
	local i = 0
	local playerID 
	local pPlayer = {}
	local n = 1
	local found = 0
	local numCivs = modUserData.GetValue ("numCivs")
	
	for row in DB.Query(sql) do
		local endFile = "notEnd"
		i = 0
		n = 1
		found = 0
		repeat 
			pPlayer = Players[i];
			playerID = pPlayer:GetCivilizationType()
			--print (row.Type)
			--print (playerID)
			if row.ID == playerID and i ~= (numCivs - 1) then
				--print ("Matching civ IDs found")
				repeat 
					civsxy = civxy [n]
					local thisCiv = civsxy[1]
					if thisCiv == row.Type then
						--print ("Placing civ now")
						Players[i]:SetStartingPlot(Map.GetPlot(civsxy [2], civsxy [3]));
						found = 1
						print ( "Placing " .. row.Type .. " at : " .. civsxy [2] .. ", " .. civsxy [3])
					else
						n = n + 1
						--print (n)
					end	
				until found == 1 or civsxy[1] == "end"
				endFile = civsxy[1]
			else 
				i = i + 1
			end
		until found == 1 or playerID == -1	or endFile == "end"
	end
		
	-- Now lets set the minor civs to the starting positions
	local civxy = {}
	local civxys = {}
	local civsxy = {}

	-- Identifies which map data the chosen world uses
	for k, v in ipairs(CCTPScenarios) do
		civxys = CCTPScenarios [k]
		if WorldChosen == civxys [1] then
			civxy = civxys [6]
		end
	end
	
	local sql = [[	SELECT 
				MinorCivilizations.ID AS ID, 
				MinorCivilizations.Type AS Type 
				FROM MinorCivilizations
			]];	
			
	for iPlayerLoop = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		CivID = Players[iPlayerLoop]:GetMinorCivType();
		
		local n = 1
		local found = 0
		
		--Match the ID number to sql database so can find Type
		for row in DB.Query(sql) do
			if CivID == row.ID then
				--Then match the Type to the start location		
				repeat
					civsxy = civxy [n]
					local thisMinor = civsxy[1]
					if row.Type == thisMinor then
						print ("minor civ start found", row.Type)
						Players[iPlayerLoop]:SetStartingPlot(Map.GetPlot(civsxy [2], civsxy [3]));
						found = 1
					else
						n = n +1
					end
				until found == 1 or civsxy[1] == "end"
			end
		end
	end
end

function CCTPPlaceBarbarianUnits()
	local archerID = GameInfo.Units.UNIT_BARBARIAN_ARCHER.ID;
	local archerAI = GameInfo.UnitAIInfos.UNITAI_RANGED.ID;
	local warriorID = GameInfo.Units.UNIT_BARBARIAN_WARRIOR.ID;
	local spearID = GameInfo.Units.UNIT_BARBARIAN_SPEARMAN.ID;
	local swordID = GameInfo.Units.UNIT_BARBARIAN_SWORDSMAN.ID;
	local meleeAI = GameInfo.UnitAIInfos.UNITAI_ATTACK.ID;
	local galleyID = GameInfo.Units.UNIT_GALLEY.ID;
	local galleyAI = GameInfo.UnitAIInfos.UNITAI_ATTACK_SEA.ID;
	if IsHasCiv(GameInfo.Civilizations.CIVILIZATION_ENGLAND.ID) then
		Players[GameDefines.BARBARIAN_PLAYER]:InitUnit (archerID, 51, 60, archerAI );
	end
	if IsHasCiv(GameInfo.Civilizations.CIVILIZATION_RUSSIA.ID) then
		Players[GameDefines.BARBARIAN_PLAYER]:InitUnit (archerID, 77, 56, archerAI );
		Players[GameDefines.BARBARIAN_PLAYER]:InitUnit (warriorID, 73, 57, meleeAI );
		Players[GameDefines.BARBARIAN_PLAYER]:InitUnit (swordID, 73, 51, meleeAI );
		Players[GameDefines.BARBARIAN_PLAYER]:InitUnit (spearID, 77, 52, meleeAI );
	end
	if IsHasCiv(GameInfo.Civilizations.CIVILIZATION_SIAM.ID) then
		Players[GameDefines.BARBARIAN_PLAYER]:InitUnit (archerID, 98, 38, archerAI );
		Players[GameDefines.BARBARIAN_PLAYER]:InitUnit (warriorID, 98, 37, meleeAI );
	end
	if IsHasCiv(GameInfo.Civilizations.CIVILIZATION_MONGOL.ID) then
		Players[GameDefines.BARBARIAN_PLAYER]:InitUnit (archerID, 97, 56, archerAI );
		Players[GameDefines.BARBARIAN_PLAYER]:InitUnit (warriorID, 98, 54, meleeAI );
	end
	if IsHasCiv(GameInfo.Civilizations.CIVILIZATION_JAPAN.ID) then
		Players[GameDefines.BARBARIAN_PLAYER]:InitUnit (galleyID, 112, 43, galleyAI );
		Players[GameDefines.BARBARIAN_PLAYER]:InitUnit (galleyID, 116, 49, galleyAI );
	end
	--[[if IsHasCiv(GameInfo.Civilizations.CIVILIZATION_GERMANY.ID) then
		Players[GameDefines.BARBARIAN_PLAYER]:InitUnit (galleyID, 61, 55, galleyAI );
	end]]
end

function IsHasCiv(CivID)
	for iPlayerLoop = 0, GetPlayerAndTeamInfo() - 1, 1 do
		if Players[iPlayerLoop]:IsAlive() and CivID == Players[iPlayerLoop]:GetCivilizationType() then
			return true;
		end
	end
	return false;
end

function CCTPAddGoodies()
	print("CCTP - Adding Goody Huts");
	local improvementID = GameInfo.Improvements.IMPROVEMENT_GOODY_HUT.ID;
	local plot = Map.GetPlot(20, 16);
	local i = 1;
	local plotxy = GoodyInfo[i];
	while plotxy ~= nil do	
		plot = Map.GetPlot(plotxy[1], plotxy[2]);
		plot:SetImprovementType(improvementID);
		--print("Goody",plotxy[1], plotxy[2]);
		i = i + 1;
		plotxy = GoodyInfo[i];
	end
	
end

function DetermineContinents()
	print("CCTP - Determining continents for art purposes");
	local WorldChosen = modUserData.GetValue ("MapSelected")
	local MapPoint
	local MapPoints = {}
	
	-- Need to Add here, identifies which map data the chosen world uses
	for k, v in ipairs(CCTPScenarios) do
		MapPoints = CCTPScenarios [k]
		if WorldChosen == MapPoints [1] then
			MapPoint = MapPoints [3]
		end
	end

	-- Each plot has a continent art type. Mixing and matching these could look
	-- extremely bad, but there is nothing technical to prevent it. The worst 
	-- that will happen is that it can't find a blend and draws red checkerboards.
	
	-- Command for setting the art type for a plot is: <plot object>:SetContinentArtType(<art_set_number>)
	
	-- CONTINENTAL ART SETS
	-- 0) Ocean
	-- 1) America
	-- 2) Asia
	-- 3) Africa
	-- 4) Europe
	
	local sPlotInfo = nil;
	for i, plot in Plots() do
		if MapPoint[i+1] == nil then
			break;
		end
		
		sPlotInfo = MapPoint[i+1];
		tmpstring = string.sub(sPlotInfo, -2, -2);
		tmpint = tonumber(tmpstring, 16);
		plot:SetContinentArtType(tmpint);
	end
end

function GenerateMap()
	print("CCTP - Generating Map Starting");
	
	modver = 1;
	modid = "CCTP";
	modUserData = Modding.OpenUserData(modid, modver);
	
	-- This is the core map generation function.
	-- Every step in this process carries dependencies upon earlier steps.
	-- There isn't any way to change the order of operations without breaking dependencies,
	-- although it would be possible to repair and reorganize certain dependencies with enough work.
	
	-- Plot types are the core layer of the map, determining land or sea, determining flatland, hills or mountains.
	GeneratePlotTypes();
	
	-- Terrain covers climate: grassland, plains, desert, tundra, snow.
	GenerateTerrain();
	
	-- Each body of water, area of mountains, or area of hills+flatlands is independently grouped and tagged.
	Map.RecalculateAreas();
	
	-- River generation is affected by plot types, originating from highlands and preferring to traverse lowlands.
	AddRivers();
	
	-- Lakes would interfere with rivers, causing them to stop and not reach the ocean, if placed any sooner.
	--AddLakes();
	
	-- Features depend on plot types, terrain types, rivers and lakes to help determine their placement.
	AddFeatures();

	-- Feature Ice is impassable and therefore requires another area recalculation.
	Map.RecalculateAreas();

	-- Assign Starting Plots, Place Natural Wonders, and Distribute Resources.
	-- This system was designed and programmed for Civ5 by Bob Thomas.
	-- Starting plots are wholly dependent on all the previous elements being in place.
	-- Natural Wonders are dependent on civ starts being in place, to keep them far enough away.
	-- Resources are dependent on start locations, Natural Wonders, as well as plots, terrain, rivers, lakes and features.
	--
	-- This system relies on Area-based data and cannot tolerate an AreaID recalculation during its operations.
	-- Due to plot changes from Natural Wonders and possibly other source, another recalculation is done as the final action of the system.
	StartPlotSystem();

	-- Goodies depend on not colliding with resources or Natural Wonders, or being placed too near to start plots.
	AddGoodies();

	-- Continental artwork selection must wait until Areas are finalized, so it gets handled last.
	DetermineContinents();

	if Game.GetGameSpeedType() == 1 then
		Game.SetStartYear(600);
	else
		Game.SetStartYear(-3000);
	end
	Game.SetGameTurn(0);

	print("CCTP - Generating Map Ending");
end