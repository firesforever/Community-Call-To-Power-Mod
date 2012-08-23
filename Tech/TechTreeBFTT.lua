-------------------------------------------------
-- Tech Tree Popup
-------------------------------------------------
include( "InstanceManager" );

g_UseSmallIcons = true;

include( "TechButtonInclude" );
include( "TechHelpInclude" );

local m_PopupInfo = nil;

local g_PipeLand = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.LandTechTreeScrollPanel );
local g_TechInstanceLand = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.LandTechTreeScrollPanel );
local g_PipeSea = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.SeaTechTreeScrollPanel );
local g_TechInstanceSea = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.SeaTechTreeScrollPanel );
local g_PipeSpirit = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.SpiritTechTreeScrollPanel );
local g_TechInstanceSpirit = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.SpiritTechTreeScrollPanel );
local g_PipeNumber = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.NumberTechTreeScrollPanel );
local g_TechInstanceNumber = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.NumberTechTreeScrollPanel );
local g_PipeAlphabet = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.AlphabetTechTreeScrollPanel );
local g_TechInstanceAlphabet = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.AlphabetTechTreeScrollPanel );
local g_PipeArtisans = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.ArtisansTechTreeScrollPanel );
local g_TechInstanceArtisans = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.ArtisansTechTreeScrollPanel );
local g_PipeExoticG = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.ExoticGTechTreeScrollPanel );
local g_TechInstanceExoticG = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.ExoticGTechTreeScrollPanel );
local g_PipeMedievalU = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.MedievalUTechTreeScrollPanel );
local g_TechInstanceMedievalU = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.MedievalUTechTreeScrollPanel );
local g_PipeEmpiricism = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.EmpiricismTechTreeScrollPanel );
local g_TechInstanceEmpiricism = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.EmpiricismTechTreeScrollPanel );
local g_PipeHomo = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.HomoTechTreeScrollPanel );
local g_TechInstanceHomo = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.HomoTechTreeScrollPanel );
local g_PipeGeocentrism = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.GeocentrismTechTreeScrollPanel );
local g_TechInstanceGeocentrism = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.GeocentrismTechTreeScrollPanel );
local g_PipeAlchemy = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.AlchemyTechTreeScrollPanel );
local g_TechInstanceAlchemy = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.AlchemyTechTreeScrollPanel );
local g_PipeIndustrialR = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.IndustrialRTechTreeScrollPanel );
local g_TechInstanceIndustrialR = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.IndustrialRTechTreeScrollPanel );
local g_PipeScience = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.ScienceTechTreeScrollPanel );
local g_TechInstanceScience = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.ScienceTechTreeScrollPanel );
local g_PipeSocialC = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.SocialCTechTreeScrollPanel );
local g_TechInstanceSocialC = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.SocialCTechTreeScrollPanel );
local g_PipeElectrical = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.ElectricalTechTreeScrollPanel );
local g_TechInstanceElectrical = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.ElectricalTechTreeScrollPanel );
local g_PipeMolecules = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.MoleculesTechTreeScrollPanel );
local g_TechInstanceMolecules = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.MoleculesTechTreeScrollPanel );
local g_PipeAerodynamics = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.AerodynamicsTechTreeScrollPanel );
local g_TechInstanceAerodynamics = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.AerodynamicsTechTreeScrollPanel );
local g_PipeDigitalR = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.DigitalRTechTreeScrollPanel );
local g_TechInstanceDigitalR = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.DigitalRTechTreeScrollPanel );
local g_PipeHumanA = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.HumanATechTreeScrollPanel );
local g_TechInstanceHumanA = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.HumanATechTreeScrollPanel );
local g_PipeAdvancedA = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.AdvancedATechTreeScrollPanel );
local g_TechInstanceAdvancedA = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.AdvancedATechTreeScrollPanel );
local g_PipeNewLife = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.NewLifeTechTreeScrollPanel );
local g_TechInstanceNewLife = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.NewLifeTechTreeScrollPanel );
local g_PipeAtomM = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.AtomMTechTreeScrollPanel );
local g_TechInstanceAtomM = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.AtomMTechTreeScrollPanel );
local g_PipeFringe = InstanceManager:new( "TechPipeInstance", "TechPipeIcon", Controls.FringeTechTreeScrollPanel );
local g_TechInstanceFringe = InstanceManager:new( "TechButtonInstance", "TechButton", Controls.FringeTechTreeScrollPanel );

local g_PipeManager
local g_EraManager
local g_TechInstanceManager

local g_NeedsFullRefreshOnOpen = false;
local g_NeedsFullRefresh = false;

local maxSmallButtons = 5;

-- I'll need these before I'm done
local playerID = Game.GetActivePlayer();	
local player = Players[playerID];
local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type;
local activeTeamID = Game.GetActiveTeam();
local activeTeam = Teams[activeTeamID];

-- textures I'll be using
local right1Texture = "TechBranchH.dds"
local right2Texture = "TechBranches.dds"
local right2BTexture = "TechBranches.dds"
local right2TTexture = "TechBranches.dds"
local right3Texture = "TechBranches.dds"

local left1Texture = "TechBranchH.dds"
local left2Texture = "TechBranches.dds"
local left2TTexture = "TechBranches.dds"
local left2BTexture = "TechBranches.dds"

local topRightTexture = "TechBranches.dds"
local topLeftTexture = "TechBranches.dds"
local bottomRightTexture = "TechBranches.dds"
local bottomLeftTexture = "TechBranches.dds"

local hTexture = "TechBranchH.dds";
local vTexture = "TechBranchV.dds";

local connectorSize = { x = 32; y = 42; };

local pinkColor = {x = 2, y = 0, z = 2, w = 1};

local blockSpacingX = 270 + 96;
local blockSizeX = 270;
local blockSpacingY = 68;
local extraYOffset = 32;


local maxTechNameLength = 22 - Locale.Length(Locale.Lookup("TXT_KEY_TURNS"));

-------------------------------------------------
-- Do initial setup stuff here
-------------------------------------------------

local techButtons = {};
local eraColumns = {};

