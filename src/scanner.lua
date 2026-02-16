local Scanner = {}

function Scanner.getFirstItem(inventory)
    for _, item in pairs(inventory) do
        return item
    end

    return nil
end

return Scanner