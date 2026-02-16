local Inventory = require("src.inventory")

describe("Inventory utility :", function()
    describe("Get the first item in the inventory", function()
        it("Shall return nil for an empty inventory", function()
            local inventory = {}
            assert.are.same(nil, Inventory.getFirstItem(inventory))
        end)

        it("Shall return the first valid item for valid inventory", function()
            local inventory = { nil, "toto" }
            assert.are.same("toto", Inventory.getFirstItem(inventory))
        end)
    end)

    describe("Get the first filled slot in the Inventory", function()
        it("Shall return nil for an empty inventory", function()
            local inventory = {}
            assert.are.same(nil, Inventory.getFirstFilledSlot(inventory))
        end)

        it("Shall return the first filled slot id", function()
            local inventory = { nil, "toto" }
            assert.are.same(2, Inventory.getFirstFilledSlot(inventory))
        end)
    end)

    describe("Get the total item type count in inventory", function()
        it("Shall return 0 if no item in the inventory", function()
            local inventory = {}
            assert.are.same(0, Inventory.getTotalItemCount(inventory, itemName))
        end)

        it("Shall return the total count of item type in the inventory", function()
            local itemName = "toto"
            
            local inventory = {
                { name=itemName, count=52 },
                { name=itemName, count=12 }
            }
            assert.are.same(
                64,
                Inventory.getTotalItemCount(inventory, itemName)
            )
        end)
    end)
end)