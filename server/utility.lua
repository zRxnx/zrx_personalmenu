if not Config.CheckForUpdates then return end
local curResName = GetCurrentResourceName()
local curVersion = GetResourceMetadata(curResName, 'version')
local resourceName = 'zrx_personalmenu'
local continueCheck = true
local PerformHttpRequest = PerformHttpRequest
local Wait = Wait

local getRepoInformations = function()
    local repoVersion, repoURL

    PerformHttpRequest('https://api.github.com/repos/zRxnx/zrx_personalmenu/releases/latest', function(err, response, headers)
        if err == 200 then
            local data = json.decode(response)

            repoVersion = data.tag_name
            repoURL = data.html_url
        else
            repoVersion = curVersion
            repoURL = 'https://github.com/zRxnx/zrx_personalmenu'
        end
    end, 'GET')

    lib.waitFor(function()
        return (repoVersion and repoURL)
    end, 'Version check Timeout', 5000)

    return repoVersion or 'INVALID RESPONSE', repoURL or 'INVALID RESPONSE'
end

local checkVersion = function()
    local repoVersion, repoURL = getRepoInformations()

    if curVersion ~= repoVersion then
        print(('^0[^3WARNING^0] %s is ^1NOT ^0up to date!'):format(resourceName))
        print(('^0[^3WARNING^0] Your Version: ^2%s^0'):format(curVersion))
        print(('^0[^3WARNING^0] Latest Version: ^2%s^0'):format(repoVersion))
        print(('^0[^3WARNING^0] Get the latest Version from: ^2%s^0'):format(repoURL))
    elseif repoVersion == 'INVALID RESPONSE' or repoURL == 'INVALID RESPONSE' then
        print('^0[^1ERROR^0] Failed to fetch version')
        continueCheck = false
    else
        print(('^0[^2INFO^0] %s is up to date! (^2%s^0)'):format(resourceName, curVersion))
        continueCheck = false
    end
end

CreateThread(function()
    if curResName ~= 'zrx_personalmenu' then
        resourceName = ('zrx_personalmenu (%s)'):format(curResName)
    end

    while continueCheck do
        PerformHttpRequest('https://github.com/zRxnx/zrx_personalmenu/releases/latest', checkVersion, 'GET')
        Wait(3600000)
    end
end)