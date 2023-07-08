CreateThread(function()
    if Config.Menu.idcard then
        if GetResourceState('jsfour-idcard') == 'missing' then
            print('^0[^1ERROR^0] You enabled "Config.Menu.idcard" but "jsfour-idcard" is not on the server!')
        end
    end
end)

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