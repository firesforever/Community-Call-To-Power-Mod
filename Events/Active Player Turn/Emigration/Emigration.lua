--------------------------------------------------------------
-- Emigration Mod v2.01
-- Authors: killmeplease, Thalassicus
-- Last Edit: 10/15/2010
--------------------------------------------------------------
include( "ScriptDataManager.lua" );
--include( "PlotCycle.lua" );
include( "CustomNotification.lua" );
--------------------------------------------------------------
--LuaEvents.NotificationAddin({ name = "Emigration", type = "CNOTIFICATION_EMIGRATION"})
--LuaEvents.NotificationAddin({ name = "Immigration", type = "CNOTIFICATION_IMMIGRATION"})

-- Global Variables
--------------------------------------------------------------
-- number of turns back for which happiness history is tracked
local iNumTurnsHappinessTracked = 3 * GameInfo.GameSpeeds[PreGame.GetGameSpeed()].GrowthPercent / 100;
	--GameInfo.Emigration["NumTurnsHappinessTracked"] * 
local iUnhappinessFromStarvation = 3; --GameInfo.Emigration["UnhappinessFromStarvation"];
local iMaxEmigrantsPercent = 50; --GameInfo.Emigration["MaxEmigrantsPercent"];

-- Utility Functions
--------------------------------------------------------------
function IsValid(player)	-- this player is in game
	return player ~= nil and player:IsAlive();
end
--------------------------------------------------------------
function GetPlayerName(player)	-- get name for notification
	if player:IsMinorCiv() then
		local minorCivType = player:GetMinorCivType();
		local minorCivInfo = GameInfo.MinorCivilizations[minorCivType];
		return Locale.ConvertTextKey(minorCivInfo.Description);
	end
	local iCivType = player:GetCivilizationType();
	local civInfo = GameInfo.Civilizations[iCivType];			
	return Locale.ConvertTextKey(civInfo.Description);	
end
--------------------------------------------------------------
function GetCityByIndex(player, N)
	local n = 0;
	for city in player:Cities() do
		if (n == N) then
			return city;
		end
		n = n + 1;
	end
end
------------------------------------------------------------------------------
function hasPolicy(player, policyType)
	for policy in GameInfo.Policies() do
		if policy.Type == policyType then
			return player:HasPolicy(policy.ID);
		end
	end
	return false;
end
--------------------------------------------------------------


-- Emigration Mechanics
--------------------------------------------------------------
function UpdateHappiness(pPlayer)	-- updates happiness info for given player
	if not IsValid(pPlayer) then
		return;
	end
	local iCurrentHappiness = pPlayer:GetExcessHappiness();
	local hppInfo = AccessData(pPlayer, "Emigration");

	if hppInfo == nil then
		-- create info and insert 1 record (for current happiness):
		hppInfo = { [1] = iCurrentHappiness, position = 1, average = iCurrentHappiness };
		SaveData(pPlayer);
		return;
	end
	
	-- go to next recording position:
	local pos = (hppInfo.position or 0) + 1;
	if pos > iNumTurnsHappinessTracked then
		pos = 1;
	end
	hppInfo.position = pos;
	-- add new record:
	hppInfo[pos] = iCurrentHappiness;
	-- calculate average:
	local sum, num = 0, 0;
	for i, v in ipairs(hppInfo) do
		sum = sum + v;
		num = num + 1;
	end
	hppInfo.average = sum / num;
	SaveData(pPlayer);	-- save player data
	-- debug:
	print(GetPlayerName(pPlayer).." "..pPlayer:GetScriptData());
end
--------------------------------------------------------------
function BestDestination(fromPlayer)	-- returns player or nil
	local fromPlayerTeam = Teams[fromPlayer:GetTeam()];
	local pBestPlayer;
	local iBestCountryValue = 0;	
	-- loop through players to determine a best country to emigrate to
	for _, pPlayer in pairs(Players) do
		if (IsValid(pPlayer) and pPlayer ~= fromPlayer and fromPlayerTeam:IsHasMet(pPlayer:GetTeam()) 
		and not fromPlayerTeam:IsAtWar(pPlayer:GetTeam()) and pPlayer:GetExcessHappiness() > 0) then	
			-- emigration to this player is possible
			local id = pPlayer:GetID();	
			local iPlayerAvgHappiness = AccessData(pPlayer, "Emigration").average;	-- should be already init so no nil test
			if (iPlayerAvgHappiness > 0) then	-- this is a candidate
				--calculate an emigration value
				local iPlayerValue = Map.Rand(iPlayerAvgHappiness, "Random country to emigrate to - Lua");
				if (iPlayerValue > iBestCountryValue) then
					-- best candidate so far
					iBestCountryValue = iPlayerValue;
					pBestPlayer = pPlayer;
				end
			end
		end
	end
	return pBestPlayer;
