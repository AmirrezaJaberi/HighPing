Config = {}

-- Max Ping Player Get Warn
Config.MaxPing = 180

-- Secend To Check Player Again
Config.Time = 10000

-- Discord Webhok Log For Manage Player
Config.Discord = {
    ['Webhook']     = '',
    ['Logo']        = '',
    ['Server Name'] = '',
    ['Discord URL'] = '',
}

-- Max Warn Player Can Get (After That Kick)
Config.MaxWarn = 3

-- Message When Player Warned
Config.Messages = {
    ['Warn'] = "Your ping is ^1%s^0 & it's higher than ^4%s^0 please check your programs !",
    ['Kick']   = '\n⚡ Kicked\nYour ping is very high (%s ms)\nPlease check your apps and make sure you are not download anything !',
}