-- Event Manager
-- Author: FiresForever
-- DateCreated: 27/08/2012
--------------------------------------------------------------

include( "Emigration.lua" );
include( "CustomNotification.lua" );
include( "APSPlotEvents.lua" );


LuaEvents.NotificationAddin({ name = "TreeGrowthForest", type = "CNOTIFICATION_TREEGROWTHFOREST" })
LuaEvents.NotificationAddin({ name = "TreeGrowthJungle", type = "CNOTIFICATION_TREEGROWTHJUNGLE" })
LuaEvents.NotificationAddin({ name = "Emigration", type = "CNOTIFICATION_EMIGRATION"})
LuaEvents.NotificationAddin({ name = "Immigration", type = "CNOTIFICATION_IMMIGRATION"})

function CCTP_APTS_Events()
	print ("Start CCTP APTS Events")
	-- Lets run the plot based events
	plotEvents()
	--Now lets run Emigration Event
	Emigration()
	
end
Events.ActivePlayerTurnStart.Add(CCTP_APTS_Events);
