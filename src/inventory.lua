local Inventory = {}

function Inventory.getFirstItem(inventory)
    for _, item in pairs(inventory) do
        return item
    end

    return nil
end

function Inventory.getFirstFilledSlot(inventory)
    for id, _ in pairs(inventory) do
        return id
    end

    return nil
end

function Inventory.getItemCount(inventory, itemName)
    local totalCount = 0

    for _, item in pairs(inventory) do
        if item.name == itemName then
            totalCount = totalCount + item.count
        end
    end

    return totalCount
end

return Inventory