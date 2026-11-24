-- Commercial Hubs no longer get adjacency from rivers
INSERT OR IGNORE INTO ExcludedAdjacencies (TraitType , YieldChangeId) VALUES
    ('TRAIT_CIVILIZATION_ADJACENT_DISTRICTS' , 'River_Gold');

-- Samurai come at Feudalism now
-- Implemented by Firaxis
-- 26/02/25 Moved to Mercenaries
UPDATE Units SET PrereqCivic='CIVIC_MERCENARIES', PrereqTech=NULL WHERE UnitType='UNIT_JAPANESE_SAMURAI';

-- 02/07/24 Nerf combat strenght from +5  to +3
UPDATE ModifierArguments SET Value = '3' WHERE ModifierId = 'HOJO_TOKIMUNE_SHALLOW_WATER_COMBAT_BONUS' AND Name = 'Amount';
UPDATE ModifierArguments SET Value = '3' WHERE ModifierId = 'HOJO_TOKIMUNE_COASTAL_COMBAT_BONUS' AND Name = 'Amount';

--26/02/25 Culture from electronic factory is now base bonus of the building
DELETE FROM BuildingModifiers WHERE ModifierId='ELECTRONICSFACTORY_CULTURE';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, YieldChange) VALUES
    ('BUILDING_ELECTRONICS_FACTORY', 'YIELD_CULTURE', 4);

INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, AdjacentDistrict) VALUES
    ('BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_IZ', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_IZ_DESC', 'YIELD_PRODUCTION', -1, 'DISTRICT_NEIGHBORHOOD');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES
    ('DISTRICT_INDUSTRIAL_ZONE', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_IZ');
INSERT INTO ExcludedAdjacencies(TraitType, YieldChangeId)
   SELECT TraitType, 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_IZ' FROM CivilizationTraits WHERE CivilizationType != 'CIVILIZATION_JAPAN' GROUP BY CivilizationType;
INSERT INTO ExcludedAdjacencies(TraitType, YieldChangeId) VALUES
	('TRAIT_LEADER_TOKUGAWA', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_IZ');

INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, AdjacentDistrict) VALUES
    ('BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_CH', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_CH_DESC', 'YIELD_GOLD', -1, 'DISTRICT_NEIGHBORHOOD');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES
    ('DISTRICT_COMMERCIAL_HUB', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_CH');
INSERT INTO ExcludedAdjacencies(TraitType, YieldChangeId)
   SELECT TraitType, 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_CH' FROM CivilizationTraits WHERE CivilizationType != 'CIVILIZATION_JAPAN' GROUP BY CivilizationType;
INSERT INTO ExcludedAdjacencies(TraitType, YieldChangeId) VALUES
	('TRAIT_LEADER_TOKUGAWA', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_CH');

INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, AdjacentDistrict) VALUES
    ('BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_HS', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_HS_DESC', 'YIELD_FAITH', -1, 'DISTRICT_NEIGHBORHOOD');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES
    ('DISTRICT_HOLY_SITE', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_HS');
INSERT INTO ExcludedAdjacencies(TraitType, YieldChangeId)
   SELECT TraitType, 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_HS' FROM CivilizationTraits WHERE CivilizationType != 'CIVILIZATION_JAPAN' GROUP BY CivilizationType;
INSERT INTO ExcludedAdjacencies(TraitType, YieldChangeId) VALUES
	('TRAIT_LEADER_TOKUGAWA', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_HS');

INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, AdjacentDistrict) VALUES
    ('BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_HARBOR', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_HARBOR_DESC', 'YIELD_GOLD', -1, 'DISTRICT_NEIGHBORHOOD');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES
    ('DISTRICT_HARBOR', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_HARBOR');
INSERT INTO ExcludedAdjacencies(TraitType, YieldChangeId)
   SELECT TraitType, 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_HARBOR' FROM CivilizationTraits WHERE CivilizationType != 'CIVILIZATION_JAPAN' GROUP BY CivilizationType;
INSERT INTO ExcludedAdjacencies(TraitType, YieldChangeId) VALUES
	('TRAIT_LEADER_TOKUGAWA', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_HARBOR');

INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, AdjacentDistrict) VALUES
    ('BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_TS', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_TS_DESC', 'YIELD_CULTURE', -1, 'DISTRICT_NEIGHBORHOOD');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES
    ('DISTRICT_THEATER', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_TS');
INSERT INTO ExcludedAdjacencies(TraitType, YieldChangeId)
   SELECT TraitType, 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_TS' FROM CivilizationTraits WHERE CivilizationType != 'CIVILIZATION_JAPAN' GROUP BY CivilizationType;
INSERT INTO ExcludedAdjacencies(TraitType, YieldChangeId) VALUES
	('TRAIT_LEADER_TOKUGAWA', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_TS');

INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, AdjacentDistrict) VALUES
    ('BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_CAMPUS', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_CAMPUS_DESC', 'YIELD_SCIENCE', -1, 'DISTRICT_NEIGHBORHOOD');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES
    ('DISTRICT_CAMPUS', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_TS');
INSERT INTO ExcludedAdjacencies(TraitType, YieldChangeId)
   SELECT TraitType, 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_CAMPUS' FROM CivilizationTraits WHERE CivilizationType != 'CIVILIZATION_JAPAN' GROUP BY CivilizationType;
INSERT INTO ExcludedAdjacencies(TraitType, YieldChangeId) VALUES
	('TRAIT_LEADER_TOKUGAWA', 'BBG_HOJO_NO_NEIGHBOURHOOD_EXTRA_CAMPUS');
