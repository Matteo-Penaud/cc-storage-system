local Inventory = {}

function Inventory.getFirstItem(inventory)
    if inventory then
        for _, item in pairs(inventory) do
            return item
        end
    end

    return nil
end

function Inventory.getFirstFilledSlot(inventory)
    if inventory then
        for id, _ in pairs(inventory) do
            return id
        end
    end

    return nil
end

function Inventory.getItemCount(inventory, itemName)
    local totalCount = 0
    if inventory then
        for _, item in pairs(inventory) do
            if item.name == itemName then
                totalCount = totalCount + item.count
            end
        end
    end

    return totalCount
end

function Inventory.getTotalItemCount(inventory)
    local totalCount = 0

    if inventory then
        for _, item in pairs(inventory) do
            if item.count ~= nil then
                totalCount = totalCount + item.count
            end
        end
    end
    
    return totalCount
end

return Inventory