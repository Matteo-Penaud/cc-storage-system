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

function Inventory.getTotalItemCount(inventory)
    return 0
end

return Inventory