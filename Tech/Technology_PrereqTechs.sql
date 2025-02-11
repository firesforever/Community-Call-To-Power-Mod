-- Delete Existing table
DROP TABLE IF EXISTS Technology_PrereqTechs;
-- Create New Table
CREATE TABLE Technology_PrereqTechs ('TechType' text , 
									 'PrereqTech' text , foreign key (TechType) references Technologies(Type), foreign key (PrereqTech) references Technologies(Type));
-- Populate Table, Ancient
--Settler
INSERT INTO Technology_PrereqTechs		(TechType,								PrereqTech)
SELECT									'TECH_CALENDAR',						'TECH_AGRICULTURE'				UNION ALL
SELECT									'TECH_ANIMAL_HUSBANDRY',				'TECH_AGRICULTURE'				UNION ALL
SELECT									'TECH_HERDING',							'TECH_ANIMAL_HUSBANDRY'			UNION ALL

SELECT									'TECH_RAW_MATERIALS',					'TECH_MINING'					UNION ALL
SELECT									'TECH_POTTERY',							'TECH_CALENDAR'					UNION ALL
SELECT									'TECH_POTTERY',							'TECH_RAW_MATERIALS'			UNION ALL
SELECT									'TECH_MASONRY',							'TECH_POTTERY'					UNION ALL

--Nomad
SELECT									'TECH_SHIPBUILDING',					'TECH_SAILING'					UNION ALL

SELECT									'TECH_TRADING',							'TECH_ECONOMY_OF_SCALE'			UNION ALL
SELECT									'TECH_FERMENTATION',					'TECH_TRADING'					UNION ALL

SELECT									'TECH_ARCHERY',							'TECH_TRAPPING'					UNION ALL
SELECT									'TECH_BRONZE_WORKING',					'TECH_TRAPPING'					UNION ALL

--Spirit
SELECT									'TECH_CEREMONIAL_BURIAL',				'TECH_ORAL_TRADITION'			UNION ALL
SELECT									'TECH_GREAT_MONUMENTS',					'TECH_CEREMONIAL_BURIAL'		UNION ALL

SELECT									'TECH_POLYTHEISM',						'TECH_MYSTICISM'				UNION ALL
SELECT									'TECH_MEDITATION',						'TECH_POLYTHEISM'				UNION ALL
SELECT									'TECH_SPORTS',							'TECH_MEDITATION'				UNION ALL
SELECT									'TECH_MILITARY_TRAINING',				'TECH_SPORTS'					UNION ALL

--**Links Between Ancient and Classical**
SELECT									'TECH_THE_WHEEL',						'TECH_HERDING'					UNION ALL
SELECT									'TECH_THE_WHEEL',						'TECH_BRONZE_WORKING'			UNION ALL
SELECT									'TECH_CURRENCY',						'TECH_TRADING'					UNION ALL
SELECT									'TECH_CURRENCY',						'TECH_BRONZE_WORKING'			UNION ALL

SELECT									'TECH_WRITING',							'TECH_MEDITATION'				UNION ALL
SELECT									'TECH_WRITING',							'TECH_GREAT_MONUMENTS'			UNION ALL

SELECT									'TECH_CONSTRUCTION',					'TECH_MASONRY'					UNION ALL
SELECT									'TECH_IRON_WORKING',					'TECH_MILITARY_TRAINING'		UNION ALL
SELECT									'TECH_OPTICS',							'TECH_SHIPBUILDING';

-- Populate Table, Classical
-- Number Theory
INSERT INTO Technology_PrereqTechs		(TechType,								PrereqTech)
SELECT									'TECH_CARRIAGES',						'TECH_THE_WHEEL'				UNION ALL
SELECT									'TECH_MATHEMATICS',						'TECH_CARRIAGES'				UNION ALL
SELECT									'TECH_HORSEBACK_RIDING',				'TECH_CARRIAGES'				UNION ALL