end
--------------------------------------------------------------
function MovePopulation(fromPlayer, fromCity, toPlayer)
	if toPlayer == nil then
		return;
	end
	
	local numCities = toPlayer:GetNumCities();
	local startIdx = Map.Rand(numCities, "Random city to emigrate to - Lua");
	
	-- search for a city to emigrate to, start from random one:
	for i = startIdx, startIdx + numCities do
		local cityIdx = i % numCities;
		local toCity = GetCityByIndex(toPlayer, cityIdx);
		
		if not (toCity:IsRazing() or toCity:IsResistance() or toCity:FoodDifference() < 0) then	-- no emigration to suffering cities
			fromCity:SetPopulation(fromCity:GetPopulation() - 1, true);	--decrease population in a source city
			toCity:SetPopulation(toCity:GetPopulation() + 1, true);	-- increase population in a destination city
			
			--show notification to the player:
			if (fromPlayer:IsHuman()) then
				local summary = 
					"An unhappy [ICON_CITIZEN] citizen from " .. fromCity:GetName() .. " left for the " ..
					GetPlayerName(toPlayer); --.. ", seeking a better life";
				local PlayerName = GetPlayerName(fromPlayer)
				local etype = "Emigration"
				CustomNotification("Emigration", summary, "Emigration to " .. GetPlayerName(toPlayer), 0, fromCity, 0, 0);
				
			elseif (toPlayer:IsHuman()) then
				local summary = 
					"A [ICON_CITIZEN] citizen from the " .. GetPlayerName(fromPlayer) .. " came to " .. 
					toCity:GetName(); --.. ", seeking a better life";
				local PlayerName = GetPlayerName(fromPlayer)
				local etype = "Immigration"
				CustomNotification("Immigration", summary, "Immigration from " .. GetPlayerName(fromPlayer), 0, toCity, 0, 0);
				
			end

			break;
		end
	end
end
--------------------------------------------------------------
function Emigration()	-- the main mod function, executed at start of each turn.
	print("start emigration test");
	
	-- update happiness infos, calc averages:
	for _, player in pairs(Players) do
		UpdateHappiness(player);
	end
	
	print("unhappiness updated.. test players:");

	--local factors = GameInfo.EmigrationFactors;
	--print("factors obtained");
	-- for each fromPlayer
	for _, fromPlayer in pairs(Players) do
		if IsValid(fromPlayer) then  -- if player is valid
			print("testing " .. fromPlayer:GetName());
			local iAverageHappiness = AccessData(fromPlayer, "Emigration").average;	-- should not be nil as initialized in UpdateHappiness
			-- if player is unhappy
			if (fromPlayer:GetExcessHappiness() < 0 and iAverageHappiness < 0) then	
				print("..." .. fromPlayer:GetName() .. " is unhappy");
				local bIronCurtain = hasPolicy(fromPlayer, "POLICY_AUTOCRACY");
				local bFreedom = hasPolicy(fromPlayer, "POLICY_FREEDOM") or hasPolicy(fromPlayer, "POLICY_LIBERTY");
				local iStarvationPenalty = 0;	-- this value is added to unhappiness in numEmigrants check
				local weights = {};				-- cities' emigration weights table
				local iSumWgt = 0;				-- summ of cities' base (not reduced) emigration weights
				local iSumActWgt = 0;			-- summ of cities' actual (reduced) emigration weights
				-- calculate weights and starvation penalty
				for city in fromPlayer:Cities() do
					--print("calculating weight for " .. city:GetName());
					-- calculate happines penalty for starvation. starvation does not increase emigration weight to prevent exploit
					if city:FoodDifference() < 0 then
						iStarvationPenalty = iStarvationPenalty + iUnhappinessFromStarvation;
						--print("starvation penalty applied");
					end
					-- calculate emigration weight for city
					if not (city:IsRazing() or city:GetPopulation() == 1) then
						local cult = math.log(city:GetJONSCultureThreshold());
						local wgt = 100 / (cult);--factors["Culture"].Value * cult);	-- base weight
						iSumWgt = iSumWgt + wgt;	-- accumulate summ weight value
						-- now see if weight should be reduced by various factors:
						if city:IsBlockaded() then
							wgt = wgt * 0.5; --factors["Blockade"].Value;
							--print("  is blockaded");
						end
						if city:GetGarrisonedUnit() and not bFreedom then
							wgh = wgt * 0.5; --factors["GarrisonedUnit"].Value;
							--print("  is garrisoned");
						end
						if bIronCurtain then
							wgt = wgt * 0.25; --factors["IronCurtain"].Value;
							--print("  beyond iron curtain");
						end
						weights[city] = wgt;
						iSumActWgt = iSumActWgt + wgt;
					end
				end	-- end player's cities' weights calculation
				
				-- determine number of emigrants
				local iMaxEmigrants = math.floor((-iAverageHappiness + iStarvationPenalty) * iMaxEmigrantsPercent / 100) + 1;
				local iNumEmigrants = Map.Rand(iMaxEmigrants, "Random number of emigrants - Lua");	-- up to 50% unhappiness
				--print("number of emigrants: " .. iNumEmigrants);
				-- for each emigrant
				for e = 1, iNumEmigrants do
					local rnd = Map.Rand(iSumWgt, "Random number to determine a city for emigration - Lua");
					local cwgt = 0;
					-- pick a city
					for city, wgt in pairs(weights) do
						cwgt = cwgt + wgt;
						if rnd < cwgt then
							--print("emigration from" .. city:GetName());
							local toPlayer = BestDestination(fromPlayer);	-- can be nil, this is checked in MovePopulation
							--print("best destination determined");
							MovePopulation(fromPlayer, city, toPlayer);		-- so do not worry for this line
							--print("population moved");
							-- decrease emigration weight for this city:
							local wgt = weights[city] * 0.8; --factors["EmigratedOnceAlready"];	--new weight for a city
							local dWgt = weights[city] - wgt;	-- substracted weight
							weights[city] = wgt;
							iSumWgt = iSumWgt * (1 - dWgt / iSumActWgt); -- so global emigration probability will not affected
							iSumActWgt = iSumActWgt - dWgt;		-- renew actual weights sum
							--print("weight reduced for this city");
							break;
						end
					end
				end	-- emigrants loop

			end -- if player is unhappy
		end -- if player is valid
	end -- players loop
end
