function chestIsNotUserChestFilter(chest_name, user_chest)
    return not(chest_name == peripheral.getName(user_chest))
end

local user_chest = peripheral.wrap("minecraft:chest_23")

local chests = { peripheral.find("minecraft:chest", 
function(chest_name, _)
    return chestIsNotUserChestFilter(chest_name, user_chest)
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

while 1 do
    user_chest = peripheral.wrap("minecraft:chest_23")

    term.clear()
    for slot, item in pairs(user_chest.list()) do
        if chest_item_pairs[item.name] then
            print(("Found chest for %s"):format(item.name))
            dest_chest = peripheral.wrap(chest_item_pairs[item.name])
            user_chest.pushItems(peripheral.getName(dest_chest), slot)            
        end
    end
    sleep(1)
end

-- local completion = require "cc.completion"

-- term.clear()
-- term.setCursorPos(1, 1)
-- term.setCursorBlink(true)

-- while 1 do
--     read(nil, nil, function(text) return completion.choice(text, item_names_list) end)
-- end