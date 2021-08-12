local Tunnel = module('vrp', 'lib/Tunnel') -- call Tunnel from vrp
local Proxy = module('vrp', 'lib/Proxy') -- call Proxy from vrp
vRP = Proxy.getInterface('vRP') -- call vRP functions using Proxy
vRPclient = Tunnel.getInterface("vRP","coding")
vRPclient = Tunnel.getInterface("vRP","vRP_basic_menu")
BMclient = Tunnel.getInterface("vRP_basic_menu","coding")
BMclient = Tunnel.getInterface("vRP_basic_menu","vRP_basic_menu")

local function mars(player,choice)
    local source = player -- save the source
    local user_id = vRP.getUserId({source}) -- get the player's user id
    vRPclient.varyHealth(player,{100})
    vRPclient.notify(player,{"~g~you got healed"})
end

RegisterCommand('health', function (player, args, rawCommand)
    local user_id = vRP.getUserId({player})
    if user_id ~= nil then
        if vRP.hasPermission({ user_id, "mars.test"}) then
            vRPclient.varyHealth(player,{100})
            vRPclient.notify(player,{"~g~you got healed"})
        end
    end
end)