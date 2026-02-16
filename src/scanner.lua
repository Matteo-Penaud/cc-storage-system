local Scanner = {}

function Scanner.getFirstItem(inventory)
    for _, item in pairs(inventory) do
        return item
    end

    return nil
end

function Scanner.getFirstFilledSlot(inventory)
    for id, _ in pairs(inventory) do
        return id
    end

    return nil
end

return Scanner