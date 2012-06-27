-- Resource Generator V4.0
-- Author: Deep_Blue
--------------------------------------------------------------
include( "SaveUtils" ); MY_MOD_NAME = "5HA9_0P12_XVIU_RESOURCE_GENERATOR_BY_DEEP_BLUE";

include("ResGenerator.lua");

if load(Players[Game.GetActivePlayer()],"Resources_Generation_Completed") ~= nil then
	if load(Players[Game.GetActivePlayer()],"Resources_Generation_Completed") == 1 then
		return;
	end
end

if PreGame.GetMapOption(11) == 1 then
	save(Players[Game.GetActivePlayer()],"Resources_Generation_Completed",1);
	print ("Using Real Resources")
	for CTPResource in GameInfo.CTPMapResourceList() do
		local resourceID = GameInfo.Resources[CTPResource.resource].ID
		local yield = CTPResource.yield
		local mapx = CTPResource.x
		local mapy =  CTPResource.y
		local plot = Map:GetPlotXY(mapy,mapx)
		plot:SetResourceType(resourceID, yield)
		print ("Placed " .. yield .. "  " .. CTPResource.resource .. "(" .. resourceID .. ") at: " .. mapx .. ", " .. mapy .. ".")
	end
	return;
end

print ("Using Random Resources")

--======================================================================================
-- Put the tpye of your resource here: 
OnMapResourceGenerator("RESOURCE_ALLIGATOR");
OnMapResourceGenerator("RESOURCE_TIN" , { "FEATURE_FLOOD_PLAINS", "FEATURE_OASIS" } );
OnMapResourceGenerator("RESOURCE_COFFEE" , { "TERRAIN_DESERT", "TERRAIN_TUNDRA" } );
OnMapResourceGenerator("RESOURCE_CORN" , { "TERRAIN_DESERT", "FEATURE_MARSH", "FEATURE_JUNGLE", "FEATURE_FOREST" } );
OnMapResourceGenerator("RESOURCE_TOBACCO");
OnMapResourceGenerator("RESOURCE_JADE" , { "TERRAIN_DESERT", "TERRAIN_TUNDRA", } );
OnMapResourceGenerator("RESOURCE_MANGANESE");
OnMapResourceGenerator("RESOURCE_OAK");
OnMapResourceGenerator("RESOURCE_POPPY" , { "TERRAIN_DESERT", "FEATURE_MARSH", "FEATURE_JUNGLE", "FEATURE_FOREST" } );
OnMapResourceGenerator("RESOURCE_RARE_EARTHS" , { "FEATURE_OASIS" } );
OnMapResourceGenerator("RESOURCE_RICE" , { "FEATURE_JUNGLE", "FEATURE_FOREST" } );
OnMapResourceGenerator("RESOURCE_SQUID");
OnMapResourceGenerator("RESOURCE_AMBER");
OnMapResourceGenerator("RESOURCE_SOYBEANS" , { "TERRAIN_DESERT", "FEATURE_MARSH", "FEATURE_FOREST", "FEATURE_JUNGLE" } );
OnMapResourceGenerator("RESOURCE_TEA" , { "TERRAIN_DESERT", "FEATURE_MARSH" } );
OnMapResourceGenerator("RESOURCE_TITANIUM" , { "FEATURE_OASIS" } );
OnMapResourceGenerator("RESOURCE_TOBACCO" , { "TERRAIN_DESERT", "FEATURE_MARSH", "FEATURE_JUNGLE", "FEATURE_FOREST" } );
OnMapResourceGenerator("RESOURCE_COCOA" , { "TERRAIN_DESERT", "FEATURE_MARSH" } );
OnMapResourceGenerator("RESOURCE_IRON" , { "FEATURE_OASIS" } );
OnMapResourceGenerator("RESOURCE_HORSE");
OnMapResourceGenerator("RESOURCE_COAL" , { "FEATURE_OASIS" } );
OnMapResourceGenerator("RESOURCE_OIL" , { "FEATURE_OASIS" } );
OnMapResourceGenerator("RESOURCE_ALUMINUM" , { "FEATURE_OASIS" } );
OnMapResourceGenerator("RESOURCE_URANIUM" , { "FEATURE_OASIS" } );
OnMapResourceGenerator("RESOURCE_WHEAT" , { "FEATURE_MARSH", "FEATURE_JUNGLE", "FEATURE_FOREST" } );
OnMapResourceGenerator("RESOURCE_COW" , { "FEATURE_MARSH", "FEATURE_JUNGLE", "FEATURE_FOREST" } );
OnMapResourceGenerator("RESOURCE_SHEEP");
OnMapResourceGenerator("RESOURCE_DEER" , { "TERRAIN_DESERT", "FEATURE_MARSH" } );
OnMapResourceGenerator("RESOURCE_BANANA");
OnMapResourceGenerator("RESOURCE_FISH");
OnMapResourceGenerator("RESOURCE_WHALE" , { "FEATURE_LAKE" } );
OnMapResourceGenerator("RESOURCE_PEARLS");
OnMapResourceGenerator("RESOURCE_GOLD" , { "FEATURE_OASIS" } );
OnMapResourceGenerator("RESOURCE_SILVER" , { "FEATURE_OASIS" } );
OnMapResourceGenerator("RESOURCE_GEMS" , { "FEATURE_OASIS" } );
OnMapResourceGenerator("RESOURCE_MARBLE" , { "FEATURE_OASIS" } );
OnMapResourceGenerator("RESOURCE_IVORY" , { "FEATURE_MARSH" } );
OnMapResourceGenerator("RESOURCE_FUR" , { "TERRAIN_DESERT", "FEATURE_MARSH" } );
OnMapResourceGenerator("RESOURCE_DYE");
OnMapResourceGenerator("RESOURCE_SPICES" , { "TERRAIN_DESERT", "FEATURE_MARSH" } );
OnMapResourceGenerator("RESOURCE_SILK" , { "TERRAIN_DESERT", "FEATURE_MARSH" } );
OnMapResourceGenerator("RESOURCE_SUGAR");
OnMapResourceGenerator("RESOURCE_COTTON" , { "TERRAIN_DESERT", "FEATURE_MARSH", "FEATURE_JUNGLE", "FEATURE_FOREST" } );
OnMapResourceGenerator("RESOURCE_WINE" , { "TERRAIN_DESERT", "FEATURE_MARSH", "FEATURE_FOREST" } );
OnMapResourceGenerator("RESOURCE_INCENSE" , { "FEATURE_MARSH", "FEATURE_JUNGLE", "FEATURE_FOREST" } );

-- this function will automatically spread the resource on the map according to:
-- 1) map size
-- 2) number of civilizations in the game
-- 3) Pre-game resource options (sparse,standard,..)
-- 4) defined terrain&feature Booleans in resource xml file.
-- You can add as many resources as you want, example:
-- OnMapResourceGenerator("RESOURCE_MyResource1");
-- OnMapResourceGenerator("RESOURCE_MyResource2");
-- etc..

--[[ 

Advanced Options: 
----------------
you can use additional option with the function:

OnMapResourceGenerator("RESOURCE_MyResource" , Excludes )

Excludes is a table containing any Terrain or feature you do not want, put them in any order but 
they must have exact Type string in Civ5Terrains.xml and Civ5Features.xml otherwise they will be igonred.

Example:

OnMapResourceGenerator("RESOURCE_COPPER" , {"TERRAIN_DESERT", "TERRAIN_PLAINS"} )

--]]
 
--======================================================================================


save(Players[Game.GetActivePlayer()],"Resources_Generation_Completed",1);