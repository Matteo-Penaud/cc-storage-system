-- Define a settings if not defined
local function getOrDefineSettings(settings_name)
    local setting_value = settings.get(settings_name)
    if not setting_value then
        print(("Define %s : "):format(settings_name))
        setting_value = read()

        settings.set(settings_name, setting_value)
    else
        print(("Input chest is %s"):format(setting_value))
    end

    settings.save()

    return setting_value
end

return {getOrDefineSettings = getOrDefineSettings}