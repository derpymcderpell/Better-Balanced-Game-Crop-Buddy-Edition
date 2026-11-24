--UPDATE ModifierArguments SET Value='0' WHERE ModifierId='TRAIT_INFORMATION_RANGED_UNIT_PRODUCTION' and Name='Amount';
--UPDATE ModifierArguments SET Value='25' WHERE ModifierId='TRAIT_RANGED_EXPERIENCE_MODIFIER' and Name='Amount';

INSERT OR IGNORE INTO ExcludedAdjacencies (TraitType , YieldChangeId) VALUES
    ('TRAIT_CIVILIZATION_TA_SETI' , 'River_Gold'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Harbor_Gold'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'District_Gold'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Mountains_Science1'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Mountains_Science2'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Mountains_Science3'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Mountains_Science4'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Mountains_Science5'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Geothermal_Science'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Jungle_Science'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'District_Science'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'SeaResource_Gold'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Harbor_City_Gold'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Wonder_Culture'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'District_Culture'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'NaturalWonder_Faith'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Mountain_Faith1'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Mountain_Faith2'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Mountain_Faith3'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Mountain_Faith4'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Mountain_Faith5'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'Forest_Faith'),
    ('TRAIT_CIVILIZATION_TA_SETI' , 'District_Faith');


-- 15/06/23 Nubia also gets xp bonus for naval ranged units
INSERT INTO TypeTags (Type, Tag) VALUES
    ('ABILITY_NUBIA_RANGED_EXPERIENCE_MODIFIER', 'CLASS_NAVAL_RANGED');
@@ -117,7 +143,7 @@ INSERT INTO ImprovementModifiers (ImprovementType, ModifierID) VALUES
    ('IMPROVEMENT_PYRAMID', 'TRAIT_PYRAMID_DISTRICT_PRODUCTION_MODIFIER');

-- Pyramid can be placed on any flat tiles, limited to one per city and non adjacent to another pyramid
UPDATE Improvements SET OnePerCity=0, SameAdjacentValid=0 WHERE ImprovementType='IMPROVEMENT_PYRAMID';

-- 01/12/24 removed
-- Base Nubian Pyramid is +2 food/2 faith
@@ -135,27 +161,31 @@ UPDATE Improvements SET OnePerCity=1, SameAdjacentValid=0 WHERE ImprovementType=

-- Nubian district gets standard adjacency from nubian pyramid
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentImprovement) VALUES
    ('BBG_PYRAMID_DISTRICT_SCIENCE', 'LOC_BBG_PYRAMID_DISTRICT_SCIENCE_DESC', 'YIELD_SCIENCE', 3, 1, 'IMPROVEMENT_PYRAMID'),
    ('BBG_PYRAMID_DISTRICT_PRODUCTION', 'LOC_BBG_PYRAMID_DISTRICT_PRODUCTION_DESC', 'YIELD_PRODUCTION', 2, 1, 'IMPROVEMENT_PYRAMID'),
    ('BBG_PYRAMID_DISTRICT_CULTURE', 'LOC_BBG_PYRAMID_DISTRICT_CULTURE_DESC', 'YIELD_CULTURE', 3, 1, 'IMPROVEMENT_PYRAMID'),
    ('BBG_PYRAMID_DISTRICT_FAITH', 'LOC_BBG_PYRAMID_DISTRICT_FAITH_DESC', 'YIELD_FAITH', 2, 1, 'IMPROVEMENT_PYRAMID'),
    ('BBG_PYRAMID_DISTRICT_GOLD', 'LOC_BBG_PYRAMID_DISTRICT_GOLD_DESC', 'YIELD_GOLD', 4, 1, 'IMPROVEMENT_PYRAMID');
--INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES
    --('DISTRICT_CAMPUS', 'BBG_PYRAMID_DISTRICT_SCIENCE'),
    --('DISTRICT_INDUSTRIAL_ZONE', 'BBG_PYRAMID_DISTRICT_PRODUCTION'),
    --('DISTRICT_THEATER', 'BBG_PYRAMID_DISTRICT_CULTURE'),
    --('DISTRICT_HOLY_SITE', 'BBG_PYRAMID_DISTRICT_FAITH'),
    --('DISTRICT_COMMERCIAL_HUB', 'BBG_PYRAMID_DISTRICT_GOLD'),
    --('DISTRICT_HARBOR', 'BBG_PYRAMID_DISTRICT_GOLD');

-- Encampment and Aerodrome give +1 production to Pyramid, and Gov Plaza give +1 culture/2 gold
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES
    ('BBG_PYRAMID_GOV_CULTURE', 'Placeholder', 'YIELD_CULTURE', 2, 1, 'DISTRICT_GOVERNMENT'),
    ('BBG_PYRAMID_GOV_GOLD', 'Placeholder', 'YIELD_GOLD', 3, 1, 'DISTRICT_GOVERNMENT'),
    ('BBG_PYRAMID_GOV_SCIENCE', 'Placeholder', 'YIELD_SCIENCE', 1, 1, 'DISTRICT_GOVERNMENT'),
    ('BBG_PYRAMID_AQUEDUCT_FOOD', 'Placeholder', 'YIELD_FOOD', 1, 1, 'DISTRICT_AQUEDUCT'),
    ('BBG_PYRAMID_ENCAMPMENT_PROD', 'Placeholder', 'YIELD_PRODUCTION', 2, 1, 'DISTRICT_ENCAMPMENT'),
    ('BBG_PYRAMID_AERODROME_PROD', 'Placeholder', 'YIELD_PRODUCTION', 2, 1, 'DISTRICT_AERODROME');
INSERT INTO Improvement_Adjacencies (ImprovementType, YieldChangeId) VALUES
    ('IMPROVEMENT_PYRAMID', 'BBG_PYRAMID_GOV_CULTURE'),
    ('IMPROVEMENT_PYRAMID', 'BBG_PYRAMID_GOV_GOLD'),
    ('IMPROVEMENT_PYRAMID', 'BBG_PYRAMID_GOV_SCIENCE'),
    ('IMPROVEMENT_PYRAMID', 'BBG_PYRAMID_AQUEDUCT_FOOD'),
    ('IMPROVEMENT_PYRAMID', 'BBG_PYRAMID_ENCAMPMENT_PROD'),
    ('IMPROVEMENT_PYRAMID', 'BBG_PYRAMID_AERODROME_PROD');
