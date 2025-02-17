if mods["space-exploration"] and krastorio.general.isVersionGreaterEqualThan(mods["space-exploration"], "0.3.0") then
  -- Remove glass from low desity structure
  krastorio.recipes.removeIngredient("low-density-structure", "glass")
  krastorio.recipes.replaceIngredient("low-density-structure", "steel-plate", { "steel-plate", 2 })

  -- Removing rocket fuel from water recipe, is not necessary with the K2 atmopheric condenser (on every plant is possible craft the rocket fuel)
  data.raw.recipe["se-rocket-fuel-from-water-copper"] = nil
  krastorio.technologies.removeUnlockRecipeFromAllTechnologies("se-rocket-fuel-from-water-copper")
  krastorio.modules.removeProductivityLimitation("se-rocket-fuel-from-water-copper")
  krastorio.recipes.setCategoryIfExist("rocket-fuel", "fuel-refinery")

  -- Restore the satellite production from sending satellite in the space to get K2 space data
  data.raw.item["satellite"].rocket_launch_product = { "space-research-data", 1000 }

  -- Change the core fragments value to rebalance well the gain value
  local function scaleCoreFragmentRecipe(_recipe_name, _item_name, _multiplier)
    local cf_recipe_name = "se-core-fragment-" .. _recipe_name
    local amount = krastorio.recipes.countProduct("se-core-fragment-omni", _item_name)
    local _item_type = krastorio.items.getItemType(_item_name)
    krastorio.recipes.replaceProduct(
      "se-core-fragment-omni",
      _item_name,
      { type = _item_type, name = _item_name, amount = amount * _multiplier }
    )
    krastorio.recipes.replaceProduct(
      cf_recipe_name,
      _item_name,
      { type = _item_type, name = _item_name, amount = amount * _multiplier }
    )
  end

  local core_fragment_to_change = {
    ["imersite"] = { "raw-imersite", 0.2 },
    ["rare-metals"] = { "raw-rare-metals", 0.2 },
    ["mineral-water"] = { "mineral-water", 0.25 },
    ["crude-oil"] = { "crude-oil", 0.5 },
  }

  for item_name, multiplier in pairs(core_fragment_to_change) do
    scaleCoreFragmentRecipe(item_name, multiplier[1], multiplier[2])
  end

  -- Adding new K2 recipe categories to some space machines to make users able to process the K2 intermediates in the space
  krastorio.entities.addCraftingCategory("assembling-machine", "se-space-mechanical-laboratory", "crushing")
  krastorio.entities.addCraftingCategory("assembling-machine", "se-pulveriser", "crushing")
  krastorio.entities.addCraftingCategory("assembling-machine", "se-space-biochemical-laboratory", "electrolysis")
  krastorio.entities.addCraftingCategory("assembling-machine", "se-space-decontamination-facility", "fluid-filtration")

  -- Merge the sand recipes
  if data.raw.recipe["sand-from-stone"] then
    data.raw.recipe["sand-from-stone"] = nil
    data.raw.technology["sand-processing"] = nil
    krastorio.technologies.convertPrerequisiteFromAllTechnologies("sand-processing", "kr-stone-processing")
    krastorio.technologies.removeUnlockRecipeFromAllTechnologies("sand-from-stone")
    krastorio.modules.removeProductivityLimitation("sand-from-stone")
  end
  if data.raw.recipe["se-pulverised-sand"] then
    data.raw.recipe["se-pulverised-sand"] = nil
    data.raw.technology["sand-processing"] = nil
    krastorio.technologies.convertPrerequisiteFromAllTechnologies("sand-processing", "kr-stone-processing")
    krastorio.technologies.removeUnlockRecipeFromAllTechnologies("se-pulverised-sand")
    krastorio.modules.removeProductivityLimitation("se-pulverised-sand")
  end

  -- Merge the glass recipe
  if data.raw.recipe["glass-from-sand"] then
    data.raw.recipe["glass-from-sand"] = nil
    data.raw.technology["glass-processing"] = nil
    krastorio.technologies.convertPrerequisiteFromAllTechnologies("glass-processing", "kr-stone-processing")
    krastorio.technologies.removeUnlockRecipeFromAllTechnologies("glass-from-sand")
    krastorio.modules.removeProductivityLimitation("glass-from-sand")
  end
  -- Boost SE glass recipe
  krastorio.recipes.replaceProduct("se-glass-vulcanite", "glass", { "glass", 16 })

  -- Move lithium sulfur battery
  data.raw["recipe"]["lithium-sulfur-battery"].subgroup = "intermediate-product"

  -- Add additional landfill recipes
  local template = data.raw["recipe"]["landfill-iron-ore"]
  local tech = data.raw["technology"]["se-recycling-facility"]
  for _, resource_name in pairs({ "raw-rare-metals", "raw-imersite" }) do
    local recipe = table.deepcopy(template)
    recipe.name = "landfill-" .. resource_name
    recipe.result = resource_name
    -- FIXME: THIS IS AWFUL. DO NOT RELEASE LIKE THIS. BAD BAD BAD. VERY BAD.
    -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    recipe.icons = {
      { icon = "__base__/graphics/icons/landfill.png", icon_size = 64 },
      {
        icon = data.raw["item"][resource_name].icon,
        icon_size = 64,
        scale = 0.26,
        shift = { 8, -8 },
      },
    }
    recipe.normal.ingredients = { { resource_name, 50 } }
    recipe.expensive.ingredients = { { resource_name, 50 } }
    log(serpent.block(recipe))
    table.insert(tech.effects, { type = "unlock-recipe", recipe = recipe.name })
    data:extend({ recipe })
  end
end
