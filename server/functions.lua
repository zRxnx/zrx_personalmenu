Player = {
    Hire = function(xPlayer, xTarget)
        local xJob, yJob = xPlayer.job, xTarget.job

        if not IsGradeAllowed(xJob) then
            CORE.Bridge.notification(xPlayer.source, Strings.company_not_permitted)
        elseif xJob.name == yJob.name then
            CORE.Bridge.notification(xPlayer.source, (Strings.company_hire_already):format(xTarget.getName()))
        else
            CORE.Bridge.setJob(xTarget.player, xJob.name, 0)

            CORE.Bridge.notification(xPlayer.source, (Strings.company_you_hired):format(xTarget.getName()))
            CORE.Bridge.notification(xTarget.source, (Strings.company_by_hired):format(xPlayer.getName()))

            if Webhook.Links.company:len() > 0 then
                local message = ([[
                    The player hired a person
    
                    Server ID: **%s**
                    Playername: **%s**
                    Job: **%s**
                    Grade: **0**
                ]]):format(xTarget.player, PLAYER_CACHE[xTarget.source].name, xJob.name)

                CORE.Server.DiscordLog(xPlayer.player, 'HIRE', message, Webhook.Links.company)
            end
        end
    end,

    Fire = function(xPlayer, xTarget)
        local xJob, yJob = xPlayer.job, xTarget.job

        if not IsGradeAllowed(xJob) then
            CORE.Bridge.notification(xPlayer.source, Strings.company_not_permitted)
        elseif xJob.name ~= yJob.name then
            CORE.Bridge.notification(xPlayer.source, Strings.company_not_same)
        elseif xJob.name == yJob.name then
            if CORE.Bridge.doesJobExist(Config.Company.default.job, Config.Company.default.grade) then
                CORE.Bridge.setJob(xTarget.player, Config.Company.default.job, Config.Company.default.grade)
            else
                CORE.Bridge.setJob(xTarget.player, 'unemployed', 0)
            end

            CORE.Bridge.notification(xPlayer.source, (Strings.company_you_fired):format(xTarget.getName()))
            CORE.Bridge.notification(xTarget.source, (Strings.company_by_fired):format(xPlayer.getName()))

            if Webhook.Links.company:len() > 0 then
                local message = ([[
                    The player fired a person
    
                    Server ID: **%s**
                    Playername: **%s**
                    Job: **%s**
                    Grade: **%s**
                ]]):format(xTarget.player, PLAYER_CACHE[xTarget.source].name, yJob.name, yJob.grade)

                CORE.Server.DiscordLog(xPlayer.player, 'FIRE', message, Webhook.Links.company)
            end
        end
    end,

    Promote = function(xPlayer, xTarget)
        local xJob, yJob = xPlayer.job, xTarget.job

        if not IsGradeAllowed(xJob) then
            CORE.Bridge.notification(xPlayer.source, Strings.company_not_permitted)
        elseif xJob.name ~= yJob.name then
            CORE.Bridge.notification(xPlayer.source, Strings.company_not_same)
        elseif xJob.name == yJob.name then
            local grade = xJob.grade + 1

            if CORE.Bridge.doesJobExist(xJob.name, grade) then
                CORE.Bridge.setJob(xTarget.player, xJob.name, grade)

                CORE.Bridge.notification(xPlayer.source, (Strings.company_you_promote):format(xTarget.getName(), xJob.grade_label, grade))
                CORE.Bridge.notification(xTarget.source, (Strings.company_by_promote):format(xPlayer.getName(), xJob.grade_label, grade))

                if Webhook.Links.company:len() > 0 then
                    local message = ([[
                        The player promoted a person
        
                        Server ID: **%s**
                        Playername: **%s**
                        Job: **%s**
                        Grade: **%s**
                    ]]):format(xTarget.player, PLAYER_CACHE[xTarget.source].name, xJob.name, grade)

                    CORE.Server.DiscordLog(xPlayer.player, 'PROMOTE', message, Webhook.Links.company)
                end
            else
                CORE.Bridge.notification(xPlayer.source, Strings.company_higher)
            end
        end
    end,

    Derank = function(xPlayer, xTarget)
        local xJob, yJob = xPlayer.job, xTarget.job

        if not IsGradeAllowed(xJob) then
            CORE.Bridge.notification(xPlayer.source, Strings.company_not_permitted)
        elseif xJob.name ~= yJob.name then
            CORE.Bridge.notification(xPlayer.source, Strings.company_not_same)
        elseif xJob.name == yJob.name then
            local grade = xJob.grade - 1

            if CORE.Bridge.doesJobExist(xJob.name, grade) then
                CORE.Bridge.setJob(xTarget.player, xJob.name, grade)

                CORE.Bridge.notification(xPlayer.source, (Strings.company_you_derank):format(xTarget.getName(), xJob.grade_label, grade))
                CORE.Bridge.notification(xTarget.source, (Strings.company_by_derank):format(xPlayer.getName(), xJob.grade_label, grade))

                if Webhook.Links.company:len() > 0 then
                    local message = ([[
                        The player deranked a person
        
                        Server ID: **%s**
                        Playername: **%s**
                        Job: **%s**
                        Grade: **%s**
                    ]]):format(xTarget.player, PLAYER_CACHE[xTarget.source].name, xJob.name, grade)

                    CORE.Server.DiscordLog(xPlayer.player, 'DERANK', message, Webhook.Links.company)
                end
            else
                CORE.Bridge.notification(xPlayer.source, Strings.company_lower)
            end
        end
    end,

    HasCooldown = function(player)
        if not Config.Cooldown then return false end
        local identifier = PLAYER_CACHE[player].license

        if COOLDOWN[identifier] then
            if os.time() - Config.Cooldown > COOLDOWN[identifier] then
                COOLDOWN[identifier] = nil
            else
                return true
            end
        else
            COOLDOWN[identifier] = os.time()
        end

        return false
    end
}

IsGradeAllowed = function(job)
    return not not Config.Company.allowedGrades[job.grade_name]
end