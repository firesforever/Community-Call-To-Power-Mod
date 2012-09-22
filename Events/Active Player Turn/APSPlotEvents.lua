-- APSPlotEvents
-- Author: FiresForever
-- DateCreated: 27/08/2012
--------------------------------------------------------------
include( "TreeGrowth.lua" );
include( "CustomNotification.lua" );

function plotEvents()
	local plot;
	local iW, iH = Map.GetGridSize();
	local x, y;
	local i = 0
	local forestCandidates = {}
	local ntype
	
	for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
		plot = Map.GetPlotByIndex(plotLoop);	
		-- run Tree Growth
		ntype = TreeGrowth(plot)
		
		-- Check for and add notification
		if ntype ~= "no_event" then
			sendPlotNotification(ntype, plot)
		end
	end
	
end

function sendPlotNotification(ntype, plot)
	if ntype == "Forest" then
		CustomNotification("TreeGrowthForest", Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_FOREST"), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_FOREST"), plot, 0, "Green", 0);
	elseif ntype == "Jungle" then
		CustomNotification("TreeGrowthJungle", Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_JUNGLE"), Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_JUNGLE"), plot, 0, "Green", 0);
	end
end
