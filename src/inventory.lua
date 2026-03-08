local Inventory = {}

Inventory.__index = Inventory

--- Create a new inventory.
--- @param name string
--- @return table
function Inventory.new(name)
    local self = setmetatable({}, Inventory)

    if not name
        or type(name) ~= "string"
        or name == ""
    then
        error("Inventory name must be a non-empty string")
    end

    self.name = name
    
    return self
end

return Inventory