SELECT									'TECH_CURRENCY',						'TECH_MATHEMATICS'				UNION ALL
SELECT									'TECH_FARMERS_MARKETS',					'TECH_CURRENCY'					UNION ALL
SELECT									'TECH_FISH_MARKETS',					'TECH_CURRENCY'					UNION ALL
SELECT									'TECH_ANIMAL_MARKETS',					'TECH_CURRENCY'					UNION ALL
-- Alphabet
SELECT									'TECH_PHILOSOPHY',						'TECH_WRITING'					UNION ALL
SELECT									'TECH_MONOTHEISM',						'TECH_PHILOSOPHY'				UNION ALL
SELECT									'TECH_PRIESTHOOD',						'TECH_PHILOSOPHY'				UNION ALL
SELECT									'TECH_CODE_OF_LAWS',					'TECH_PRIESTHOOD'				UNION ALL

SELECT									'TECH_POETRY',							'TECH_WRITING'					UNION ALL
SELECT									'TECH_HERBAL_SCIENCE',					'TECH_POETRY'					UNION ALL
SELECT									'TECH_APOTHECARY',						'TECH_HERBAL_SCIENCE'			UNION ALL

-- Artisans
SELECT									'TECH_DIVISION_OF_LABOR',				'TECH_CONSTRUCTION'				UNION ALL
SELECT									'TECH_STONE_MASONS',					'TECH_DIVISION_OF_LABOR'		UNION ALL
SELECT									'TECH_WOODWORKING',						'TECH_DIVISION_OF_LABOR'		UNION ALL
SELECT									'TECH_PUBLIC_WORKS',					'TECH_STONE_MASONS'				UNION ALL
SELECT									'TECH_PUBLIC_WORKS',					'TECH_WOODWORKING'				UNION ALL
SELECT									'TECH_IRON_WORKING',					'TECH_DIVISION_OF_LABOR'		UNION ALL
SELECT									'TECH_OPTICS',							'TECH_IRON_WORKING'				UNION ALL

--**Links Between Classical and Medieval**
SELECT									'TECH_AGRICULTURAL_REVOLUTION',			'TECH_WOODWORKING'				UNION ALL
SELECT									'TECH_AGRICULTURAL_REVOLUTION',			'TECH_FARMERS_MARKETS'			UNION ALL
SELECT									'TECH_TRADE_FAIRS',						'TECH_IRON_WORKING'				UNION ALL
SELECT									'TECH_TRADE_FAIRS',						'TECH_CURRENCY'					UNION ALL

SELECT									'TECH_LITERATURE',						'TECH_POETRY'					UNION ALL
SELECT									'TECH_LITERATURE',						'TECH_PRIESTHOOD'				UNION ALL
SELECT									'TECH_DRAMA',							'TECH_PUBLIC_WORKS'				UNION ALL
SELECT									'TECH_DRAMA',							'TECH_HERBAL_SCIENCE'			UNION ALL

SELECT									'TECH_ENGINEERING',						'TECH_PUBLIC_WORKS'				UNION ALL
SELECT									'TECH_ENGINEERING',						'TECH_MATHEMATICS'				UNION ALL
SELECT									'TECH_COMPASS',							'TECH_OPTICS'					UNION ALL
SELECT									'TECH_COMPASS',							'TECH_FISH_MARKETS';

-- Polulate the table, Medieval Techs 
-- Exotic Goods
INSERT INTO Technology_PrereqTechs		(TechType,								PrereqTech)
SELECT									'TECH_LIVESTOCK_DISTRIBUTION',			'TECH_AGRICULTURAL_REVOLUTION'	UNION ALL
SELECT									'TECH_COFFEE_TRADE',					'TECH_AGRICULTURAL_REVOLUTION'	UNION ALL
SELECT									'TECH_COFFEE_TRADE',					'TECH_TRADE_FAIRS'				UNION ALL

SELECT									'TECH_BUREAUCRACY',						'TECH_TRADE_FAIRS'				UNION ALL
SELECT									'TECH_METALLURGY',						'TECH_TRADE_FAIRS'				UNION ALL
SELECT									'TECH_BONDS',							'TECH_BUREAUCRACY'				UNION ALL
SELECT									'TECH_CIVIL_SERVICE',					'TECH_METALLURGY'				UNION ALL

-- Medieval University
SELECT									'TECH_CHIVALRY',						'TECH_LITERATURE'				UNION ALL
SELECT									'TECH_FEUDALISM',						'TECH_CHIVALRY'					UNION ALL
SELECT									'TECH_FUNDAMENTALISM',					'TECH_CHIVALRY'					UNION ALL

