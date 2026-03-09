local Inventory = require("src.inventory")
local Item = require("src.item")

describe("Inventory utility :", function()
    describe("Create an inventory representation", function()
        it("Simple creation", function()
            local inventory = Inventory.new("inventory_1", 1)
            
            assert.are.same("inventory_1", inventory.name)
            assert.are.same(1, inventory.size)
        end)

        -- Test name parameter
        local invalidNames = {
            {"nil", nil},
            {"empty string", ""},
            {"not a string", 1}
        }

        for _, case in pairs(invalidNames) do
            it(("Name is %s"):format(case[1]), function()
                assert.has_error(function()
                    Inventory.new(case[2], 1)
                end, "Inventory name must be a non-empty string")
            end)
        end

        -- Test invalid size parameter
        local invalidSize = {
            {"nil", nil},
            {"not a number", "test"},
            {"0", 0},
            {"negative", -1}
        }

        for _, case in pairs(invalidSize) do
            it(("Size is %s"):format(case[1]), function()
                assert.has_error(function()
                    Inventory.new("toto", case[2])
                end, "Size must be a positive not 0 integer")
            end)
        end
    end)

    describe("Add items to the inventory", function()
        it("Add a simple item", function()
            local inventory = Inventory.new("inventory_1", 1)
            local item = Item.new("toto", 10, 64)

            inventory:addItem(item, 1)
            assert.are.same(item, inventory.items[1])
        end)

        it("Simple item at slot 2 but inventory size = 1", function()
            local inventory = Inventory.new("inventory_1", 1)
            local item = Item.new("toto", 10, 64)
        
            assert.has_error(function()
                inventory:addItem(item, 2)
            end, "Inventory is not big enough")
        end)

        local invalidSlot = {
            {"nil", nil},
            {"not a number", "test"},
            {"0", 0},
            {"negative", -1}
        }

        for _, case in pairs(invalidSlot) do
            it(("Size is %s"):format(case[1]), function()
                local inventory = Inventory.new("inventory_1", 1)
                local item = Item.new("toto", 10, 64)

                assert.has_error(function()
                    inventory:addItem(item, case[2])
                end, "Slot must be a positive not 0 integer")
            end)
        end

        it("Multiple items", function()
            local inventory = Inventory.new("inventory_1", 3)
            local items = {
                Item.new("toto", 10, 64),
                Item.new("tata", 1, 2),
                Item.new("titi", 1, 2)
            }

            for slot, item in pairs(items) do
                inventory:addItem(item, slot)
            end

            for slot, item in pairs(items) do
                assert.are.same(item, inventory.items[slot])
            end
        end)
    end)
end)