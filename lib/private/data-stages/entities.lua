krastorio.entities = {}

-- -- -- TO DO

-- -- -- GETTING(READ) FUNCTIONS

--@ category_name
--@ entity_name
function krastorio.entities.getEntity(category_name, entity_name)
	local no_err, entity = pcall(function() return data.raw[category_name][entity_name] end)
	if no_err and entity ~= nil and next(entity) ~= nil then
		return entity
	end
	return nil 
end

--@ category_name
--@ entity_name
function krastorio.entities.exist(category_name, entity_name)
	local entity = krastorio.entities.getEntity(category_name, entity_name)
	return entity and type(entity) == "table"
end

-- -- -- SETTING(WRITE) FUNCTIONS

--@ category_name
--@ entity_name
--@ to_remove_mask_name
function krastorio.entities.removeCollisionMaskOnEntity(category_name, entity_name, to_remove_mask_name)
	local entity = krastorio.entities.getEntity(category_name, entity_name)
	if entity then
		local no_err, collision_mask = pcall(function() return entity.collision_mask end)
		if no_err and collision_mask ~= nil then
			for i, mask_name in pairs(collision_mask) do
				if mask_name == to_remove_mask_name then
					table.remove(collision_mask, i)
					return true
				end
			end
		end
	end
	return false
end

--@ category_name
--@ entity_name
--@ to_add_mask_name
function krastorio.entities.addCollisionMaskOnEntity(category_name, entity_name, to_add_mask_name)
	local entity = krastorio.entities.getEntity(category_name, entity_name)
	if entity then
		local no_err, collision_mask = pcall(function() return entity.collision_mask end)
		if no_err and collision_mask ~= nil then
			table.insert(collision_mask, to_add_mask_name)
		else
			data.raw[category_name][entity_name].collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile", to_add_mask_name}
		end
		return true
	end
	return false
end

--@ category_name
--@ entity_name
--@ to_add_crafting_category
function krastorio.entities.addCraftingCategory(category_name, entity_name, to_add_crafting_category)
	local entity = krastorio.entities.getEntity(category_name, entity_name)
	if entity and (entity.type == "assembling-machine" or entity.type == "furnace" or entity.type == "rocket-silo") and data.raw["recipe-category"][to_add_crafting_category] then
		if entity.crafting_categories then
			table.insert(entity.crafting_categories, to_add_crafting_category)
		else
			entity.crafting_categories = { to_add_crafting_category }
		end
		return true
	end
	return false
end

--@ category_name
--@ entity_name
--@ to_remove_crafting_category
function krastorio.entities.removeCraftingCategory(category_name, entity_name, to_remove_crafting_category)
	local entity = krastorio.entities.getEntity(category_name, entity_name)
	if entity and (entity.type == "assembling-machine" or entity.type == "furnace" or entity.type == "rocket-silo") and entity.crafting_categories then
		for i, crafting_category in pairs(entity.crafting_categories) do
			if crafting_category == to_remove_crafting_category then
				table.remove(entity.crafting_categories, i)
				return true
			end
		end
	end
	return false
end

-- This should be used in control,
-- check if the entities is valid for be used.
-- @entity, entity
function krastorio.entities.isValid(entity)
	return entity and entity.valid ~= nil
end

-- This should be used in control,
-- check if entity has fluidbox,
-- check that if entity is not null too
-- @entity, entity to check fluidbox
function krastorio.entities.entityHasFluidbox(entity)
	if entity and type(entity) == "table" then
		local fluidbox = entity.fluidbox
		return fluidbox and #fluidbox > 0
	end
end
