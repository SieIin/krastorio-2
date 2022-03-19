local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "assembling-machine",
    name = "kr-singularity-generator",
    fixed_recipe = "kr-singularity",
    icon = "__Krastorio2Assets__/icons/entities/intergalactic-transceiver.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "not-selectable-in-game", "not-rotatable" },
    max_health = 350,
    impact_category = "metal",
    fluid_boxes = {
      {
        production_type = "input",
        -- pipe_picture = assembler2pipepictures(),
        pipe_covers = _ENV.pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = { { type = "input-output", position = { -1.5, -6 } } },
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "input",
        -- pipe_picture = assembler2pipepictures(),
        pipe_covers = _ENV.pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = { { type = "input-output", position = { 1.5, -6 } } },
        secondary_draw_orders = { north = -1 },
      },
    },
    collision_box = { { -6, -5.4 }, { 6, 5.4 } },
    -- TODO: Idle animation
    animation = {
      layers = {
        {
          filename = kr_entities_path .. "intergalactic-transceiver/intergalactic-transceiver.png",
          width = 400,
          height = 400,
          frame_count = 1,
          repeat_count = 60,
          shift = { 0, -0.8 },
          animation_speed = 0.7,
          hr_version = {
            filename = kr_entities_path .. "intergalactic-transceiver/hr-intergalactic-transceiver.png",
            width = 800,
            height = 800,
            scale = 0.5,
            frame_count = 1,
            repeat_count = 60,
            animation_speed = 0.7,
            shift = { 0, -0.8 },
          },
        },
        {
          filename = kr_entities_path .. "intergalactic-transceiver/intergalactic-transceiver-sh.png",
          priority = "low",
          width = 434,
          height = 313,
          frame_count = 1,
          repeat_count = 60,
          draw_as_shadow = true,
          animation_speed = 0.7,
          shift = { 0.52, 0.5 },
          hr_version = {
            filename = kr_entities_path .. "intergalactic-transceiver/hr-intergalactic-transceiver-sh.png",
            priority = "low",
            width = 867,
            height = 626,
            scale = 0.5,
            frame_count = 1,
            repeat_count = 60,
            draw_as_shadow = true,
            animation_speed = 0.7,
            shift = { 0.52, 0.5 },
          },
        },
        {
          filename = kr_entities_path .. "intergalactic-transceiver/intergalactic-transceiver-charging.png",
          priority = "high",
          width = 400,
          height = 400,
          frame_count = 60,
          line_length = 10,
          animation_speed = 0.7,
          shift = { 0, -0.8 },
          draw_as_glow = true,
          hr_version = {
            filename = kr_entities_path .. "intergalactic-transceiver/hr-intergalactic-transceiver-charging.png",
            priority = "high",
            width = 800,
            height = 800,
            scale = 0.5,
            frame_count = 60,
            line_length = 10,
            animation_speed = 0.7,
            shift = { 0, -0.8 },
            draw_as_glow = true,
          },
        },
        {
          filename = kr_entities_path .. "intergalactic-transceiver/intergalactic-transceiver-light.png",
          priority = "high",
          width = 400,
          height = 400,
          frame_count = 1,
          repeat_count = 60,
          shift = { 0, -0.8 },
          draw_as_light = true,
          animation_speed = 0.7,
          hr_version = {
            filename = kr_entities_path .. "intergalactic-transceiver/hr-intergalactic-transceiver-light.png",
            priority = "high",
            width = 800,
            height = 800,
            scale = 0.5,
            frame_count = 1,
            repeat_count = 60,
            animation_speed = 0.7,
            shift = { 0, -0.8 },
            draw_as_light = true,
          },
        },
        {
          filename = kr_entities_path .. "intergalactic-transceiver/intergalactic-transceiver-charging-light.png",
          priority = "high",
          width = 400,
          height = 400,
          frame_count = 60,
          line_length = 10,
          animation_speed = 0.7,
          shift = { 0, -0.8 },
          draw_as_light = true,
          hr_version = {
            filename = kr_entities_path .. "intergalactic-transceiver/hr-intergalactic-transceiver-charging-light.png",
            priority = "high",
            width = 800,
            height = 800,
            scale = 0.5,
            frame_count = 60,
            line_length = 10,
            animation_speed = 0.7,
            shift = { 0, -0.8 },
            draw_as_light = true,
          },
        },
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = {
      filename = kr_buildings_sounds_path .. "intergalactic-transceiver-charge.ogg",
      volume = 1.2,
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },

    crafting_categories = { "kr-singularity" },
    crafting_speed = 1,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 3,
    },
    energy_usage = "29GW",
    module_specification = {
      module_slots = 0,
    },
    allowed_effects = {},

    show_recipe_icon = false,
  },
  {
    type = "assembling-machine",
    name = "kr-singularity-assembler",
    localised_name = { "entity-name.kr-singularity-generator" },
    icon = "__Krastorio2Assets__/icons/entities/intergalactic-transceiver.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "not-rotatable", "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.2, result = "kr-singularity-generator" },
    placeable_by = { item = "kr-singularity-generator", count = 1 },
    max_health = 350,
    impact_category = "metal",
    -- alert_icon_shift = util.by_pixel(-3, -12),
    resistances = {
      {
        type = "fire",
        percent = 70,
      },
    },
    collision_mask = {},
    collision_box = { { -6, -5.4 }, { 6, 5.4 } },
    selection_box = { { -6, -5.5 }, { 6, 5.5 } },
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,

    crafting_categories = { "kr-singularity" },
    crafting_speed = 5,
    energy_source = { type = "void" },
    energy_usage = "1W",
    module_specification = { module_slots = 4 },
    allowed_effects = { "consumption", "speed", "productivity", "pollution" },
  },
  -- FIXME: Move these to other files
  {
    type = "item",
    name = "kr-singularity-generator",
    icon = "__Krastorio2Assets__/icons/entities/intergalactic-transceiver.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "not-stackable" },
    stack_size = 1,
    place_result = "kr-singularity-generator",
  },
  {
    type = "recipe",
    name = "kr-singularity-generator",
    energy_required = 600,
    ingredients = {
      { "imersium-beam", 500 },
      { "imersium-plate", 500 },
      { "rare-metals", 1000 },
      { "energy-control-unit", 500 },
      { "ai-core", 300 },
      { "concrete", 750 },
    },
    result = "kr-singularity-generator",
  },
  {
    type = "recipe",
    name = "kr-singularity",
    icon = "__Krastorio2Assets__/icons/entities/intergalactic-transceiver.png",
    icon_size = 64,
    icon_mipmaps = 4,
    hidden = true,
    category = "kr-singularity",
    ingredients = { { type = "fluid", name = "matter", amount = 100 } },
    results = { { "kr-void", 0 } },
  },
})
