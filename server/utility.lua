if not Config.CheckForUpdates then return end
local curResName = GetCurrentResourceName()
local curVersion = GetResourceMetadata(curResName, 'version')
local resourceName = 'zrx_personalmenu'
local continueCheck = true

CreateThread(function()
    if curResName ~= 'zrx_personalmenu' then
        resourceName = ('zrx_personalmenu (%s)'):format(curResName)
    end
end)

AddEventHandler('onResourceStart', function(res)
    if res ~= curResName then return end

    while continueCheck do
        PerformHttpRequest('https://github.com/zRxnx/zrx_personalmenu/releases/latest', CheckVersion, 'GET')
        Wait(3600000)
    end
end)

CheckVersion = function(err, responseText, headers)
    local repoVersion, repoURL = GetRepoInformations()

    if curVersion ~= repoVersion then
        print(('^0[^3WARNING^0] %s is ^1NOT ^0up to date!'):format(resourceName))
        print(('^0[^3WARNING^0] Your Version: ^2%s^0'):format(curVersion))
        print(('^0[^3WARNING^0] Latest Version: ^2%s^0'):format(repoVersion))
        print(('^0[^3WARNING^0] Get the latest Version from: ^2%s^0'):format(repoURL))
    else
        print(('^0[^2INFO^0] %s is up to date! (^2%s^0)'):format(resourceName, curVersion))
        continueCheck = false
    end
end

GetRepoInformations = function()
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

    repeat
        Wait(500)
    until (repoVersion and repoURL)

    return repoVersion, repoURL
end