SELECT									'TECH_ACOUSTICS',						'TECH_DRAMA'					UNION ALL
SELECT									'TECH_THEOLOGY',						'TECH_DRAMA'					UNION ALL
SELECT									'TECH_ARCHAEOLOGY',						'TECH_THEOLOGY'					UNION ALL

-- Empiricism
SELECT									'TECH_METAL_CASTING',					'TECH_ENGINEERING'				UNION ALL
SELECT									'TECH_MACHINERY',						'TECH_METAL_CASTING'			UNION ALL

SELECT									'TECH_RUDDER',							'TECH_COMPASS'					UNION ALL
SELECT									'TECH_PHYSICS',							'TECH_COMPASS'					UNION ALL
SELECT									'TECH_ALGEBRA',							'TECH_PHYSICS'					UNION ALL
SELECT									'TECH_SIEGE_ENGINES',					'TECH_ALGEBRA'					UNION ALL

--**Links Between Medieval and Renassiance**
SELECT									'TECH_GUILDS',							'TECH_METALLURGY'				UNION ALL
SELECT									'TECH_EDUCATION',						'TECH_CIVIL_SERVICE'			UNION ALL
SELECT									'TECH_EDUCATION',						'TECH_ALGEBRA'					UNION ALL

SELECT									'TECH_ASTRONOMY',						'TECH_RUDDER'					UNION ALL

SELECT									'TECH_STEEL',							'TECH_SIEGE_ENGINES'			UNION ALL
SELECT									'TECH_GUNPOWDER',						'TECH_SIEGE_ENGINES'			UNION ALL
SELECT									'TECH_GUNPOWDER',						'TECH_FEUDALISM';


-- Populate the table, Renassiance Techs 
-- Homo Universalis
INSERT INTO Technology_PrereqTechs		(TechType,								PrereqTech)
SELECT									'TECH_BANKING',							'TECH_GUILDS'					UNION ALL
SELECT									'TECH_CONSTITUTION',					'TECH_GUILDS'					UNION ALL
SELECT									'TECH_NATIONALISM',						'TECH_BANKING'					UNION ALL

SELECT									'TECH_PRINTING_PRESS',					'TECH_EDUCATION'				UNION ALL
SELECT									'TECH_ARCHITECTURE',					'TECH_EDUCATION'				UNION ALL
SELECT									'TECH_SCIENTIFIC_THEORY',				'TECH_PRINTING_PRESS'			UNION ALL

-- Geocentrism
SELECT									'TECH_ENLIGHTENMENT',					'TECH_ASTRONOMY'				UNION ALL
SELECT									'TECH_CALCULUS',						'TECH_ASTRONOMY'				UNION ALL
SELECT									'TECH_EVANGELISM',						'TECH_ENLIGHTENMENT'			UNION ALL
SELECT									'TECH_NAVIGATION',						'TECH_CALCULUS'					UNION ALL
SELECT									'TECH_OCEAN_PIONEERING',				'TECH_NAVIGATION'				UNION ALL
SELECT									'TECH_INTERNATIONAL_TRADE',				'TECH_OCEAN_PIONEERING'			UNION ALL

-- Alchemy
SELECT									'TECH_BLAST_FURNACE',					'TECH_STEEL'					UNION ALL
SELECT									'TECH_MILITARY_TRADITION',				'TECH_BLAST_FURNACE'			UNION ALL

SELECT									'TECH_CHEMISTRY',						'TECH_GUNPOWDER'				UNION ALL
SELECT									'TECH_FERTILIZER',						'TECH_CHEMISTRY'				UNION ALL
SELECT									'TECH_RIFLING',							'TECH_CHEMISTRY'				UNION ALL

--**Links Between Renassiance and Industrial**
SELECT									'TECH_INDUSTRIALIZATION',				'TECH_STEEL'					UNION ALL
SELECT									'TECH_INDUSTRIALIZATION',				'TECH_ARCHITECTURE'				UNION ALL

SELECT									'TECH_BIOLOGY',							'TECH_EDUCATION'				UNION ALL
SELECT									'TECH_BIOLOGY',							'TECH_FERTILIZER'				UNION ALL
SELECT									'TECH_ELECTRICITY',						'TECH_SCIENTIFIC_THEORY'		UNION ALL

SELECT									'TECH_MILITARY_SCIENCE',				'TECH_NATIONALISM';


