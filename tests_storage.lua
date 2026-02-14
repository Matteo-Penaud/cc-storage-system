local storage = require("storage")

function test_getFirstItemInInventory_call()
    assert(storage.getFirstItemInInventory ~= nil)
end

function test_getFirstItemInInventory_emptyInventory()
    local inventory = {}

    assert(storage.getFirstItemInInventory(inventory) == nil)
end

function test_getFirstItemInInventory_multipleItems()
    local inventory = {
        { name = "tata" },
        { name = "toto" }
    }

    assert(storage.getFirstItemInInventory(inventory) == inventory[1])
end

function test_getFirstItemInInventory_nilIsFirstItem()
    local inventory = {
        nil,
        { name = "titi" }
    }

    assert(storage.getFirstItemInInventory(inventory) == inventory[2])
end

test_getFirstItemInInventory_call()
test_getFirstItemInInventory_emptyInventory()
test_getFirstItemInInventory_multipleItems()
test_getFirstItemInInventory_nilIsFirstItem()