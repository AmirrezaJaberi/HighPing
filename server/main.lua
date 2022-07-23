local data = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.Time)
        local Players = GetPlayers()
        for index, value in ipairs(Players) do
            if not data[value] then data[value] = { count = 0} end
            local ping = GetPlayerPing(value)
            if ping ~= nil then
                if tonumber(ping) =< tonumber(Config.MaxPing) then
                    data[value].count = data[value].count + 1
                    if data[value].count == 4 then
                        local reason = Config.Message['Kick']
                        SendLog({name = GetPlayerName(value), ping = ping, status = "Kicked"})
                        Wait(1000)
                        DropPlayer(value, string.format(reason, ping))
                    else
                        TriggerClientEvent('chatMessage', value, "[SYSTEM]", {255, 0, 0}, string.format(Config.Message['Warn'], ping, Config.MaxPing))
                        SendLog({name = GetPlayerName(value), ping = ping, status = "Warn "..data[value]..""})
                    end
                end
            end
        end
    end
end)

function SendLog(data)
    if Config.Discord['Webhook'] ~= nil or Config.Discord['Webhook'] ~= '' then
        PerformHttpRequest(Config.Discord['Webhook'], function(ERROR, DATA, RESULT)
        end, "POST", json.encode({
            embeds = {
                {
                    author = {
                        name = Config.Discord['Server Name'],
                        url = Config.Discord['Discord URL'],
                        icon_url = Config.Discord['Logo']
                    },
                    footer = {
                        text = ""..Config.Discord['Server Name'].."| "..os.date("%Y/%m/%d | %X").."",
                        icon_url = Config.Discord['Logo']
                    },
                    description = "**Player:** "..data.name.."\n**Ping:** "..data.ping.."\n**Status:** "..data.status.."\n",
                    color = 16711680
                }
            }
        }), {
            ["Content-Type"] = "application/json"
        })
    end
end