function InitialSetup()

	-- make the scroll bar the correct size for the display size
	Controls.LandTechTreeScrollBar:SetSizeX( Controls.LandTechTreeScrollPanel:GetSize().x - 150 );
	Controls.SeaTechTreeScrollBar:SetSizeX( Controls.SeaTechTreeScrollPanel:GetSize().x - 150 );
	Controls.SpiritTechTreeScrollBar:SetSizeX( Controls.SpiritTechTreeScrollPanel:GetSize().x - 150 );
	Controls.NumberTechTreeScrollBar:SetSizeX( Controls.NumberTechTreeScrollPanel:GetSize().x - 150 );
	Controls.AlphabetTechTreeScrollBar:SetSizeX( Controls.AlphabetTechTreeScrollPanel:GetSize().x - 150 );
	Controls.ArtisansTechTreeScrollBar:SetSizeX( Controls.ArtisansTechTreeScrollPanel:GetSize().x - 150 );
	Controls.ExoticGTechTreeScrollBar:SetSizeX( Controls.ExoticGTechTreeScrollPanel:GetSize().x - 150 );
	Controls.MedievalUTechTreeScrollBar:SetSizeX( Controls.MedievalUTechTreeScrollPanel:GetSize().x - 150 );
	Controls.EmpiricismTechTreeScrollBar:SetSizeX( Controls.EmpiricismTechTreeScrollPanel:GetSize().x - 150 );
	Controls.HomoTechTreeScrollBar:SetSizeX( Controls.HomoTechTreeScrollPanel:GetSize().x - 150 );
	Controls.GeocentrismTechTreeScrollBar:SetSizeX( Controls.GeocentrismTechTreeScrollPanel:GetSize().x - 150 );
	Controls.AlchemyTechTreeScrollBar:SetSizeX( Controls.AlchemyTechTreeScrollPanel:GetSize().x - 150 );
	Controls.IndustrialRTechTreeScrollBar:SetSizeX( Controls.IndustrialRTechTreeScrollPanel:GetSize().x - 150 );
	Controls.ScienceTechTreeScrollBar:SetSizeX( Controls.ScienceTechTreeScrollPanel:GetSize().x - 150 );
	Controls.SocialCTechTreeScrollBar:SetSizeX( Controls.SocialCTechTreeScrollPanel:GetSize().x - 150 );
	Controls.ElectricalTechTreeScrollBar:SetSizeX( Controls.ElectricalTechTreeScrollPanel:GetSize().x - 150 );
	Controls.MoleculesTechTreeScrollBar:SetSizeX( Controls.MoleculesTechTreeScrollPanel:GetSize().x - 150 );
	Controls.AerodynamicsTechTreeScrollBar:SetSizeX( Controls.AerodynamicsTechTreeScrollPanel:GetSize().x - 150 );
	Controls.DigitalRTechTreeScrollBar:SetSizeX( Controls.DigitalRTechTreeScrollPanel:GetSize().x - 150 );
	Controls.HumanATechTreeScrollBar:SetSizeX( Controls.HumanATechTreeScrollPanel:GetSize().x - 150 );
	Controls.AdvancedATechTreeScrollBar:SetSizeX( Controls.AdvancedATechTreeScrollPanel:GetSize().x - 150 );
	Controls.NewLifeTechTreeScrollBar:SetSizeX( Controls.NewLifeTechTreeScrollPanel:GetSize().x - 150 );
	Controls.AtomMTechTreeScrollBar:SetSizeX( Controls.AtomMTechTreeScrollPanel:GetSize().x - 150 );
	Controls.FringeTechTreeScrollBar:SetSizeX( Controls.FringeTechTreeScrollPanel:GetSize().x - 150 );

	-- gather info about this player's unique units and buldings
	GatherInfoAboutUniqueStuff( civType );

	-- add the pipes
	local techPipes = {};
	for row in GameInfo.Technologies() do
		techPipes[row.Type] = 
		{
			leftConnectionUp = false;
			leftConnectionDown = false;
			leftConnectionCenter = false;
			leftConnectionType = 0;
			rightConnectionUp = false;
			rightConnectionDown = false;
			rightConnectionCenter = false;
			rightConnectionType = 0;
			xOffset = 0;
			techType = row.Type;
		};
	end
	
	local cnxCenter = 1
	local cnxUp = 2
	local cnxDown = 4
	
	-- Figure out which left and right adapters we need
	for row in GameInfo.Technology_PrereqTechs() do
		local prereq = GameInfo.Technologies[row.PrereqTech];
		local tech = GameInfo.Technologies[row.TechType];
		
		if tech.TechCat == prereq.TechCat then
		if tech and prereq then
			if tech.GridY < prereq.GridY then
				techPipes[tech.Type].leftConnectionDown = true;
				techPipes[prereq.Type].rightConnectionUp = true;
			elseif tech.GridY > prereq.GridY then
				techPipes[tech.Type].leftConnectionUp = true;
				techPipes[prereq.Type].rightConnectionDown = true;
			else -- tech.GridY == prereq.GridY
				techPipes[tech.Type].leftConnectionCenter = true;
				techPipes[prereq.Type].rightConnectionCenter = true;
			end
			
			local xOffset = (tech.GridX - prereq.GridX) - 1;
			if xOffset > techPipes[prereq.Type].xOffset then
				techPipes[prereq.Type].xOffset = xOffset;
			end
		end
		end
	end

	for pipeIndex, thisPipe in pairs(techPipes) do
		if thisPipe.leftConnectionDown then
			thisPipe.leftConnectionType = thisPipe.leftConnectionType + cnxDown;
		end 
		if thisPipe.leftConnectionUp then
			thisPipe.leftConnectionType = thisPipe.leftConnectionType + cnxUp;
		end 
		if thisPipe.leftConnectionCenter then
			thisPipe.leftConnectionType = thisPipe.leftConnectionType + cnxCenter;
		end 
		if thisPipe.rightConnectionDown then
			thisPipe.rightConnectionType = thisPipe.rightConnectionType + cnxDown;
		end 
		if thisPipe.rightConnectionUp then
			thisPipe.rightConnectionType = thisPipe.rightConnectionType + cnxUp;
		end 
		if thisPipe.rightConnectionCenter then
			thisPipe.rightConnectionType = thisPipe.rightConnectionType + cnxCenter;
		end 
	end

	for row in GameInfo.Technology_PrereqTechs() do
		local prereq = GameInfo.Technologies[row.PrereqTech];
		local tech = GameInfo.Technologies[row.TechType];
		if tech and prereq then
			
			local PCat = NULL
			
			if tech.TechCat == "TECHTREE_LAND" and prereq.TechCat == "TECHTREE_LAND" then
				g_PipeManager = g_PipeLand
				PCat = "TECHTREE_LAND"
			elseif tech.TechCat == "TECHTREE_SEA" and prereq.TechCat == "TECHTREE_SEA" then
				g_PipeManager = g_PipeSea
				PCat = "TECHTREE_SEA"
			elseif tech.TechCat == "TECHTREE_SPIRIT" and prereq.TechCat == "TECHTREE_SPIRIT" then
				g_PipeManager = g_PipeSpirit
				PCat = "TECHTREE_SPIRIT"
			elseif tech.TechCat == "TECHTREE_NUMBERTHEORY" and prereq.TechCat == "TECHTREE_NUMBERTHEORY" then
				g_PipeManager = g_PipeNumber
				PCat = "TECHTREE_NUMBERTHEORY"
			elseif tech.TechCat == "TECHTREE_ALPHABET" and prereq.TechCat == "TECHTREE_ALPHABET" then
				g_PipeManager = g_PipeAlphabet
				PCat = "TECHTREE_ALPHABET"	
			elseif tech.TechCat == "TECHTREE_ARTISANS" and prereq.TechCat == "TECHTREE_ARTISANS" then
				g_PipeManager = g_PipeArtisans
				PCat = "TECHTREE_ARTISANS"
			elseif tech.TechCat == "TECHTREE_EXOTIC_GOODS" and prereq.TechCat == "TECHTREE_EXOTIC_GOODS" then
				g_PipeManager = g_PipeExoticG
				PCat = "TECHTREE_EXOTIC_GOODS"
			elseif tech.TechCat == "TECHTREE_MEDIEVAL_UNIVERSITY" and prereq.TechCat == "TECHTREE_MEDIEVAL_UNIVERSITY" then
				g_PipeManager = g_PipeMedievalU
				PCat = "TECHTREE_MEDIEVAL_UNIVERSITY"
			elseif tech.TechCat == "TECHTREE_EMPIRICISM" and prereq.TechCat == "TECHTREE_EMPIRICISM" then
				g_PipeManager = g_PipeEmpiricism
				PCat = "TECHTREE_EMPIRICISM"	
			elseif tech.TechCat == "TECHTREE_HOMO_UNIVERSALIS" and prereq.TechCat == "TECHTREE_HOMO_UNIVERSALIS" then
				g_PipeManager = g_PipeHomo
				PCat = "TECHTREE_HOMO_UNIVERSALIS"
			elseif tech.TechCat == "TECHTREE_GEOCENTRISM" and prereq.TechCat == "TECHTREE_GEOCENTRISM" then
				g_PipeManager = g_PipeGeocentrism
				PCat = "TECHTREE_GEOCENTRISM"
			elseif tech.TechCat == "TECHTREE_ALCHEMY" and prereq.TechCat == "TECHTREE_ALCHEMY" then
				g_PipeManager = g_PipeAlchemy
				PCat = "TECHTREE_ALCHEMY"
			elseif tech.TechCat == "TECHTREE_INDUSTRIAL_REVOLUTION" and prereq.TechCat == "TECHTREE_INDUSTRIAL_REVOLUTION" then
				g_PipeManager = g_PipeIndustrialR
				PCat = "TECHTREE_INDUSTRIAL_REVOLUTION"	
			elseif tech.TechCat == "TECHTREE_SCIENCE" and prereq.TechCat == "TECHTREE_SCIENCE" then
				g_PipeManager = g_PipeScience
				PCat = "TECHTREE_SCIENCE"
			elseif tech.TechCat == "TECHTREE_SOCIAL_CLASSES" and prereq.TechCat == "TECHTREE_SOCIAL_CLASSES" then
				g_PipeManager = g_PipeSocialC
				PCat = "TECHTREE_SOCIAL_CLASSES"
			elseif tech.TechCat == "TECHTREE_ELECTRICAL_PHENOMENA" and prereq.TechCat == "TECHTREE_ELECTRICAL_PHENOMENA" then
				g_PipeManager = g_PipeElectrical
				PCat = "TECHTREE_ELECTRICAL_PHENOMENA"
			elseif tech.TechCat == "TECHTREE_MOLECULES" and prereq.TechCat == "TECHTREE_MOLECULES" then
				g_PipeManager = g_PipeMolecules
				PCat = "TECHTREE_MOLECULES"	
			elseif tech.TechCat == "TECHTREE_AERODYNAMICS" and prereq.TechCat == "TECHTREE_AERODYNAMICS" then
				g_PipeManager = g_PipeAerodynamics
				PCat = "TECHTREE_AERODYNAMICS"
			elseif tech.TechCat == "TECHTREE_DIGITAL_REVOLUTION" and prereq.TechCat == "TECHTREE_DIGITAL_REVOLUTION" then
				g_PipeManager = g_PipeDigitalR
				PCat = "TECHTREE_DIGITAL_REVOLUTION"
			elseif tech.TechCat == "TECHTREE_HUMAN_AUGMENTATION" and prereq.TechCat == "TECHTREE_HUMAN_AUGMENTATION" then
				g_PipeManager = g_PipeHumanA
				PCat = "TECHTREE_HUMAN_AUGMENTATION"
			elseif tech.TechCat == "TECHTREE_ADVANCED_ASSEMBLY" and prereq.TechCat == "TECHTREE_ADVANCED_ASSEMBLY" then
				g_PipeManager = g_PipeAdvancedA
				PCat = "TECHTREE_ADVANCED_ASSEMBLY"	
			elseif tech.TechCat == "TECHTREE_NEW_LIFE" and prereq.TechCat == "TECHTREE_NEW_LIFE" then
				g_PipeManager = g_PipeNewLife
				PCat = "TECHTREE_NEW_LIFE"
			elseif tech.TechCat == "TECHTREE_ATOM_MANIPULATION" and prereq.TechCat == "TECHTREE_ATOM_MANIPULATION" then
				g_PipeManager = g_PipeAtomM
				PCat = "TECHTREE_ATOM_MANIPULATION"
			elseif tech.TechCat == "TECHTREE_FRINGE_SCIENCE" and prereq.TechCat == "TECHTREE_FRINGE_SCIENCE" then
				g_PipeManager = g_PipeFringe
				PCat = "TECHTREE_FRINGE_SCIENCE"
			else
				g_PipeManager = g_PipeLand
			end
			
		
			if tech.TechCat == PCat and prereq.TechCat == PCat then
		
			if tech.GridX - prereq.GridX > 1 then
				local hConnection = g_PipeManager:GetInstance();
				hConnection.TechPipeIcon:SetOffsetVal(prereq.GridX*blockSpacingX + blockSizeX + 96, (prereq.GridY-5)*blockSpacingY + 12 + extraYOffset);
				hConnection.TechPipeIcon:SetTexture(hTexture);
				local size = { x = (tech.GridX-prereq.GridX - 1)*blockSpacingX + 4; y = 42; };
				hConnection.TechPipeIcon:SetSize(size);
			end
			
			if tech.GridY - prereq.GridY == 1 or tech.GridY - prereq.GridY == -1 then
				local vConnection = g_PipeManager:GetInstance();
				vConnection.TechPipeIcon:SetOffsetVal((tech.GridX-1)*blockSpacingX + blockSizeX + 96, ((tech.GridY-5)*blockSpacingY) - (((tech.GridY-prereq.GridY) * blockSpacingY) / 2) + extraYOffset);
				vConnection.TechPipeIcon:SetTexture(vTexture);
				local size = { x = 32; y = (blockSpacingY / 2) + 8; };
				vConnection.TechPipeIcon:SetSize(size);
			end

			if tech.GridY - prereq.GridY == 2 or tech.GridY - prereq.GridY == -2 then
				local vConnection = g_PipeManager:GetInstance();
				vConnection.TechPipeIcon:SetOffsetVal((tech.GridX-1)*blockSpacingX + blockSizeX + 96, (tech.GridY-5)*blockSpacingY - (((tech.GridY-prereq.GridY) * blockSpacingY) / 2) + extraYOffset);
				vConnection.TechPipeIcon:SetTexture(vTexture);
				local size = { x = 32; y = (blockSpacingY * 3 / 2) + 8; };
				vConnection.TechPipeIcon:SetSize(size);
			end
			
			if tech.GridY - prereq.GridY == 3 or tech.GridY - prereq.GridY == -3 then
				local vConnection = g_PipeManager:GetInstance();
				vConnection.TechPipeIcon:SetOffsetVal((tech.GridX-1)*blockSpacingX + blockSizeX + 96, ((tech.GridY-5)*blockSpacingY) - (((tech.GridY-prereq.GridY) * blockSpacingY) / 2) + extraYOffset);
				vConnection.TechPipeIcon:SetTexture(vTexture);
				local size = { x = 32; y = blockSpacingY * 2 + 20; };
				vConnection.TechPipeIcon:SetSize(size);
			end
			
			if tech.GridY - prereq.GridY == 4 or tech.GridY - prereq.GridY == -4 then
				local vConnection = g_PipeManager:GetInstance();
				vConnection.TechPipeIcon:SetOffsetVal((tech.GridX-1)*blockSpacingX + blockSizeX + 96, ((tech.GridY-5)*blockSpacingY) - (((tech.GridY-prereq.GridY) * blockSpacingY) / 2) + extraYOffset);
				vConnection.TechPipeIcon:SetTexture(vTexture);
				local size = { x = 32; y = blockSpacingY * 3 + 8; };
				vConnection.TechPipeIcon:SetSize(size);
			end
			end
		
		end
	end

	for pipeIndex, thisPipe in pairs(techPipes) do
	
		local tech = GameInfo.Technologies[thisPipe.techType];
		
		local yOffset = (tech.GridY-5)*blockSpacingY + 12 + extraYOffset;
		
		local PCat = NULL
			
			if tech.TechCat == "TECHTREE_LAND" then
				g_PipeManager = g_PipeLand
				PCat = "TECHTREE_LAND"
			elseif tech.TechCat == "TECHTREE_SEA" then
				g_PipeManager = g_PipeSea
				PCat = "TECHTREE_SEA"
			elseif tech.TechCat == "TECHTREE_SPIRIT" then
				g_PipeManager = g_PipeSpirit
				PCat = "TECHTREE_SPIRIT"
			elseif tech.TechCat == "TECHTREE_NUMBERTHEORY" then
				g_PipeManager = g_PipeNumber
				PCat = "TECHTREE_NUMBERTHEORY"
			elseif tech.TechCat == "TECHTREE_ALPHABET" then
				g_PipeManager = g_PipeAlphabet
				PCat = "TECHTREE_ALPHABET"	
			elseif tech.TechCat == "TECHTREE_ARTISANS" then
				g_PipeManager = g_PipeArtisans
				PCat = "TECHTREE_ARTISANS"
			elseif tech.TechCat == "TECHTREE_EXOTIC_GOODS" then
				g_PipeManager = g_PipeExoticG
				PCat = "TECHTREE_EXOTIC_GOODS"
			elseif tech.TechCat == "TECHTREE_MEDIEVAL_UNIVERSITY" then
				g_PipeManager = g_PipeMedievalU
				PCat = "TECHTREE_MEDIEVAL_UNIVERSITY"
			elseif tech.TechCat == "TECHTREE_EMPIRICISM" then
				g_PipeManager = g_PipeEmpiricism
				PCat = "TECHTREE_EMPIRICISM"	
			elseif tech.TechCat == "TECHTREE_HOMO_UNIVERSALIS" then
				g_PipeManager = g_PipeHomo
				PCat = "TECHTREE_HOMO_UNIVERSALIS"
			elseif tech.TechCat == "TECHTREE_GEOCENTRISM" then
				g_PipeManager = g_PipeGeocentrism
				PCat = "TECHTREE_GEOCENTRISM"
			elseif tech.TechCat == "TECHTREE_ALCHEMY" then
				g_PipeManager = g_PipeAlchemy
				PCat = "TECHTREE_ALCHEMY"
			elseif tech.TechCat == "TECHTREE_INDUSTRIAL_REVOLUTION" then
				g_PipeManager = g_PipeIndustrialR
				PCat = "TECHTREE_INDUSTRIAL_REVOLUTION"	
			elseif tech.TechCat == "TECHTREE_SCIENCE" then
				g_PipeManager = g_PipeScience
				PCat = "TECHTREE_SCIENCE"
			elseif tech.TechCat == "TECHTREE_SOCIAL_CLASSES" then
				g_PipeManager = g_PipeSocialC
				PCat = "TECHTREE_SOCIAL_CLASSES"
			elseif tech.TechCat == "TECHTREE_ELECTRICAL_PHENOMENA" then
				g_PipeManager = g_PipeElectrical
				PCat = "TECHTREE_ELECTRICAL_PHENOMENA"
			elseif tech.TechCat == "TECHTREE_MOLECULES" then
				g_PipeManager = g_PipeMolecules
				PCat = "TECHTREE_MOLECULES"	
			elseif tech.TechCat == "TECHTREE_AERODYNAMICS" then
				g_PipeManager = g_PipeAerodynamics
				PCat = "TECHTREE_AERODYNAMICS"
			elseif tech.TechCat == "TECHTREE_DIGITAL_REVOLUTION" then
				g_PipeManager = g_PipeDigitalR
				PCat = "TECHTREE_DIGITAL_REVOLUTION"
			elseif tech.TechCat == "TECHTREE_HUMAN_AUGMENTATION" then
				g_PipeManager = g_PipeHumanA
				PCat = "TECHTREE_HUMAN_AUGMENTATION"
			elseif tech.TechCat == "TECHTREE_ADVANCED_ASSEMBLY" then
				g_PipeManager = g_PipeAdvancedA
				PCat = "TECHTREE_ADVANCED_ASSEMBLY"	
			elseif tech.TechCat == "TECHTREE_NEW_LIFE" then
				g_PipeManager = g_PipeNewLife
				PCat = "TECHTREE_NEW_LIFE"
			elseif tech.TechCat == "TECHTREE_ATOM_MANIPULATION" then
				g_PipeManager = g_PipeAtomM
				PCat = "TECHTREE_ATOM_MANIPULATION"
			elseif tech.TechCat == "TECHTREE_FRINGE_SCIENCE" then
				g_PipeManager = g_PipeFringe
				PCat = "TECHTREE_FRINGE_SCIENCE"
			end
				
		if thisPipe.rightConnectionType >= 1 then
			
			local startPipe = g_PipeManager:GetInstance();
			startPipe.TechPipeIcon:SetOffsetVal( tech.GridX*blockSpacingX + blockSizeX + 64, yOffset );
			startPipe.TechPipeIcon:SetTexture(right1Texture);
			startPipe.TechPipeIcon:SetSize(connectorSize);
			
			local pipe = g_PipeManager:GetInstance();			
			if thisPipe.rightConnectionType == 1 then
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX + blockSizeX + 96, yOffset );
				pipe.TechPipeIcon:SetTexture(right1Texture);
			elseif thisPipe.rightConnectionType == 2 then
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX+thisPipe.xOffset)*blockSpacingX + blockSizeX + 96 - 12, yOffset - 15 );
				pipe.TechPipeIcon:SetTexture(bottomRightTexture);
				pipe.TechPipeIcon:SetTextureOffset(Vector2(72,72));
			elseif thisPipe.rightConnectionType == 3 then
				--pipe.TechPipeIcon:SetOffsetVal( (tech.GridX+thisPipe.xOffset)*blockSpacingX + blockSizeX + 96 - 6, yOffset - 15 );
				--pipe.TechPipeIcon:SetTexture(right2BTexture);
				--pipe.TechPipeIcon:SetTextureOffset(Vector2(36,72));
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX + blockSizeX + 96, yOffset );
				pipe.TechPipeIcon:SetTexture(right1Texture);
				pipe = g_PipeManager:GetInstance();			
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX+thisPipe.xOffset)*blockSpacingX + blockSizeX + 96 - 12, yOffset - 15 );
				pipe.TechPipeIcon:SetTexture(bottomRightTexture);
				pipe.TechPipeIcon:SetTextureOffset(Vector2(72,72));
			elseif thisPipe.rightConnectionType == 4 then
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX+thisPipe.xOffset)*blockSpacingX + blockSizeX + 96 - 12, yOffset );
				pipe.TechPipeIcon:SetTexture(topRightTexture);
				pipe.TechPipeIcon:SetTextureOffset(Vector2(72,0));
			elseif thisPipe.rightConnectionType == 5 then
				--pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX + blockSizeX + 96 - 6, yOffset );
				--pipe.TechPipeIcon:SetTexture(right2TTexture);
				--pipe.TechPipeIcon:SetTextureOffset(Vector2(36,0));
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX + blockSizeX + 96, yOffset );
				pipe.TechPipeIcon:SetTexture(right1Texture);
				pipe = g_PipeManager:GetInstance();			
		-- Modified by Jeremy Norton 05/10/10
		--pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX + blockSizeX + 96 - 12, yOffset );
		--pipe.TechPipeIcon:SetTexture(topRightTexture);
		--pipe.TechPipeIcon:SetTextureOffset(Vector2(72,0));
		pipe.TechPipeIcon:SetOffsetVal( (tech.GridX+thisPipe.xOffset)*blockSpacingX + blockSizeX + 96 - 12, yOffset );
		pipe.TechPipeIcon:SetTexture(topRightTexture);
		pipe.TechPipeIcon:SetTextureOffset(Vector2(72,0));
		-- End of Changes
			elseif thisPipe.rightConnectionType == 6 then
				--pipe.TechPipeIcon:SetOffsetVal( (tech.GridX+thisPipe.xOffset)*blockSpacingX + blockSizeX + 96 - 12, yOffset - 6 );
				--pipe.TechPipeIcon:SetTexture(right2Texture);
				--pipe.TechPipeIcon:SetTextureOffset(Vector2(72,36));
		-- Modified by Jeremy Norton 05/10/10
		--pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX + blockSizeX + 96 - 12, yOffset );
		--pipe.TechPipeIcon:SetTexture(topRightTexture);
		--pipe.TechPipeIcon:SetTextureOffset(Vector2(72,0));
		pipe.TechPipeIcon:SetOffsetVal( (tech.GridX+thisPipe.xOffset)*blockSpacingX + blockSizeX + 96 - 12, yOffset );
		pipe.TechPipeIcon:SetTexture(topRightTexture);
		pipe.TechPipeIcon:SetTextureOffset(Vector2(72,0));
		-- End of Changes
				pipe = g_PipeManager:GetInstance();			
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX+thisPipe.xOffset)*blockSpacingX + blockSizeX + 96 - 12, yOffset - 15 );
				pipe.TechPipeIcon:SetTexture(bottomRightTexture);
				pipe.TechPipeIcon:SetTextureOffset(Vector2(72,72));
			else-- thisPipe.rightConnectionType == 7 then
				--pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX + blockSizeX + 96 - 6, yOffset - 6 );
				--pipe.TechPipeIcon:SetTexture(right3Texture);
				--pipe.TechPipeIcon:SetTextureOffset(Vector2(36,36));
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX + blockSizeX + 96, yOffset );
				pipe.TechPipeIcon:SetTexture(right1Texture);
				pipe = g_PipeManager:GetInstance();			
		-- Modified by Jeremy Norton 05/10/10
		--pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX + blockSizeX + 96 - 12, yOffset );
		--pipe.TechPipeIcon:SetTexture(topRightTexture);
		--pipe.TechPipeIcon:SetTextureOffset(Vector2(72,0));
		pipe.TechPipeIcon:SetOffsetVal( (tech.GridX+thisPipe.xOffset)*blockSpacingX + blockSizeX + 96 - 12, yOffset );
		pipe.TechPipeIcon:SetTexture(topRightTexture);
		pipe.TechPipeIcon:SetTextureOffset(Vector2(72,0));
		-- End of Changes
				pipe = g_PipeManager:GetInstance();			
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX+thisPipe.xOffset)*blockSpacingX + blockSizeX + 96 - 12, yOffset - 15 );
				pipe.TechPipeIcon:SetTexture(bottomRightTexture);
				pipe.TechPipeIcon:SetTextureOffset(Vector2(72,72));
			end
		end
		
		
		if thisPipe.leftConnectionType >= 1 then
			
			local startPipe = g_PipeManager:GetInstance();
			startPipe.TechPipeIcon:SetOffsetVal( tech.GridX*blockSpacingX + 26, yOffset );
			startPipe.TechPipeIcon:SetTexture(left1Texture);
			startPipe.TechPipeIcon:SetSize(	Vector2(40, 42) );
			
			local pipe = g_PipeManager:GetInstance();			
			if thisPipe.leftConnectionType == 1 then
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX, yOffset );
				pipe.TechPipeIcon:SetTexture(left1Texture);
			elseif thisPipe.leftConnectionType == 2 then
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX, yOffset - 15);
				pipe.TechPipeIcon:SetTexture(bottomLeftTexture);
				pipe.TechPipeIcon:SetTextureOffset(Vector2(0,72));
			elseif thisPipe.leftConnectionType == 3 then
				--pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX - 6, yOffset - 15 );
				--pipe.TechPipeIcon:SetTexture(left2BTexture);
				--pipe.TechPipeIcon:SetTextureOffset(Vector2(36,72));
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX, yOffset );
				pipe.TechPipeIcon:SetTexture(left1Texture);
				pipe = g_PipeManager:GetInstance();	
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX, yOffset - 15);
				pipe.TechPipeIcon:SetTexture(bottomLeftTexture);
				pipe.TechPipeIcon:SetTextureOffset(Vector2(0,72));
			elseif thisPipe.leftConnectionType == 4 then
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX, yOffset );
				pipe.TechPipeIcon:SetTexture(topLeftTexture);
				pipe.TechPipeIcon:SetTextureOffset(Vector2(0,0));
			elseif thisPipe.leftConnectionType == 5 then
				--pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX - 6, yOffset );
				--pipe.TechPipeIcon:SetTexture(left2TTexture);
				--pipe.TechPipeIcon:SetTextureOffset(Vector2(36,0));
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX, yOffset );
				pipe.TechPipeIcon:SetTexture(left1Texture);
				pipe = g_PipeManager:GetInstance();	
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX, yOffset );
				pipe.TechPipeIcon:SetTexture(topLeftTexture);
				pipe.TechPipeIcon:SetTextureOffset(Vector2(0,0));
			elseif thisPipe.leftConnectionType == 6 then
				--pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX, yOffset - 6 );
				--pipe.TechPipeIcon:SetTexture(left2Texture);
				--pipe.TechPipeIcon:SetTextureOffset(Vector2(0,36));
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX, yOffset );
				pipe.TechPipeIcon:SetTexture(topLeftTexture);
				pipe.TechPipeIcon:SetTextureOffset(Vector2(0,0));
				pipe = g_PipeManager:GetInstance();	
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX, yOffset - 15);
				pipe.TechPipeIcon:SetTexture(bottomLeftTexture);
				pipe.TechPipeIcon:SetTextureOffset(Vector2(0,72));
			else-- thisPipe.rightConnectionType == 7 then
				--pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX - 6, yOffset - 6 );
				--pipe.TechPipeIcon:SetTexture(left2Texture);
				--pipe.TechPipeIcon:SetTextureOffset(Vector2(36,36));
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX, yOffset );
				pipe.TechPipeIcon:SetTexture(left1Texture);
				pipe = g_PipeManager:GetInstance();	
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX, yOffset );
				pipe.TechPipeIcon:SetTexture(topLeftTexture);
				pipe.TechPipeIcon:SetTextureOffset(Vector2(0,0));
				pipe = g_PipeManager:GetInstance();	
				pipe.TechPipeIcon:SetOffsetVal( (tech.GridX)*blockSpacingX, yOffset - 15);
				pipe.TechPipeIcon:SetTexture(bottomLeftTexture);
				pipe.TechPipeIcon:SetTextureOffset(Vector2(0,72));
			end
		end
		
	end

	techPediaSearchStrings = {};

	-- add the instances of the tech panels
	for tech in GameInfo.Technologies() do
		AddTechButton( tech );
	end

	-- resize the panel to fit the contents
	
    Controls.LandTechTreeScrollPanel:CalculateInternalSize();
	Controls.SeaTechTreeScrollPanel:CalculateInternalSize();
	Controls.SpiritTechTreeScrollPanel:CalculateInternalSize();
	Controls.NumberTechTreeScrollPanel:CalculateInternalSize();
	Controls.AlphabetTechTreeScrollPanel:CalculateInternalSize();
	Controls.ArtisansTechTreeScrollPanel:CalculateInternalSize();
	Controls.ExoticGTechTreeScrollPanel:CalculateInternalSize();
	Controls.MedievalUTechTreeScrollPanel:CalculateInternalSize();
	Controls.EmpiricismTechTreeScrollPanel:CalculateInternalSize();
	Controls.HomoTechTreeScrollPanel:CalculateInternalSize();	
	Controls.GeocentrismTechTreeScrollPanel:CalculateInternalSize();
	Controls.AlchemyTechTreeScrollPanel:CalculateInternalSize();
	Controls.IndustrialRTechTreeScrollPanel:CalculateInternalSize();
	Controls.ScienceTechTreeScrollPanel:CalculateInternalSize();
	Controls.SocialCTechTreeScrollPanel:CalculateInternalSize();
	Controls.ElectricalTechTreeScrollPanel:CalculateInternalSize();
	Controls.MoleculesTechTreeScrollPanel:CalculateInternalSize();
	Controls.AerodynamicsTechTreeScrollPanel:CalculateInternalSize();
	Controls.DigitalRTechTreeScrollPanel:CalculateInternalSize();
	Controls.HumanATechTreeScrollPanel:CalculateInternalSize();
	Controls.AdvancedATechTreeScrollPanel:CalculateInternalSize();
	Controls.NewLifeTechTreeScrollPanel:CalculateInternalSize();
	Controls.AtomMTechTreeScrollPanel:CalculateInternalSize();
	Controls.FringeTechTreeScrollPanel:CalculateInternalSize();
    
    --initialized = true;		
