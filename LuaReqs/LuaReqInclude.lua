--add any tags and their tables to the two tables below in matching pairs (only for tags that "call" a Lua function)
local luaCallbackTable =	{ "Buildings"}
local luaCallbackTag =		{ "LuaTurnBuildable"}
---------------------------------------------------------------
-- Compile Lua callback text (run once at game init)
---------------------------------------------------------------
local bLuaCallbacksCompiled = false
local LuaCallback = {}	--will hold all lua functions (as function values) keyed by function text exactly as it appears in table
args = {}	--loadstring always compiles in global environment, so use this global to hold arguments for function call

function CompileTableLuaCallbacks()
	-- this must run after functions defined!
	print("Compiling table Lua callbacks...")
	for i, callbackTable in ipairs(luaCallbackTable) do
		local callbackTag = luaCallbackTag[i]
		for item in GameInfo[callbackTable]() do
			local functText = item[callbackTag]
			if functText and not LuaCallback[functText] then
				print("Table "..callbackTable..", tag "..callbackTag..", function "..functText)
				local funct = assert(loadstring("return "..functText))
				LuaCallback[functText] = funct
			end
		end
	end
	bLuaCallbacksCompiled = true
end

---------------------------------------------------------------
-- Functions for new tags added to tables (including Lua callbacks)
---------------------------------------------------------------
-- Building requirements
GameEvents.PlayerCanConstruct.Add(
function(iPlayer, buildingTypeID)
	local player = Players[iPlayer]
	local building = GameInfo.Buildings[buildingTypeID]
	local PreReqPolicy = building.PreReqPolicy
	if PreReqPolicy then
		local policyID = GameInfo.Policies[PreReqPolicy].ID
		if not player:HasPolicy(policyID) then
			return false
		end
	end
	local functText = building.LuaTurnBuildable
	if functText and bLuaCallbacksCompiled then
		local funct = LuaCallback[functText]
		args.iPlayer = iPlayer
		args.buildingTypeID = buildingTypeID
		if not funct() then	--!!! that was the function call, so make sure args holds whatever you need !!!
			return false
		end
	end
	--add any additional restrictions to buildings here
	return true
end)
-- Unit requirements
GameEvents.PlayerCanTrain.Add(
function(iPlayer, unitTypeID)	
	local player = Players[iPlayer]
	local unit = GameInfo.Units[unitTypeID]
	local PreReqPolicy = unit.PreReqPolicy
	if PreReqPolicy then
		local policyID = GameInfo.Policies[PreReqPolicy].ID
		if not player:HasPolicy(policyID) then
			return false
		end
	end

	--add any additional restrictions to units here
	return true
	
end)

---------------------------------------------------------------
-- An example user defined function (can be in another file but must be same state)
-- Note that any arguments must be passed through a global (I use args here)
---------------------------------------------------------------
-- Building Functions
function RunBuildingTurnLimit()
	print("called RunBuildingTurnLimit function")
	iPlayer = args.iPlayer
	buildingTypeID = args.buildingTypeID
	buildingTurns = GameInfo.Buildings[buildingTypeID].TurnBuildable
	--print(iPlayer)
	--print(buildingTypeID)
	--print(buildingTurns)
	if Game.GetGameTurn() > buildingTurns then
		return true
	end
	return false
end

--Unit Functions

---------------------------------------------------------------
-- !!! Important !!! Put this somewhere in your program where it runs
-- at game init (after all functions above have been defined)
-- THIS IS IN THE TECHTREE.LUA FILE
---------------------------------------------------------------
--CompileTableLuaCallbacks()