-- Populate the table, Industrial Techs 
-- INDUSTRIAL REVOLUTION
INSERT INTO Technology_PrereqTechs		(TechType,								PrereqTech)
SELECT									'TECH_STEAM_POWER',						'TECH_INDUSTRIALIZATION'		UNION ALL
SELECT									'TECH_DYNAMITE',						'TECH_STEAM_POWER'				UNION ALL
SELECT									'TECH_NAVAL_ARMOR',						'TECH_STEAM_POWER'				UNION ALL
SELECT									'TECH_RAILROAD',						'TECH_DYNAMITE'					UNION ALL

SELECT									'TECH_REPLACEABLE_PARTS',				'TECH_INDUSTRIALIZATION'		UNION ALL
SELECT									'TECH_COMBUSTION',						'TECH_REPLACEABLE_PARTS'		UNION ALL
SELECT									'TECH_COMBINED_ARMS',					'TECH_COMBUSTION'				UNION ALL
SELECT									'TECH_INDUSTRIAL_PROCESSES',			'TECH_COMBUSTION'				UNION ALL

SELECT									'TECH_REFINING',						'TECH_INDUSTRIALIZATION'		UNION ALL
SELECT									'TECH_PLASTIC',							'TECH_REFINING'					UNION ALL

SELECT									'TECH_ECONOMICS',						'TECH_INDUSTRIALIZATION'		UNION ALL
SELECT									'TECH_CORPORATIONS',					'TECH_ECONOMICS'				UNION ALL
SELECT									'TECH_MARXISM',							'TECH_ECONOMICS'				UNION ALL
SELECT									'TECH_SOCIALISM',						'TECH_ECONOMICS'				UNION ALL

-- Science
SELECT									'TECH_PENICILIN',						'TECH_BIOLOGY'					UNION ALL
SELECT									'TECH_AGRICULTURAL_SCIENCES',			'TECH_BIOLOGY'					UNION ALL
SELECT									'TECH_PHARMACEUTICALS',					'TECH_PENICILIN'				UNION ALL
SELECT									'TECH_ECOLOGY',							'TECH_AGRICULTURAL_SCIENCES'	UNION ALL

SELECT									'TECH_REFRIGERATION',					'TECH_ELECTRICITY'				UNION ALL
SELECT									'TECH_RADIO',							'TECH_ELECTRICITY'				UNION ALL
SELECT									'TECH_RADAR',							'TECH_RADIO'					UNION ALL
SELECT									'TECH_TELECOM',							'TECH_RADIO'					UNION ALL
SELECT									'TECH_TELEPHONE',						'TECH_TELECOM'					UNION ALL

-- Social Classes - Military Research
SELECT									'TECH_BALLISTICS',						'TECH_MILITARY_SCIENCE'			UNION ALL
SELECT									'TECH_SHELLS',							'TECH_BALLISTICS'				UNION ALL
SELECT									'TECH_BIG_GUNS_DOCTRINE',				'TECH_SHELLS'					UNION ALL
SELECT									'TECH_TRACKED_VEHICLES',				'TECH_SHELLS'					UNION ALL
SELECT									'TECH_TORPEDOES',						'TECH_BIG_GUNS_DOCTRINE'		UNION ALL
SELECT									'TECH_BLITZKRIEG',						'TECH_TRACKED_VEHICLES'			UNION ALL
SELECT									'TECH_SUBMERSIBLES',					'TECH_TORPEDOES'				UNION ALL

SELECT									'TECH_FLIGHT',							'TECH_MILITARY_SCIENCE'			UNION ALL

--**Links Between Industrial and Modern**
SELECT									'TECH_ELECTRONICS',						'TECH_PLASTIC'					UNION ALL
SELECT									'TECH_ELECTRONICS',						'TECH_RADIO'					UNION ALL
SELECT									'TECH_GLOBALIZATION',					'TECH_ECOLOGY'					UNION ALL
SELECT									'TECH_GLOBALIZATION',					'TECH_TELECOM'					UNION ALL

SELECT									'TECH_ATOMIC_THEORY',					'TECH_INDUSTRIAL_PROCESSES'		UNION ALL
SELECT									'TECH_ATOMIC_THEORY',					'TECH_ELECTRICITY'				UNION ALL
SELECT									'TECH_STEALTH',							'TECH_RADAR'					UNION ALL
SELECT									'TECH_STEALTH',							'TECH_COMBINED_ARMS'			UNION ALL
SELECT									'TECH_VACCINES',						'TECH_PHARMACEUTICALS'			UNION ALL

