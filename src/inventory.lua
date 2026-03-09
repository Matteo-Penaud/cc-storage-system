local Item = require("src.item")

local Inventory = {}

Inventory.__index = Inventory

--- Create a new inventory.
--- @param name string
--- @param size number
--- @return table
function Inventory.new(name, size)
    if not name
        or type(name) ~= "string"
        or name == ""
    then
        error("Inventory name must be a non-empty string")
    end

    if not size
        or type(size) ~= "number"
        or size <= 0
    then
        error("Size must be a positive not 0 integer")
    end

    local self = setmetatable({}, Inventory)

    self.name = name
    self.size = size

    self.items = {}
    
    return self
end

--- Create a new inventory.
--- @param item table
--- @param slot number
--- @return nil
function Inventory:addItem(item, slot)
    if not slot
        or type(slot) ~= "number"
        or slot <= 0
    then
        error("Slot must be a positive not 0 integer")
    end

    if slot <= self.size then
        table.insert(self.items, slot, item)
    else
        error("Inventory is not big enough")
    end
end

return Inventory