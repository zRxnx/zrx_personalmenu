COOLDOWN = {}

Player = {
    Hire = function(xPlayer, xTarget)
        local xJob, yJob = xPlayer.getJob(), xTarget.getJob()

        if not IsGradeAllowed(xJob) then
            Config.Notification(xPlayer.source, Strings.company_not_permitted)
        elseif xJob.name == yJob.name then
            Config.Notification(xPlayer.source, (Strings.company_hire_already):format(xTarget.getName()))
        else
            xTarget.setJob(xJob.name, 0)

            Config.Notification(xPlayer.source, (Strings.company_you_hired):format(xTarget.getName()))
            Config.Notification(xTarget.source, (Strings.company_by_hired):format(xPlayer.getName()))

            if Webhook.Settings.company then
                DiscordLog(xPlayer.source, 'HIRE', ('Player %s (%s) hired %s (%s) for (%s)'):format(PLAYER_CACHE[xPlayer.source].name, xPlayer.source, PLAYER_CACHE[xTarget.source].name, xTarget.source, xJob.name:upper()))
            end
        end
    end,

    Fire = function(xPlayer, xTarget)
        local xJob, yJob = xPlayer.getJob(), xTarget.getJob()

        if not IsGradeAllowed(xJob) then
            Config.Notification(xPlayer.source, Strings.company_not_permitted)
        elseif xJob.name ~= yJob.name then
            Config.Notification(xPlayer.source, Strings.company_not_same)
        elseif xJob.name == yJob.name then
            if ESX.DoesJobExist(Config.Company.default.job, Config.Company.default.grade) then
                xTarget.setJob(Config.Company.default.job, Config.Company.default.grade)
            else
                xTarget.setJob('unemployed', 0)
            end

            Config.Notification(xPlayer.source, (Strings.company_you_fired):format(xTarget.getName()))
            Config.Notification(xTarget.source, (Strings.company_by_fired):format(xPlayer.getName()))

            if Webhook.Settings.company then
                DiscordLog(xPlayer.source, 'FIRE', ('Player %s (%s) fired %s (%s) from (%s)'):format(PLAYER_CACHE[xPlayer.source].name, xPlayer.source, PLAYER_CACHE[xTarget.source].name, xTarget.source, xJob.name:upper()), 'company')
            end
        end
    end,

    Promote = function(xPlayer, xTarget)
        local xJob, yJob = xPlayer.getJob(), xTarget.getJob()

        if not IsGradeAllowed(xJob) then
            Config.Notification(xPlayer.source, Strings.company_not_permitted)
        elseif xJob.name ~= yJob.name then
            Config.Notification(xPlayer.source, Strings.company_not_same)
        elseif xJob.name == yJob.name then
            local grade = xJob.grade + 1

            if ESX.DoesJobExist(xJob.name, grade) then
                xTarget.setJob(xJob.name, grade)

                Config.Notification(xPlayer.source, (Strings.company_you_promote):format(xTarget.getName(), xJob.grade_label, grade))
                Config.Notification(xTarget.source, (Strings.company_by_promote):format(xPlayer.getName(), xJob.grade_label, grade))

                if Webhook.Settings.company then
                    DiscordLog(xPlayer.source, 'PROMOTE', ('Player %s (%s) promoted %s (%s) to (%s - %s)'):format(PLAYER_CACHE[xPlayer.source].name, xPlayer.source, PLAYER_CACHE[xTarget.source].name, xTarget.source, xJob.name:upper(), grade), 'company')
                end
            else
                Config.Notification(xPlayer.source, Strings.company_higher)
            end
        end
    end,

    Derank = function(xPlayer, xTarget)
        local xJob, yJob = xPlayer.getJob(), xTarget.getJob()

        if not IsGradeAllowed(xJob) then
            Config.Notification(xPlayer.source, Strings.company_not_permitted)
        elseif xJob.name ~= yJob.name then
            Config.Notification(xPlayer.source, Strings.company_not_same)
        elseif xJob.name == yJob.name then
            local grade = xJob.grade - 1

            if ESX.DoesJobExist(xJob.name, grade) then
                xTarget.setJob(xJob.name, grade)

                Config.Notification(xPlayer.source, (Strings.company_you_derank):format(xTarget.getName(), xJob.grade_label, grade))
                Config.Notification(xTarget.source, (Strings.company_by_derank):format(xPlayer.getName(), xJob.grade_label, grade))

                if Webhook.Settings.company then
                    DiscordLog(xPlayer.source, 'DERANK', ('Player %s (%s) deranked %s (%s) to (%s - %s)'):format(PLAYER_CACHE[xPlayer.source].name, xPlayer.source, PLAYER_CACHE[xTarget.source].name, xTarget.source, xJob.name:upper(), grade), 'company')
                end
            else
                Config.Notification(xPlayer.source, Strings.company_lower)
            end
        end
    end,

    HasCooldown = function(player)
        if not Config.Cooldown then return false end

        if COOLDOWN[player] then
            if os.time() - Config.Cooldown > COOLDOWN[player] then
                COOLDOWN[player] = nil
            else
                --| Dont reset ig COOLDOWN[player] = nil
                return true
            end
        else
            COOLDOWN[player] = os.time()
        end

        return false
    end
}