SELECT									'TECH_ROCKETRY',						'TECH_BALLISTICS'				UNION ALL
SELECT									'TECH_ROCKETRY',						'TECH_RADAR'					UNION ALL
SELECT									'TECH_MEGA_ENGINEERING',				'TECH_INDUSTRIAL_PROCESSES'		UNION ALL
SELECT									'TECH_MEGA_ENGINEERING',				'TECH_DYNAMITE';

-- Populate the table, Modern Techs 
-- ELECTRICAL PHENOMENA
INSERT INTO Technology_PrereqTechs		(TechType,								PrereqTech)
SELECT									'TECH_COMPUTERS',						'TECH_ELECTRONICS'				UNION ALL
SELECT									'TECH_ROBOTICS',						'TECH_COMPUTERS'				UNION ALL
SELECT									'TECH_LASERS',							'TECH_COMPUTERS'				UNION ALL
SELECT									'TECH_SOLAR_POWER',						'TECH_LASERS'					UNION ALL

SELECT									'TECH_MOBILE_PHONES',					'TECH_GLOBALIZATION'			UNION ALL
SELECT									'TECH_INTERNET',						'TECH_GLOBALIZATION'			UNION ALL
SELECT									'TECH_INTERNET',						'TECH_COMPUTERS'				UNION ALL
SELECT									'TECH_TELEVANGELISM',					'TECH_MOBILE_PHONES'			UNION ALL
SELECT									'TECH_CONSUMERISM',						'TECH_INTERNET'					UNION ALL

-- MOLECULES
SELECT									'TECH_NUCLEAR_FISSION',					'TECH_ATOMIC_THEORY'			UNION ALL
SELECT									'TECH_PARTICLE_PHYSICS',				'TECH_NUCLEAR_FISSION'			UNION ALL
SELECT									'TECH_SUPERCONDUCTORS',					'TECH_NUCLEAR_FISSION'			UNION ALL

SELECT									'TECH_MOBILE_TACTICS',					'TECH_STEALTH'					UNION ALL
SELECT									'TECH_COMPOSITE_ARMOR',					'TECH_MOBILE_TACTICS'			UNION ALL
SELECT									'TECH_COMBINED_ARMS_DOCTRINE',			'TECH_COMPOSITE_ARMOR'			UNION ALL

SELECT									'TECH_GENETICS',						'TECH_VACCINES'					UNION ALL
SELECT									'TECH_BIOTECH_INDUSTRY',				'TECH_GENETICS'					UNION ALL
SELECT									'TECH_CONSERVATIONISM',					'TECH_GENETICS'					UNION ALL
SELECT									'TECH_GENETIC_ENGINEERING',				'TECH_BIOTECH_INDUSTRY'			UNION ALL

-- AERODYNAMICS
SELECT									'TECH_ADVANCED_BALLISTICS',				'TECH_ROCKETRY'					UNION ALL
SELECT									'TECH_SATELLITES',						'TECH_ADVANCED_BALLISTICS'		UNION ALL
SELECT									'TECH_ADVANCED_FLIGHT',					'TECH_ADVANCED_BALLISTICS'		UNION ALL
SELECT									'TECH_CRUISE_MISSILES',					'TECH_ADVANCED_BALLISTICS'		UNION ALL
SELECT									'TECH_MANNED_SPACEFLIGHT',				'TECH_SATELLITES'				UNION ALL
SELECT									'TECH_MANNED_SPACEFLIGHT',				'TECH_EXTREME_SPORTS'			UNION ALL
SELECT									'TECH_UNMANNED_AIRCRAFT',				'TECH_ADVANCED_FLIGHT'			UNION ALL

SELECT									'TECH_EXTREME_SPORTS',					'TECH_MEGA_ENGINEERING'			UNION ALL

--**Links Between Modern and Digital**
SELECT									'TECH_VIRTUALIZATION',					'TECH_INTERNET'					UNION ALL
SELECT									'TECH_VIRTUALIZATION',					'TECH_MOBILE_PHONES'			UNION ALL