end

function TechSelected( eTech, iDiscover)
	--print("eTech:"..tostring(eTech));
	if eTech > -1 then
   		Network.SendResearch(eTech, player:GetNumFreeTechs(), -1, UIManager:GetShift());
   	end
end

function AddTechButton( tech )

		local PCat = NULL
			
		if tech.TechCat == "TECHTREE_LAND" then
			g_TechInstanceManager = g_TechInstanceLand
			PCat = "TECHTREE_LAND"
		elseif tech.TechCat == "TECHTREE_SEA" then
			g_TechInstanceManager = g_TechInstanceSea
			PCat = "TECHTREE_SEA"
		elseif tech.TechCat == "TECHTREE_SPIRIT" then
			g_TechInstanceManager = g_TechInstanceSpirit
			PCat = "TECHTREE_SPIRIT"
		elseif tech.TechCat == "TECHTREE_NUMBERTHEORY" then
			g_TechInstanceManager = g_TechInstanceNumber
			PCat = "TECHTREE_NUMBERTHEORY"
		elseif tech.TechCat == "TECHTREE_ALPHABET" then
			g_TechInstanceManager = g_TechInstanceAlphabet
			PCat = "TECHTREE_ALPHABET"	
		elseif tech.TechCat == "TECHTREE_ARTISANS" then
			g_TechInstanceManager = g_TechInstanceArtisans
			PCat = "TECHTREE_ARTISANS"
		elseif tech.TechCat == "TECHTREE_EXOTIC_GOODS" then
			g_TechInstanceManager = g_TechInstanceExoticG
			PCat = "TECHTREE_EXOTIC_GOODS"
		elseif tech.TechCat == "TECHTREE_MEDIEVAL_UNIVERSITY" then
			g_TechInstanceManager = g_TechInstanceMedievalU
			PCat = "TECHTREE_MEDIEVAL_UNIVERSITY"
		elseif tech.TechCat == "TECHTREE_EMPIRICISM" then
			g_TechInstanceManager = g_TechInstanceEmpiricism
			PCat = "TECHTREE_EMPIRICISM"	
		elseif tech.TechCat == "TECHTREE_HOMO_UNIVERSALIS" then
			g_TechInstanceManager = g_TechInstanceHomo
			PCat = "TECHTREE_HOMO_UNIVERSALIS"
		elseif tech.TechCat == "TECHTREE_GEOCENTRISM" then
			g_TechInstanceManager = g_TechInstanceGeocentrism
			PCat = "TECHTREE_GEOCENTRISM"
		elseif tech.TechCat == "TECHTREE_ALCHEMY" then
			g_TechInstanceManager = g_TechInstanceAlchemy
			PCat = "TECHTREE_ALCHEMY"
		elseif tech.TechCat == "TECHTREE_INDUSTRIAL_REVOLUTION" then
			g_TechInstanceManager = g_TechInstanceIndustrialR
			PCat = "TECHTREE_INDUSTRIAL_REVOLUTION"	
		elseif tech.TechCat == "TECHTREE_SCIENCE" then
			g_TechInstanceManager = g_TechInstanceScience
			PCat = "TECHTREE_SCIENCE"
		elseif tech.TechCat == "TECHTREE_SOCIAL_CLASSES" then
			g_TechInstanceManager = g_TechInstanceSocialC
			PCat = "TECHTREE_SOCIAL_CLASSES"
		elseif tech.TechCat == "TECHTREE_ELECTRICAL_PHENOMENA" then
			g_TechInstanceManager = g_TechInstanceElectrical
			PCat = "TECHTREE_ELECTRICAL_PHENOMENA"
		elseif tech.TechCat == "TECHTREE_MOLECULES" then
			g_TechInstanceManager = g_TechInstanceMolecules
			PCat = "TECHTREE_MOLECULES"	
		elseif tech.TechCat == "TECHTREE_AERODYNAMICS" then
			g_TechInstanceManager = g_TechInstanceAerodynamics
			PCat = "TECHTREE_AERODYNAMICS"
		elseif tech.TechCat == "TECHTREE_DIGITAL_REVOLUTION" then
			g_TechInstanceManager = g_TechInstanceDigitalR
			PCat = "TECHTREE_DIGITAL_REVOLUTION"
		elseif tech.TechCat == "TECHTREE_HUMAN_AUGMENTATION" then
			g_TechInstanceManager = g_TechInstanceHumanA
			PCat = "TECHTREE_HUMAN_AUGMENTATION"
		elseif tech.TechCat == "TECHTREE_ADVANCED_ASSEMBLY" then
			g_TechInstanceManager = g_TechInstanceAdvancedA
			PCat = "TECHTREE_ADVANCED_ASSEMBLY"	
		elseif tech.TechCat == "TECHTREE_NEW_LIFE" then
			g_TechInstanceManager = g_TechInstanceNewLife
			PCat = "TECHTREE_NEW_LIFE"
		elseif tech.TechCat == "TECHTREE_ATOM_MANIPULATION" then
			g_TechInstanceManager = g_TechInstanceAtomM
			PCat = "TECHTREE_ATOM_MANIPULATION"
		elseif tech.TechCat == "TECHTREE_FRINGE_SCIENCE" then
			g_TechInstanceManager = g_TechInstanceFringe
			PCat = "TECHTREE_FRINGE_SCIENCE"
		else
			g_TechInstanceManager = g_TechInstanceLand
		end
	
	local thisTechButtonInstance = g_TechInstanceManager:GetInstance();
	
	if thisTechButtonInstance then
		
		-- store this instance off for later
		techButtons[tech.ID] = thisTechButtonInstance;
		
		-- add the input handler to this button
		thisTechButtonInstance.TechButton:SetVoid1( tech.ID ); -- indicates tech to add to queue
		thisTechButtonInstance.TechButton:SetVoid2( 0 ); -- how many free techs
		techPediaSearchStrings[tostring(thisTechButtonInstance.TechButton)] = tech.Description;
		thisTechButtonInstance.TechButton:RegisterCallback( Mouse.eRClick, GetTechPedia );

		local scienceDisabled = Game.IsOption(GameOptionTypes.GAMEOPTION_NO_SCIENCE);
 		if (not scienceDisabled) then
			thisTechButtonInstance.TechButton:RegisterCallback( Mouse.eLClick, TechSelected );
		end
		
		-- position this instance
		thisTechButtonInstance.TechButton:SetOffsetVal( tech.GridX*blockSpacingX + 64, (tech.GridY-5)*blockSpacingY + extraYOffset);
		
		-- update the name of this instance
		local techName = Locale.ConvertTextKey( tech.Description );
		
		techName = Locale.TruncateString(techName, maxTechNameLength, true);
		thisTechButtonInstance.AlreadyResearchedTechName:SetText( techName );
		thisTechButtonInstance.CurrentlyResearchingTechName:SetText( techName );
		thisTechButtonInstance.AvailableTechName:SetText( techName );
		thisTechButtonInstance.UnavailableTechName:SetText( techName );
		thisTechButtonInstance.LockedTechName:SetText( techName );
		thisTechButtonInstance.FreeTechName:SetText( techName );
		
		local bShowProgress = false;
		thisTechButtonInstance.TechButton:SetToolTipString( GetHelpTextForTech(tech.ID, bShowProgress) );
		
		-- update the picture
		if IconHookup( tech.PortraitIndex, 64, tech.IconAtlas, thisTechButtonInstance.TechPortrait ) then
			thisTechButtonInstance.TechPortrait:SetHide( false );
		else
			thisTechButtonInstance.TechPortrait:SetHide( true );
		end
		
		-- add the small pictures and their tooltips
		AddSmallButtonsToTechButton( thisTechButtonInstance, tech, maxSmallButtons, 45 );
		
	end
