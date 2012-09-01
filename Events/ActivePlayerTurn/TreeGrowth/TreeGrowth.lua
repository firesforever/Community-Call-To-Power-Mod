-- TreeGrowth
-- Author: Bhruic
-- DateCreated: 9/30/2010 10:36:21 AM
--------------------------------------------------------------

--include( "CustomNotification.lua" );

--LuaEvents.NotificationAddin({ name = "TreeGrowth", type = "CNOTIFICATION_TREEGROWTH" })

local g_TreeCount = 0;

function GetPlayer()
	local iPlayerID = Game.GetActivePlayer();
	if (iPlayerID < 0) then
		print("Error - player index not correct");
		return nil;
	end

	if (not Players[iPlayerID]:IsHuman()) then
		return nil;
	end;

	return Players[iPlayerID];
end

-- Checks if tile is a valid location for a forest

function IsValidForestTile(plot)
	local plotType = plot:GetPlotType();
	local terrainType = plot:GetTerrainType();
	local featureType = plot:GetFeatureType();
	local improvementType = plot:GetImprovementType();
	local NO_IMPROVEMENT = -1;

	if plotType == PlotTypes.PLOT_MOUNTAIN then
		return false;
	elseif plotType == PlotTypes.PLOT_OCEAN then
		return false;
	end

    if plot:IsCity() then
		return false;
	elseif plot:IsBeingWorked() then
		return false;
	end

	if improvementType ~= NO_IMPROVEMENT then
		return false;
	end

	if featureType ~= FeatureTypes.NO_FEATURE and featureType ~= FeatureTypes.FEATURE_RIVER then
		return false;
	end

	if terrainType == TerrainTypes.TERRAIN_GRASS or terrainType == TerrainTypes.TERRAIN_PLAINS or terrainType == TerrainTypes.TERRAIN_TUNDRA then
		return true;
	end

	return false;
end

-- Main Tree Expansion function

function TreeGrowth(plots)
	local firstRingYIsEven = {{0, 1}, {1, 0}, {0, -1}, {-1, -1}, {-1, 0}, {-1, 1}}
	local firstRingYIsOdd = {{1, 1}, {1, 0}, {1, -1}, {0, -1}, {-1, 0}, {0, 1}};
	local plot = plots;
	local iW, iH = Map.GetGridSize();
	local x, y;
	local search_table = {};
		
	-- lets first find out if the plot is acceptable for growth	
		if IsValidForestTile(plot) then
			x = plot:GetX();
			y = plot:GetY();

			local isEvenY = true;
			if y % 2 > 0 then
				isEvenY = false;
			end

			if isEvenY then
				search_table = firstRingYIsEven;
			else
				search_table = firstRingYIsOdd;
			end

			for plotAdjacentLoop, plot_adjustments in ipairs(search_table) do
				local searchX = x + plot_adjustments[1];
				local searchY = y + plot_adjustments[2];

				if searchX >= 0 and searchX < iW and searchY >= 0 and searchY < iH then
					local plotAdjacent = Map.GetPlot(searchX, searchY);
					local runOnce = false;
					
					-- if plot does not have an adjecent forest we dont want it growing a forest
					if plotAdjacent:GetFeatureType() == FeatureTypes.FEATURE_FOREST and not runOnce then
						local info = GameInfo.GameSpeeds[Game.GetGameSpeedType()];
						local world = GameInfo.Worlds[Map.GetWorldSize()];

						local base = 500 * (info.GrowthPercent / 100) * (world.ResearchPercent / 100);

						local diceroll = Map.Rand(base, "TreeGrowth - Randomized percentage chance of new Forest");
						if diceroll < 1 then
							plot:SetFeatureType(FeatureTypes.FEATURE_FOREST);
							print("New Forest located at x:", x, " y:", y, " - base chance 1/", base);
							g_TreeCount = g_TreeCount + 1;
							
							local player = GetPlayer();
							if player ~= nil then
								if plot:IsRevealed(player:GetTeam()) then
									--LuaEvents.TreeGrowthNotification(g_TreeCount, x, y);
									--CustomNotification("TreeGrowth", Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_FOREST"), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_FOREST"), plot, 0, "Green", 0);
									return "Forest"
								end
							end
						end
						runOnce = true;
					elseif plotAdjacent:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE and not runOnce then
					-- if the plot will not accept a forest then lets check for jungle instead
						local info = GameInfo.GameSpeeds[Game.GetGameSpeedType()];
						local world = GameInfo.Worlds[Map.GetWorldSize()];

						local base = 500 * (info.GrowthPercent / 100) * (world.ResearchPercent / 100);

						local diceroll = Map.Rand(base, "TreeGrowth - Randomized percentage chance of new Jungle");
						if diceroll < 1 then
							plot:SetFeatureType(FeatureTypes.FEATURE_JUNGLE);
							print("New Jungle located at x:", x, " y:", y, " - base chance 1/", base);
							g_TreeCount = g_TreeCount + 1;
							
							local player = GetPlayer();
							if player ~= nil then
								if plot:IsRevealed(player:GetTeam()) then
									--LuaEvents.TreeGrowthNotification(g_TreeCount, x, y);
									--CustomNotification("TreeGrowth", Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_JUNGLE"), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JUNGLE"), plot, 0, "Green", 0);
									return "Jungle"
								end
							end
						end
						runOnce = true;
					end
				end
			end
		end
	return "no_event"
end
