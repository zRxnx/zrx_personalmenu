Player = {
    hire = function(xPlayer, yTarget)
        local xJob = xPlayer.getJob()
        local yJob = yTarget.getJob()

        if xJob.grade_name ~= 'boss' then
            return
        elseif xJob.name == yJob.name then
            Config.Notification(xPlayer.source, (Strings.company_hire_already):format(yTarget.getName()))
            return
        else
            yTarget.setJob(xJob.name, 0)

            Config.Notification(xPlayer.source, (Strings.company_you_hired):format(yTarget.getName()))
            Config.Notification(yTarget.source, (Strings.company_by_hired):format(xPlayer.getName()))
            DiscordLog(xPlayer.source, 'HIRE', ('Player %s (%s) hired %s (%s) for (%s)'):format(GetPlayerName(xPlayer.source), xPlayer.source, GetPlayerName(yTarget.source), yTarget.source, xJob.name:upper()))
        end
    end,

    fire = function(xPlayer, yTarget)
        local xJob = xPlayer.getJob()
        local yJob = yTarget.getJob()

        if xJob.grade_name ~= 'boss' then
            return
        elseif xJob.name == yJob.name then
            yTarget.setJob(Config.Company.job, 0)

            Config.Notification(xPlayer.source, (Strings.company_you_fired):format(yTarget.getName()))
            Config.Notification(yTarget.source, (Strings.company_by_fired):format(xPlayer.getName()))
            DiscordLog(xPlayer.source, 'FIRE', ('Player %s (%s) fired %s (%s) from (%s)'):format(GetPlayerName(xPlayer.source), xPlayer.source, GetPlayerName(yTarget.source), yTarget.source, xJob.name:upper()))
        end
    end,

    promote = function(xPlayer, yTarget)
        local xJob = xPlayer.getJob()
        local yJob = yTarget.getJob()

        if xJob.grade_name ~= 'boss' then
            return
        elseif xJob.name == yJob.name then
            local grade = yJob.grade + 1

            if ESX.DoesJobExist(xJob.name, grade) then
                yTarget.setJob(xJob.name, grade)

                Config.Notification(xPlayer.source, (Strings.company_you_promote):format(yTarget.getName(), yJob.grade_label, grade))
                Config.Notification(yTarget.source, (Strings.company_by_promote):format(xPlayer.getName(), yJob.grade_label, grade))
                DiscordLog(xPlayer.source, 'PROMOTE', ('Player %s (%s) promoted %s (%s) to (%s - %s)'):format(GetPlayerName(xPlayer.source), xPlayer.source, GetPlayerName(yTarget.source), yTarget.source, xJob.name:upper(), grade))
            else
                Config.Notification(xPlayer.source, Strings.company_higher)
            end
        end
    end,

    derank = function(xPlayer, yTarget)
        local xJob = xPlayer.getJob()
        local yJob = yTarget.getJob()

        if xJob.grade_name ~= 'boss' then
            return
        elseif xJob.name == yJob.name then
            local grade = yJob.grade - 1

            if ESX.DoesJobExist(xJob.name, grade) then
                yTarget.setJob(xJob.name, grade)

                Config.Notification(xPlayer.source, (Strings.company_you_derank):format(yTarget.getName(), yJob.grade_label, grade))
                Config.Notification(yTarget.source, (Strings.company_by_derank):format(xPlayer.getName(), yJob.grade_label, grade))
                DiscordLog(xPlayer.source, 'DERANK', ('Player %s (%s) deranked %s (%s) to (%s - %s)'):format(GetPlayerName(xPlayer.source), xPlayer.source, GetPlayerName(yTarget.source), yTarget.source, xJob.name:upper(), grade))
            else
                Config.Notification(xPlayer.source, Strings.company_lower)
            end
        end
    end
}

GetPlayerData = function(player)
    local name = GetPlayerName(player) or 'NOT FOUND'
    local hwid = GetPlayerToken(player, 0) or 'NOT FOUND'
    local ping = GetPlayerPing(player) or 'NOT FOUND'
    local guid = GetPlayerGuid(player) or 'NOT FOUND'
    local steam = 'NOT FOUND'
    local license = 'NOT FOUND'
    local discord = 'NOT FOUND'
    local xbl = 'NOT FOUND'
    local liveid = 'NOT FOUND'
    local ip = 'NOT FOUND'

    for _, identifier in pairs(GetPlayerIdentifiers(player)) do
        if string.sub(identifier, 1, string.len('steam:')) == 'steam:' then
            steam = identifier:gsub('steam:', '')
        elseif string.sub(identifier, 1, string.len('license:')) == 'license:' then
            license = identifier:gsub('license:', '')
        elseif string.sub(identifier, 1, string.len('xbl:')) == 'xbl:' then
            xbl  = identifier:gsub('xbl:', '')
        elseif string.sub(identifier, 1, string.len('ip:')) == 'ip:' then
            ip = identifier:gsub('ip:', '')
        elseif string.sub(identifier, 1, string.len('discord:')) == 'discord:' then
            discord = identifier:gsub('discord:', '')
        elseif string.sub(identifier, 1, string.len('live:')) == 'live:' then
            liveid = identifier:gsub('live:', '')
        end
    end

    return { name = name, ping = ping, guid = guid, hwid = hwid, steam = steam, license = license, xbl = xbl, ip = ip, discord = discord, liveid = liveid }
end

DiscordLog = function(player, title, message)
    if WEBHOOK == '' then return end
    local plyData = GetPlayerData(player)

    local embed = {
        {
            ['color'] = 255,
            ['title'] = title,
            ['description'] = string.format(
            '%s\n\n' ..
            '`👤` **Player**: %s\n' ..
            '`#️⃣` **Server ID**: `%s`\n' ..
            '`📶` **Player Ping**: `%s`\n' ..
            '`📌` **Discord ID**: `%s` <@%s>\n' ..
            '`👾` **Steam ID**: `%s`\n' ..
            '`📀` **License ID**: `%s`\n' ..
            '`💻` **Hardware ID**: `%s`\n' ..
            '`⚙️` **GUID ID**: `%s`\n' ..
            '`🕹️` **XBOX Live ID**: `%s`\n' ..
            '`🌐` **IP**: ||%s||'
            , message, plyData.name, player, plyData.ping, plyData.discord, plyData.discord, plyData.steam, plyData.license, plyData.hwid, plyData.guid, plyData.xbl, plyData.ip
            ),
            ['footer'] = {
                ['text'] = ('Made by %s | %s'):format(GetResourceMetadata(GetCurrentResourceName(), 'author'), os.date()),
                ['icon_url'] = 'https://i.imgur.com/QOjklyr.png'
            },

            ['author'] = {
                ['name'] = 'zrx_personalmenu',
                ['icon_url'] = 'https://i.imgur.com/QOjklyr.png'
            }
        }
    }

    PerformHttpRequest(WEBHOOK, function(err, text, headers) end, 'POST', json.encode({
        username = 'ZRX LOGS',
        embeds = embed,
        avatar_url = 'https://i.imgur.com/QOjklyr.png'
    }), {
        ['Content-Type'] = 'application/json'
    })
end

PunishPlayer = function(player, reason)
    DiscordLog(player, 'PUNISH', reason)
    DropPlayer(player, reason)
end