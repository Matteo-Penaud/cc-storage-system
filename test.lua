local test

local function setTest(value)
    test = value
end

local function getTest()
    return test
end

-- return {setTest = setTest, getTest = getTest}