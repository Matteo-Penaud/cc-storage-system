local Inventory = require("src.inventory")

describe("Inventory utility :", function()
    describe("Create an inventory representation", function()
        it("Simple creation", function()
            local inventory = Inventory.new("inventory_1")
            
            assert.are.same("inventory_1", inventory.name)
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
                    Inventory.new(case[2])
                end, "Inventory name must be a non-empty string")
            end)
        end
    end)
end)