end

function whichPipeManager( tech )

end

function whichTechManager( tech )

end

-------------------------------------------------
-- On Display
-------------------------------------------------
local g_isOpen = false;

function OnDisplay( popupInfo )

	if popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_TECH_TREE then
		return;
	end
	
	if (popupInfo.Data1 == 901) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_LAND" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(false);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
		
	elseif (popupInfo.Data1 == 902) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_SEA" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(false);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 903) then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_SPIRIT" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(false);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 904) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_NUMBERTHEORY" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(false);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 905) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_ALPHABET" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(false);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 906) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_ARTISANS" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(false);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 907) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_EXOTIC_GOODS" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(false);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 908) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_MEDIEVAL_UNIVERSITY" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(false);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 909) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_EMPIRICISM" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(false);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 910) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_HOMO_UNIVERSALIS" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(false);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 911) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_GEOCENTRISM" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(false);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 912) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_ALCHEMY" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(false);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 913) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_INDUSTRIAL_REVOLUTION" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(false);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 914) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_SCIENCE" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(false);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 915) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_SOCIAL_CLASSES" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(false);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 916) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_ELECTRICAL_PHENOMENA" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(false);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 917) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_MOLECULES" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(false);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 918) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_AERODYNAMICS" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(false);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 919) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_DIGITAL_REVOLUTION" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(false);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 920) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_HUMAN_AUGMENTATION" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(false);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 921) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_ADVANCED_ASSEMBLY" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(false);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 922) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_NEW_LIFE" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(false);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 923) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_ATOM_MANIPULATION" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(false);
		Controls.FringeTechTreeScrollPanel:SetHide(true);
	elseif (popupInfo.Data1 == 924) then
		TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_FRINGE_SCIENCE" );
		Controls.Tech_Tree_Label:SetText( TechPageDesc );
		Controls.LandTechTreeScrollPanel:SetHide(true);
		Controls.SeaTechTreeScrollPanel:SetHide(true);
		Controls.SpiritTechTreeScrollPanel:SetHide(true);
		Controls.NumberTechTreeScrollPanel:SetHide(true);
		Controls.AlphabetTechTreeScrollPanel:SetHide(true);
		Controls.ArtisansTechTreeScrollPanel:SetHide(true);
		Controls.ExoticGTechTreeScrollPanel:SetHide(true);
		Controls.MedievalUTechTreeScrollPanel:SetHide(true);
		Controls.EmpiricismTechTreeScrollPanel:SetHide(true);
		Controls.HomoTechTreeScrollPanel:SetHide(true);
		Controls.GeocentrismTechTreeScrollPanel:SetHide(true);
		Controls.AlchemyTechTreeScrollPanel:SetHide(true);
		Controls.IndustrialRTechTreeScrollPanel:SetHide(true);
		Controls.ScienceTechTreeScrollPanel:SetHide(true);
		Controls.SocialCTechTreeScrollPanel:SetHide(true);
		Controls.ElectricalTechTreeScrollPanel:SetHide(true);
		Controls.MoleculesTechTreeScrollPanel:SetHide(true);
		Controls.AerodynamicsTechTreeScrollPanel:SetHide(true);
		Controls.DigitalRTechTreeScrollPanel:SetHide(true);
		Controls.HumanATechTreeScrollPanel:SetHide(true);
		Controls.AdvancedATechTreeScrollPanel:SetHide(true);
		Controls.NewLifeTechTreeScrollPanel:SetHide(true);
		Controls.AtomMTechTreeScrollPanel:SetHide(true);
		Controls.FringeTechTreeScrollPanel:SetHide(false);
	else
		return;
	end
	
	CivIconHookup( Game.GetActivePlayer(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true );

	m_PopupInfo = popupInfo;

    g_isOpen = true;
    if not g_NeedsFullRefresh then
		g_NeedsFullRefresh = g_NeedsFullRefreshOnOpen;
	end
	g_NeedsFullRefreshOnOpen = false;

	if( m_PopupInfo.Data1 == 1 ) then
    	if( ContextPtr:IsHidden() == false ) then
    	    OnCloseButtonClicked();
    	    return;
    	else
        	UIManager:QueuePopup( ContextPtr, PopupPriority.eUtmost );
    	end
	else
        UIManager:QueuePopup( ContextPtr, PopupPriority.TechTree );
    end
    
	Events.SerialEventGameMessagePopupShown(m_PopupInfo);
	
  	RefreshDisplay();
  	
end
Events.SerialEventGameMessagePopup.Add( OnDisplay );

function RefreshDisplay()

	for tech in GameInfo.Technologies() do
		RefreshDisplayOfSpecificTech( tech );
	end
	
	g_NeedsFullRefresh = false;
end
Events.SerialEventResearchDirty.Add(RefreshDisplay);

function RefreshDisplayOfSpecificTech( tech )
	local techID = tech.ID;
	local thisTechButton = techButtons[techID];
  	local numFreeTechs = player:GetNumFreeTechs();
 	local researchTurnsLeft = player:GetResearchTurnsLeft( techID, true );
 	local turnText = tostring( researchTurnsLeft ).." "..turnsString;
 	
 	-- Rebuild the small buttons if needed
 	if (g_NeedsFullRefresh) then
		AddSmallButtonsToTechButton( thisTechButton, tech, maxSmallButtons, 45 );
 	end
 	
 	local scienceDisabled = Game.IsOption(GameOptionTypes.GAMEOPTION_NO_SCIENCE);
 	if (scienceDisabled) then
 		turnText = "";
 	end
 	
 	
	if(not scienceDisabled) then
		thisTechButton.TechButton:SetVoid1( techID ); -- indicates tech to add to queue
		thisTechButton.TechButton:SetVoid2( numFreeTechs ); -- how many free techs
		AddCallbackToSmallButtons( thisTechButton, maxSmallButtons, techID, numFreeTechs, Mouse.eLClick, TechSelected );
	end
	
 	if activeTeam:GetTeamTechs():HasTech(techID) then -- the player (or more accurately his team) has already researched this one
 		thisTechButton.AlreadyResearched:SetHide( false );
 		thisTechButton.FreeTech:SetHide( true );
 		thisTechButton.CurrentlyResearching:SetHide( true );
 		thisTechButton.Available:SetHide( true );
 		thisTechButton.Unavailable:SetHide( true );
		thisTechButton.Locked:SetHide( true );
 
 		-- figure out if we need the first place dingus
 
 		-- update the era marker for this tech
 		local eraID = GameInfo.Eras[tech.Era].ID;
		if eraColumns[eraID] then
			eraColumns[eraID].researched = true;
		end
		
  		-- hide advisor icon
 		--thisTechButton.AdvisorIcon:SetHide( true );
 				
		if(not scienceDisabled) then
			thisTechButton.TechQueue:SetHide( true );
			thisTechButton.TechButton:SetVoid2( 0 ); -- num free techs
			thisTechButton.TechButton:SetVoid1( -1 ); -- indicates tech is invalid
			AddCallbackToSmallButtons( thisTechButton, maxSmallButtons, -1, 0, Mouse.eLClick, TechSelected );
 		end
 		
 	elseif player:GetCurrentResearch() == techID then -- the player is currently researching this one
 		thisTechButton.AlreadyResearched:SetHide( true );
 		thisTechButton.Available:SetHide( true );
 		thisTechButton.Unavailable:SetHide( true );
		thisTechButton.Locked:SetHide( true );
		-- deal with free tech
		if player:GetNumFreeTechs() > 0 then
  			thisTechButton.FreeTech:SetHide( false );
 			thisTechButton.CurrentlyResearching:SetHide( true );
			-- update number of turns to research
 			if 	player:GetScience() > 0 then
  				thisTechButton.FreeTurns:SetText( turnText );
  				thisTechButton.FreeTurns:SetHide( false );
  			else
  				thisTechButton.FreeTurns:SetHide( true );
  			end
			thisTechButton.TechQueueLabel:SetText( freeString );
			thisTechButton.TechQueue:SetHide( false );
		else
  			thisTechButton.FreeTech:SetHide( true );
 			thisTechButton.CurrentlyResearching:SetHide( false );
			-- update number of turns to research
 			if 	player:GetScience() > 0 then
  				thisTechButton.CurrentlyResearchingTurns:SetText( turnText );
  				thisTechButton.CurrentlyResearchingTurns:SetHide( false );
  			else
  				thisTechButton.CurrentlyResearchingTurns:SetHide( true );
  			end
			thisTechButton.TechQueue:SetHide( true );
		end
 		-- turn on the meter
		local teamTechs = activeTeam:GetTeamTechs();
		local researchProgressPercent = 0;
		local researchProgressPlusThisTurnPercent = 0;
		local researchTurnsLeft = player:GetResearchTurnsLeft(techID, true);
		local currentResearchProgress = player:GetResearchProgress(techID);
		local researchNeeded = player:GetResearchCost(techID);
		local researchPerTurn = player:GetScience();
		local currentResearchPlusThisTurn = currentResearchProgress + researchPerTurn;		
		researchProgressPercent = currentResearchProgress / researchNeeded;
		researchProgressPlusThisTurnPercent = currentResearchPlusThisTurn / researchNeeded;		
		if (researchProgressPlusThisTurnPercent > 1) then
			researchProgressPlusThisTurnPercent = 1
		end
 		-- update advisor icon if needed
 		--thisTechButton.AdvisorIcon:SetHide( true );
 	elseif (player:CanResearch( techID ) and not scienceDisabled) then -- the player research this one right now if he wants
 		thisTechButton.AlreadyResearched:SetHide( true );
 		thisTechButton.CurrentlyResearching:SetHide( true );
 		thisTechButton.Unavailable:SetHide( true );
		thisTechButton.Locked:SetHide( true );
 		-- deal with free 		
		if player:GetNumFreeTechs() > 0 then
 			thisTechButton.FreeTech:SetHide( false );
 			thisTechButton.Available:SetHide( true );
			-- update number of turns to research
 			if 	player:GetScience() > 0 then
  				thisTechButton.FreeTurns:SetText( turnText );
  				thisTechButton.FreeTurns:SetHide( false );
  			else
  				thisTechButton.FreeTurns:SetHide( true );
  			end
			-- update queue number to say "FREE"
			thisTechButton.TechQueueLabel:SetText( freeString );
			thisTechButton.TechQueue:SetHide( false );
		else
 			thisTechButton.FreeTech:SetHide( true );
 			thisTechButton.Available:SetHide( false );
			-- update number of turns to research
 			if 	player:GetScience() > 0 then
  				thisTechButton.AvailableTurns:SetText( turnText );
  				thisTechButton.AvailableTurns:SetHide( false );
  			else
  				thisTechButton.AvailableTurns:SetHide( true );
  			end
			-- update queue number if needed
			local queuePosition = player:GetQueuePosition( techID );
			if queuePosition == -1 then
				thisTechButton.TechQueue:SetHide( true );
			else
				thisTechButton.TechQueueLabel:SetText( tostring( queuePosition-1 ) );
				thisTechButton.TechQueue:SetHide( false );
			end
		end
  		-- update advisor icon if needed
 		--thisTechButton.AdvisorIcon:SetHide( true );
 	elseif (not player:CanEverResearch( techID ) or player:GetNumFreeTechs() > 0) then
 		thisTechButton.AlreadyResearched:SetHide( true );
 		thisTechButton.CurrentlyResearching:SetHide( true );
 		thisTechButton.Available:SetHide( true );
 		thisTechButton.Unavailable:SetHide( true );
		thisTechButton.Locked:SetHide( false );
  		thisTechButton.FreeTech:SetHide( true );
		-- have queue number say "LOCKED"
		thisTechButton.TechQueueLabel:SetText( lockedString );
		thisTechButton.TechQueue:SetHide( false );
		-- hide the advisor icon
 		--thisTechButton.AdvisorIcon:SetHide( true );
		if(not scienceDisabled) then
			thisTechButton.TechButton:SetVoid1( -1 ); 
			thisTechButton.TechButton:SetVoid2( 0 ); -- num free techs
			AddCallbackToSmallButtons( thisTechButton, maxSmallButtons, -1, 0, Mouse.eLClick, TechSelected );
 		end
 	else -- currently unavailable
 		thisTechButton.AlreadyResearched:SetHide( true );
 		thisTechButton.CurrentlyResearching:SetHide( true );
 		thisTechButton.Available:SetHide( true );
 		thisTechButton.Unavailable:SetHide( false );
		thisTechButton.Locked:SetHide( true );
  		thisTechButton.FreeTech:SetHide( true );
 		-- update number of turns to research
 		if 	player:GetScience() > 0 then
  			thisTechButton.UnavailableTurns:SetText( turnText );
  			thisTechButton.UnavailableTurns:SetHide( false );
  		else
  			thisTechButton.UnavailableTurns:SetHide( true );
  		end
  		
		-- update queue number if needed
		local queuePosition = player:GetQueuePosition( techID );
		if queuePosition == -1 then
			thisTechButton.TechQueue:SetHide( true );
		else
			thisTechButton.TechQueueLabel:SetText( tostring( queuePosition-1 ) );
			thisTechButton.TechQueue:SetHide( false );
		end
		
 		-- update advisor icon if needed
 		--thisTechButton.AdvisorIcon:SetHide( true );

		if player:GetNumFreeTechs() > 0 then
			thisTechButton.TechButton:SetVoid1( -1 ); 
			AddCallbackToSmallButtons( thisTechButton, maxSmallButtons, -1, 0, Mouse.eLClick, OnTechnologyButtonClicked );
		else
			if(not scienceDisabled) then
				thisTechButton.TechButton:SetVoid1( tech.ID );
				AddCallbackToSmallButtons( thisTechButton, maxSmallButtons, techID, numFreeTechs, Mouse.eLClick, TechSelected );
			end
		end
	end
end

----------------------------------------------------------------        
-- Input processing
----------------------------------------------------------------        

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnCloseButtonClicked ()
	UIManager:DequeuePopup( ContextPtr );
    --Events.SerialEventGameMessagePopupProcessed.CallImmediate(ButtonPopupTypes.BUTTONPOPUP_TECH_TREE, 0);
	g_isOpen = false;
	--Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_TECH_TREE, 0 } );
    
		
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnCloseButtonClicked );

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function InputHandler( uiMsg, wParam, lParam )
    if g_isOpen and uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
            UIManager:DequeuePopup( ContextPtr );
            g_isOpen = false;
            return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );


function ShowHideHandler( bIsHide, bIsInit )
    if( not bIsInit ) then
        if( not bIsHide ) then
        	UI.incTurnTimerSemaphore();
        else
        	UI.decTurnTimerSemaphore();
        end
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnTechTreeActivePlayerChanged( iActivePlayer, iPrevActivePlayer )
	playerID = Game.GetActivePlayer();	
	player = Players[playerID];
	civType = GameInfo.Civilizations[player:GetCivilizationType()].Type;
	activeTeamID = Game.GetActiveTeam();
	activeTeam = Teams[activeTeamID];	
	-- Rebuild some tables	
	GatherInfoAboutUniqueStuff( civType );	
	
	-- So some extra stuff gets re-built on the refresh call
	if not g_isOpen then
		g_NeedsFullRefreshOnOpen = true;	
	else
		g_NeedsFullRefresh = true;
	end
	
	-- Close it, so the next player does not have to.
	OnCloseButtonClicked();
end
Events.GameplaySetActivePlayer.Add(OnTechTreeActivePlayerChanged);

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- One time initialization
InitialSetup()