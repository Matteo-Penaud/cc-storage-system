local Scanner = require("src.scanner")

describe("Chests scanner", function()
    describe("Get the first item in the chest", function()
        it("Shall return nil for an empty inventory", function()
            local inventory = {}
            assert.are.same(nil, Scanner.getFirstItem(inventory))
        end)

        it("Shall return the first valid item for valid inventory", function()
            local inventory = { nil, "toto" }
            assert.are.same("toto", Scanner.getFirstItem(inventory))
        end)
    end)
end)