GetPlayerData = function(player)
    local output = GetPlayerIdentifiers(player)
    local p1, p2 = promise.new(), promise.new()
    local name = GetPlayerName(player)
    local numTokens = GetNumPlayerTokens(player)
    local guid = GetPlayerGuid(player)
    local fivem = 'NOT FOUND'
    local steam = 'NOT FOUND'
    local license = 'NOT FOUND'
    local license2 = 'NOT FOUND'
    local discord = 'NOT FOUND'
    local xbl = 'NOT FOUND'
    local liveid = 'NOT FOUND'
    local ip = 'NOT FOUND'
    local country = 'NOT FOUND'
    local vpn = false
    local hwids = {}

    for i, identifier in pairs(output) do
        if string.sub(identifier, 1, string.len('steam:')) == 'steam:' then
            steam = identifier:gsub('steam:', '')
        elseif string.sub(identifier, 1, string.len('fivem:')) == 'fivem:' then
            fivem = identifier:gsub('fivem:', '')
        elseif string.sub(identifier, 1, string.len('license:')) == 'license:' then
            license = identifier:gsub('license:', '')
        elseif string.sub(identifier, 1, string.len('license2:')) == 'license2:' then
            license2 = identifier:gsub('license2:', '')
        elseif string.sub(identifier, 1, string.len('xbl:')) == 'xbl:' then
            xbl = identifier:gsub('xbl:', '')
        elseif string.sub(identifier, 1, string.len('ip:')) == 'ip:' then
            ip = identifier:gsub('ip:', '')
        elseif string.sub(identifier, 1, string.len('discord:')) == 'discord:' then
            discord = identifier:gsub('discord:', '')
        elseif string.sub(identifier, 1, string.len('live:')) == 'live:' then
            liveid = identifier:gsub('live:', '')
        end
    end

    for i = 0, numTokens, 1 do
        hwids[#hwids + 1] = GetPlayerToken(player, i)
    end

    PerformHttpRequest(('http://ip-api.com/json/%s?fields=61439'):format(ip), function(_, result, _)
        if result then
            local data = json.decode(result)

            p1:resolve(data.country)
            p2:resolve(not not (data.hosting or data.proxy))
        end
    end)

    country = Citizen.Await(p1)
    vpn = Citizen.Await(p2)

    return {
        player = player,
        name = name,
        guid = guid,
        hwids = hwids,
        steam = steam,
        license = license,
        license2 = license2,
        fivem = fivem,
        xbl = xbl,
        ip = ip,
        discord = discord,
        liveid = liveid,
        country = country,
        vpn = vpn
    }
end

DiscordLog = function(player, title, message, webhook)
    if Webhook.Links[webhook]:len() <= 0 then return end
    local description = ('%s\n\n'):format(message)

    if not Webhook.Execlude.name then
        description = ('%s `👤` **Player**: %s\n'):format(description, PLAYER_CACHE[player].name)
    end

    if not Webhook.Execlude.player then
        description = ('%s `#️⃣` **Server ID**: `%s`\n'):format(description, PLAYER_CACHE[player].player)
    end

    if not Webhook.Execlude.ping then
        description = ('%s `📶` **Player Ping**: `%sms`\n'):format(description, GetPlayerPing(player) )
    end

    if not Webhook.Execlude.discord then
        description = ('%s `📌` **Discord ID**: `%s` <@%s>\n'):format(description, PLAYER_CACHE[player].discord, PLAYER_CACHE[player].discord)
    end

    if not Webhook.Execlude.fivem then
        description = ('%s `🟧` **FiveM ID**: `%s`\n'):format(description, PLAYER_CACHE[player].fivem)
    end

    if not Webhook.Execlude.license then
        description = ('%s `📀` **License ID**: `%s`\n'):format(description, PLAYER_CACHE[player].license)
    end

    if not Webhook.Execlude.license2 then
        description = ('%s `💿` **License2 ID**: `%s`\n'):format(description, PLAYER_CACHE[player].license2)
    end

    if not Webhook.Execlude.hwid then
        description = ('%s `💻` **Hardware ID**: `%s`\n'):format(description, PLAYER_CACHE[player].hwids[0])
    end

    if not Webhook.Execlude.steam then
        description = ('%s `👾` **Steam ID**: `%s`\n'):format(description, PLAYER_CACHE[player].steam)
    end

    if not Webhook.Execlude.xbl then
        description = ('%s `🕹️` **XBOX Live ID**: `%s`\n'):format(description, PLAYER_CACHE[player].xbl)
    end

    if not Webhook.Execlude.guid then
        description = ('%s `⚙️` **GUID**: `%s`\n'):format(description, PLAYER_CACHE[player].guid)
    end

    if not Webhook.Execlude.ip then
        description = ('%s `🌐` **IP**: ||%s||\n'):format(description, PLAYER_CACHE[player].ip)
    end

    if not Webhook.Execlude.country then
        description = ('%s `🌍` **Country**: ||%s||\n'):format(description, PLAYER_CACHE[player].country)
    end

    if not Webhook.Execlude.vpn then
        description = ('%s `🤖` **VPN**: ||%s||\n'):format(description, PLAYER_CACHE[player].vpn)
    end

    local embed = {
        {
            ['color'] = 255,
            ['title'] = title,
            ['description'] = description,
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

    PerformHttpRequest(Webhook.Links[webhook], nil, 'POST', json.encode({
        username = 'ZRX LOGS',
        embeds = embed,
        avatar_url = 'https://i.imgur.com/QOjklyr.png'
    }), {
        ['Content-Type'] = 'application/json'
    })
end

IsGradeAllowed = function(job)
    return not not Config.Company.allowedGrades[job.grade_name]
end