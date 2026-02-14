local utils = require("utils")
local completion = require "cc.completion"

local input_storage_name = utils.getOrDefineSettings("input_storage")
local input_storage = peripheral.wrap(input_storage_name)

local output_storage_name = utils.getOrDefineSettings("output_storage")
local output_storage = peripheral.wrap(output_storage_name)

function chestIsNotUserChestFilter(chest_name, name)
    return not(chest_name == name)
end

local chests = { peripheral.find("minecraft:chest", 
function(chest_name, _)
    return chestIsNotUserChestFilter(chest_name, input_storage_name) and chestIsNotUserChestFilter(chest_name, output_storage_name)
end) }

local chest_item_pairs = {}
local item_names_list = {}
local empty_chests = {}

for _, chest in pairs(chests) do
    local chest_name = peripheral.getName(chest)

    first_item = chest.list()[1]
    if first_item then
        table.insert(item_names_list, first_item["name"])
        chest_item_pairs[first_item["name"]] = chest_name
        print(chest_name, first_item["name"])
    else
        table.insert(empty_chests, chest_name)
    end
end

for item, chest_name in pairs(chest_item_pairs) do
    print(item, chest_name)
end

term.clear()
term.setCursorPos(1, 1)

function storeFromInput()
    input_storage = peripheral.wrap(input_storage_name)

    for slot, item in pairs(input_storage.list()) do
        if chest_item_pairs[item.name] then
            print(("Found chest for %s"):format(item.name))
            dest_chest = peripheral.wrap(chest_item_pairs[item.name])
            input_storage.pushItems(peripheral.getName(dest_chest), slot)
        end
    end
end

function getFromStorage()
    local event = os.pullEvent()

    if event == "key" then
        local item_to_find = read(nil, nil, function(text) return completion.choice(text, item_names_list) end)

        if string.len(item_to_find) > 0 then
            local origin_chest = peripheral.wrap(chest_item_pairs[item_to_find])
            local dest_chest = peripheral.wrap(output_storage_name)
            origin_chest.pushItems(peripheral.getName(dest_chest), 1)
        end
    else
        sleep(0.1)
    end
end


term.clear()
term.setCursorPos(1, 1)
term.setCursorBlink(true)

while 1 do
    parallel.waitForAll(storeFromInput, getFromStorage)
end