local function getFirstItemInInventory(inventory_content)
    for _, item in pairs(inventory_content) do
        return item
    end
end

local function addEmptyInventory(inventory)
end

return { getFirstItemInInventory = getFirstItemInInventory }