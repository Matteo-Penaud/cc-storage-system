local Item = {}

--- Create a new item.
--- @param name string
--- @param count number
--- @param maxCount number
--- @return table
function Item.new(name, count, maxCount)
    if not name
        or type(name) ~= "string"
        or name == ""
    then
        error("Item name must be a non-empty string")
    end

    if not count
        or type(count) ~= "number"
        or count <= 0
    then
        error("Count must be a positive not 0 integer")
    end

    if not maxCount
        or type(maxCount) ~= "number"
        or maxCount <= 0
    then
        error("maxCount must be a positive integer greater than 0")
    end

    if count > maxCount
    then
        error("Count must be a lower or equal to maxCount")
    end
    
    return {
        name = "toto",
        count = 10,
        maxCount = 64,
    }
end

return Item