local function getFirstItemInInventory(inventory)
    for _, item in pairs(inventory) do
        return item
    end
end

return { getFirstItemInInventory = getFirstItemInInventory }