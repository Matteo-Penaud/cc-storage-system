local Item = require("src.item")

describe("Item class :", function()
    describe("Create a new item", function()
        it("Simple creation", function()
            local item = Item.new("toto", 10, 64)
            assert.are.same("toto", item.name)
            assert.are.same(10, item.count)
            assert.are.same(64, item.maxCount)
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
                    Item.new(case[2], 10, 64)
                end, "Item name must be a non-empty string")
            end)
        end

        -- Test invalid count parameter
        local invalidCounts = {
            {"nil", nil},
            {"not a number", "test"},
            {"0", 0},
            {"negative", -1}
        }

        for _, case in pairs(invalidCounts) do
            it(("Count is %s"):format(case[1]), function()
                assert.has_error(function()
                    Item.new("toto", case[2], 64)
                end, "Count must be a positive not 0 integer")
            end)
        end

        -- Test count vs maxCount parameter
        it("Count is greater than maxCount", function()
            assert.has_error(function()
                Item.new("toto", 2, 1)
            end, "Count must be a lower or equal to maxCount")
        end)

        -- Test maxCount parameter
        local invalidCounts = {
            {"nil", nil},
            {"not a number", "test"},
            {"0", 0},
            {"negative", -1}
        }

        for _, case in pairs(invalidCounts) do
            it(("maxCount is %s"):format(case[1]), function()
                assert.has_error(function()
                    Item.new("toto", 1, case[2])
                end, "maxCount must be a positive integer greater than 0")
            end)
        end
    end)
end)