SELECT									'TECH_FUNCTIONAL_MRI',					'TECH_BIOTECH_INDUSTRY'			UNION ALL
SELECT									'TECH_FUNCTIONAL_MRI',					'TECH_ROBOTICS'					UNION ALL

SELECT									'TECH_SUPER_BATTERIES',					'TECH_COMPUTERS'				UNION ALL
SELECT									'TECH_SUPER_BATTERIES',					'TECH_PARTICLE_PHYSICS'			UNION ALL
SELECT									'TECH_LASER_MANUFACTURING',				'TECH_SUPERCONDUCTORS'			UNION ALL
SELECT									'TECH_LASER_MANUFACTURING',				'TECH_SOLAR_POWER';

-- Populate the table, Digital Techs 
-- DIGITAL REVOLUTION
INSERT INTO Technology_PrereqTechs		(TechType,								PrereqTech)
SELECT									'TECH_OPTICAL_COMPUTING',				'TECH_VIRTUALIZATION'			UNION ALL
SELECT									'TECH_QUANTUM_COMPUTERS',				'TECH_OPTICAL_COMPUTING'		UNION ALL
SELECT									'TECH_ARTIFICIAL_INTELLIGENCE',			'TECH_QUANTUM_COMPUTERS'		UNION ALL
SELECT									'TECH_SOCIAL_NETWORKS',					'TECH_QUANTUM_COMPUTERS'		UNION ALL

-- HUMAN AUGMENTATION
SELECT									'TECH_ROBOTIC_SURGERY',					'TECH_FUNCTIONAL_MRI'			UNION ALL
SELECT									'TECH_CLONING',							'TECH_FUNCTIONAL_MRI'			UNION ALL
SELECT									'TECH_EXOSKELETONS',					'TECH_ROBOTIC_SURGERY'			UNION ALL
SELECT									'TECH_GENETIC_SYNTHESIS',				'TECH_CLONING'					UNION ALL
SELECT									'TECH_BIOCOMPUTER_INTERFACE',			'TECH_EXOSKELETONS'				UNION ALL
SELECT									'TECH_BIOCOMPUTER_INTERFACE',			'TECH_GENETIC_SYNTHESIS'		UNION ALL

-- ADVANCED ASSEMBLY
SELECT									'TECH_SCRAMJET_ENGINES',				'TECH_SUPER_BATTERIES'			UNION ALL
SELECT									'TECH_HYBRID_SCRAMJETS',				'TECH_SCRAMJET_ENGINES'			UNION ALL
SELECT									'TECH_REACTOR_MINIATURIZATION',			'TECH_SCRAMJET_ENGINES'			UNION ALL
SELECT									'TECH_EXTREME_MECHANIZATION',			'TECH_HYBRID_SCRAMJETS'			UNION ALL
SELECT									'TECH_EXTREME_MECHANIZATION',			'TECH_REACTOR_MINIATURIZATION'	UNION ALL

SELECT									'TECH_DIGITAL_DEFENSE_DOCTRINE',		'TECH_LASER_MANUFACTURING'		UNION ALL
SELECT									'TECH_ADVANCED_MAGNETICS',				'TECH_LASER_MANUFACTURING'		UNION ALL
SELECT									'TECH_METAMATERIALS',					'TECH_ADVANCED_MAGNETICS'		UNION ALL
SELECT									'TECH_MAGNETICS_MINIATURIZATION',		'TECH_METAMATERIALS'			UNION ALL
SELECT									'TECH_ADVANCED_LASERS',					'TECH_MAGNETICS_MINIATURIZATION'	UNION ALL
SELECT									'TECH_UNIFIED_FIELD_THEORY',			'TECH_ADVANCED_LASERS'			UNION ALL

--**Links Between Digital and Information**
SELECT									'TECH_CYBERNETIC_ORGANISMS',			'TECH_DIGITAL_DEFENSE_DOCTRINE'	UNION ALL
SELECT									'TECH_CYBERNETIC_ORGANISMS',			'TECH_EXOSKELETONS'				UNION ALL

SELECT									'TECH_NUCLEAR_FUSION',					'TECH_ADVANCED_LASERS'			UNION ALL
SELECT									'TECH_NUCLEAR_FUSION',					'TECH_OPTICAL_COMPUTING'		UNION ALL

