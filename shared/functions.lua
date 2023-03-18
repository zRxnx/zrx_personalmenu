CreateThread(function()
    if Config.Menu.idcard then
        if GetResourceState('jsfour-idcard'):find('missing') then
            print('^0[^1ERROR^0] You enabled "Config.Menu.idcard" but "jsfour-idcard" is not on the server!')
        end
    end
end)

Protect = function(tbl)
    return setmetatable({}, {
        __index = tbl,
        __newindex = function(t, key, value)
            error("attempting to change constant " ..
                   tostring(key) .. " to " .. tostring(value), 2)
        end
    })
end

StringSplit = function(str, sep)
    if not sep then
        sep = '%s'
    end

    local t, i = {}, 1

    for str in string.gmatch(str, '([^'..sep..']+)') do
        t[i] = str
        i += 1
    end

    return t
end

StartsWith = function(str, find)
    return str:sub(1, #find) == find
end