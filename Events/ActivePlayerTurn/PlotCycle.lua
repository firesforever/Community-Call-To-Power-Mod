-- PlotCycle
-- Author: FiresForever
-- DateCreated: 27/08/2012
--------------------------------------------------------------

include( "TreeGrowth.lua" );
include( "Emigration.lua" );
include( "CustomNotification.lua" );

LuaEvents.NotificationAddin({ name = "TreeGrowth", type = "CNOTIFICATION_TREEGROWTH" })
LuaEvents.NotificationAddin({ name = "Emigration", type = "CNOTIFICATION_EMIGRATION"})
LuaEvents.NotificationAddin({ name = "Immigration", type = "CNOTIFICATION_IMMIGRATION"})

function CCTP_APTS_Events()
	-- Lets run the hex plot based events
	print ("Start CCTP APTS Events")
	plotEvents()
	--Now lets run Emigration Event
	Emigration()
	
end
Events.ActivePlayerTurnStart.Add(CCTP_APTS_Events);


function plotEvents()
	local plot;
	local iW, iH = Map.GetGridSize();
	local x, y;
	local i = 0
	local landOwners = {}
	local forestCandidates = {}
	local ntype
	
	for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
		plot = Map.GetPlotByIndex(plotLoop);
		
		-- lets find out what plots belong to who
		landOwners = getPlotOwner(plot, i)
		-- lets grow our trees
		ntype = TreeGrowth(plot)
		
		if ntype ~= "no_event" then
			sendPlotNotification(ntype, plot)
		end
		i = i +1
	end
	
end



function getPlotOwner(plot, i)
	-- here we are going to find out what plots belong to who
	local landOwner = plot:GetOwner(); 
	local No_Owner = -1
	local minorCiv_Owner = 22
	local playerLand = {}
	local playerLands = {}
	local i = i
	
	if landOwner ~= No_Owner then
		xx = plot:GetX();
		yy = plot:GetY();
		playerLands[i] = {landOwner,xx,yy}
		playerLand = playerLands[i]
		--print (playerLand[1], playerLand[2], playerLand[3])
		return playerLands
	end
	
	
end

function sendPlotNotification(ntype, plot)
	print (ntype)
	if ntype == "Forest" then
		CustomNotification("TreeGrowth", Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_FOREST"), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_FOREST"), plot, 0, "Green", 0);
	elseif ntype == "Jungle" then
		CustomNotification("TreeGrowth", Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_JUNGLE"), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JUNGLE"), plot, 0, "Green", 0);
	end
	
end

function sendEmiNotification(etype, summary, PlayerName, city)
	if etype == "Emigration" then
		--CustomNotification("Emigration", summary, "Emigration to " .. PlayerName, 0, city, 0, 0);
	elseif etype == "Immigration" then
		--CustomNotification("Immigration", summary, "Immigration from " .. PlayerName, 0, city, 0, 0);
	end
	
end


--		plot:SetImprovementPillaged(true)

--		local impName = GameInfo.Improvements[improvementType].Type	
--		if impName ~= "IMPROVEMENT_GOODY_HUT" then 
--			plot:SetImprovementType(NO_IMPROVEMENT)
--			print (impName)
--			print ("improvement destroyed")
--		end