SELECT									'TECH_ARCOLOGIES',						'TECH_GENETIC_SYNTHESIS'		UNION ALL
SELECT									'TECH_SPACE_WEAPONIZATION',				'TECH_EXTREME_MECHANIZATION'	UNION ALL
SELECT									'TECH_ULTRA_PRESSURE_MACHINERY',		'TECH_MAGNETICS_MINIATURIZATION'	UNION ALL
SELECT									'TECH_ULTRA_PRESSURE_MACHINERY',		'TECH_REACTOR_MINIATURIZATION'	UNION ALL
SELECT									'TECH_ULTRA_PRESSURE_MACHINERY',		'TECH_ADVANCED_MAGNETICS'		UNION ALL
SELECT									'TECH_VIRTUAL_REALITY',					'TECH_ARTIFICIAL_INTELLIGENCE'	UNION ALL
SELECT									'TECH_VIRTUAL_REALITY',					'TECH_BIOCOMPUTER_INTERFACE';

-- Populate the table, Information Techs 
-- NEW LIFE
INSERT INTO Technology_PrereqTechs		(TechType,								PrereqTech)
SELECT									'TECH_BIOLOGICAL_NANITES',				'TECH_CYBERNETIC_ORGANISMS'		UNION ALL
SELECT									'TECH_AI_SURVEILLANCE',					'TECH_CYBERNETIC_ORGANISMS'		UNION ALL
SELECT									'TECH_BIOLOGICAL_SYNTHESIS',			'TECH_BIOLOGICAL_NANITES'		UNION ALL
SELECT									'TECH_AI_EVOLUTION',					'TECH_AI_SURVEILLANCE'			UNION ALL
SELECT									'TECH_MECHANICAL_BODY_GRAFTING',		'TECH_BIOLOGICAL_NANITES'		UNION ALL
SELECT									'TECH_NEURAL_REPROGRAMMING',			'TECH_BIOLOGICAL_SYNTHESIS'		UNION ALL
SELECT									'TECH_SENTIENT_ROBOTS',					'TECH_NEURAL_REPROGRAMMING'		UNION ALL
SELECT									'TECH_SENTIENT_ROBOTS',					'TECH_AI_EVOLUTION'				UNION ALL

-- ATOM MANIPULATION
SELECT									'TECH_NANOTECHNOLOGY',					'TECH_NUCLEAR_FUSION'			UNION ALL
SELECT									'TECH_NANO_MASS_PRODUCTION',			'TECH_NANOTECHNOLOGY'			UNION ALL
SELECT									'TECH_EXTREME_ENGINEERING',				'TECH_NANOTECHNOLOGY'			UNION ALL
SELECT									'TECH_UNDERWATER_HABITATION',			'TECH_EXTREME_ENGINEERING'		UNION ALL

SELECT									'TECH_PARTICLE_BEAMS',					'TECH_NUCLEAR_FUSION'			UNION ALL
SELECT									'TECH_FREE_SPACE_SATURATION',			'TECH_PARTICLE_BEAMS'			UNION ALL
SELECT									'TECH_SMART_MATERIALS',					'TECH_FREE_SPACE_SATURATION'	UNION ALL

-- FRINGE SCIENCE
SELECT									'TECH_2D_ENERGY_FIELDS',				'TECH_SPACE_WEAPONIZATION'		UNION ALL
SELECT									'TECH_WARP_FIELD_THEORY',				'TECH_SPACE_WEAPONIZATION'		UNION ALL
SELECT									'TECH_WORMHOLE_DETECTION',				'TECH_WARP_FIELD_THEORY'		UNION ALL

SELECT									'TECH_LEVITATION_MOTORS',				'TECH_ULTRA_PRESSURE_MACHINERY'	UNION ALL

SELECT									'TECH_SUBLIMINAL_MIND_CONTROL',			'TECH_VIRTUAL_REALITY'			UNION ALL
SELECT									'TECH_MIND_MELDING',					'TECH_SUBLIMINAL_MIND_CONTROL'	UNION ALL

SELECT									'TECH_FUTURE_TECH',						'TECH_ARCOLOGIES'				UNION ALL
SELECT									'TECH_FUTURE_TECH',						'TECH_WORMHOLE_DETECTION'		UNION ALL
SELECT									'TECH_FUTURE_TECH',						'TECH_LEVITATION_MOTORS'		UNION ALL
SELECT									'TECH_FUTURE_TECH',						'TECH_MIND_MELDING';






