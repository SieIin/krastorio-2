if mods["bobpower"] then
    --fit bob power stuff to k2 balance

    ---- Nuclear

    -- Reactor 2
    data.raw["reactor"]["nuclear-reactor-2"].minable = { hardness = 1, mining_time = 1, result = "nuclear-reactor-2" }
    data.raw["reactor"]["nuclear-reactor-2"].max_health = 1250
    data.raw["reactor"]["nuclear-reactor-2"].consumption = "300MW"
    data.raw["reactor"]["nuclear-reactor-2"].energy_source.effectivity = 1
    data.raw["reactor"]["nuclear-reactor-2"].heat_buffer.specific_heat = "60MJ"
    data.raw["reactor"]["nuclear-reactor-2"].heat_buffer.max_transfer = "60GW"
    data.raw["reactor"]["nuclear-reactor-2"].neighbour_bonus = 0.25
    data.raw.item["nuclear-reactor-2"].stack_size = 1

    -- Reactor 3
    data.raw["reactor"]["nuclear-reactor-3"].minable = { hardness = 1, mining_time = 1, result = "nuclear-reactor-3" }
    data.raw["reactor"]["nuclear-reactor-3"].max_health = 1500
    data.raw["reactor"]["nuclear-reactor-3"].consumption = "350MW"
    data.raw["reactor"]["nuclear-reactor-3"].energy_source.effectivity = 1
    data.raw["reactor"]["nuclear-reactor-3"].heat_buffer.specific_heat = "70MJ"
    data.raw["reactor"]["nuclear-reactor-3"].heat_buffer.max_transfer = "70GW"
    data.raw["reactor"]["nuclear-reactor-3"].neighbour_bonus = 0.25
    data.raw.item["nuclear-reactor-3"].stack_size = 1

    ---- Heat sources


    -- Heat exchanger 2
    data.raw["boiler"]["heat-exchanger-2"].target_temperature = 495
    data.raw["boiler"]["heat-exchanger-2"].energy_consumption = "60MW"
    data.raw["boiler"]["heat-exchanger-2"].energy_source.specific_heat = "10MJ"
    data.raw["boiler"]["heat-exchanger-2"].energy_source.max_transfer = "10GW"
    data.raw["boiler"]["heat-exchanger-2"].energy_source.min_working_temperature = 495

    -- Heat exchanger 3
    data.raw["boiler"]["heat-exchanger-3"].target_temperature = 575
    data.raw["boiler"]["heat-exchanger-3"].energy_consumption = "70MW"
    data.raw["boiler"]["heat-exchanger-3"].energy_source.specific_heat = "10MJ"
    data.raw["boiler"]["heat-exchanger-3"].energy_source.max_transfer = "10GW"
    data.raw["boiler"]["heat-exchanger-3"].energy_source.min_working_temperature = 575

    -- Steam turbine 2 
    data.raw["generator"]["steam-turbine-2"].max_health = 600
    data.raw["generator"]["steam-turbine-2"].maximum_temperature = 495
    data.raw["generator"]["steam-turbine-2"].effectivity = 1
    data.raw["generator"]["steam-turbine-2"].fluid_usage_per_tick = 5 / 6
    data.raw["generator"]["steam-turbine-2"].fluid_box.minimum_temperature = 100
    data.raw["generator"]["steam-turbine-2"].max_power_output = "12MW"
    
    -- Steam turbine 3
    data.raw["generator"]["steam-turbine-3"].max_health = 900
    data.raw["generator"]["steam-turbine-3"].maximum_temperature = 575
    data.raw["generator"]["steam-turbine-3"].effectivity = 1
    data.raw["generator"]["steam-turbine-3"].fluid_usage_per_tick = 5 / 6
    data.raw["generator"]["steam-turbine-3"].fluid_box.minimum_temperature = 100
    data.raw["generator"]["steam-turbine-3"].max_power_output = "14MW"

    ---- Boilers

    -- Boiler 2
    data.raw["boiler"]["boiler-2"].energy_consumption = "3MW"
    data.raw["boiler"]["boiler-2"].target_temperature = 315
    data.raw["boiler"]["boiler-2"].energy_source.emissions_per_minute = 16

    -- Boiler 3
    data.raw["boiler"]["boiler-3"].energy_consumption = "4.5MW"
    data.raw["boiler"]["boiler-3"].target_temperature = 465
    data.raw["boiler"]["boiler-3"].energy_source.emissions_per_minute = 13

    -- Boiler 4
    data.raw["boiler"]["boiler-4"].energy_consumption = "6MW"
    data.raw["boiler"]["boiler-4"].target_temperature = 615
    data.raw["boiler"]["boiler-4"].energy_source.emissions_per_minute = 10

    -- Boiler 5
    data.raw["boiler"]["boiler-5"].energy_consumption = "7.5MW"
    data.raw["boiler"]["boiler-5"].target_temperature = 765
    data.raw["boiler"]["boiler-5"].energy_source.emissions_per_minute = 8

    ---- Steam engine
    
    -- Steam engine 2
    data.raw["generator"]["steam-engine-2"].effectivity = 1
    data.raw["generator"]["steam-engine-2"].fluid_usage_per_tick = 1 / 6
    data.raw["generator"]["steam-engine-2"].maximum_temperature = 315
    data.raw["generator"]["steam-engine-2"].max_power_output = "1.5MW"

    ----Steam engine 3
    data.raw["generator"]["steam-engine-3"].effectivity = 1
    data.raw["generator"]["steam-engine-3"].fluid_usage_per_tick = 1 / 6
    data.raw["generator"]["steam-engine-3"].maximum_temperature = 465
    data.raw["generator"]["steam-engine-3"].max_power_output = "2.25MW"

    ----Steam engine 4
    data.raw["generator"]["steam-engine-4"].effectivity = 1
    data.raw["generator"]["steam-engine-4"].fluid_usage_per_tick = 1 / 6
    data.raw["generator"]["steam-engine-4"].maximum_temperature = 615
    data.raw["generator"]["steam-engine-4"].max_power_output = "3MW"
    
    ----Steam engine 5
    data.raw["generator"]["steam-engine-5"].effectivity = 1
    data.raw["generator"]["steam-engine-5"].fluid_usage_per_tick = 1 / 6
    data.raw["generator"]["steam-engine-5"].maximum_temperature = 765
    data.raw["generator"]["steam-engine-5"].max_power_output = "3.75MW"

    ---- Solar panels

    -- Small panels
    data.raw["solar-panel"]["solar-panel-small"].production = "30kW"
    data.raw["solar-panel"]["solar-panel-small-2"].production = "60kW"
    data.raw["solar-panel"]["solar-panel-small-3"].production = "90kW"
    
    -- Medium panels
    data.raw["solar-panel"]["solar-panel-2"].production = "150kW"
    data.raw["solar-panel"]["solar-panel-3"].production = "225kW"

    -- Large panels
    data.raw["solar-panel"]["solar-panel-large"].production = "170kW"
    data.raw["solar-panel"]["solar-panel-large"].production = "250kW"
    data.raw["solar-panel"]["solar-panel-large"].production = "330kW"
    data.raw["solar-panel"]["kr-advanced-solar-panel"].production = "400kW"
    
end