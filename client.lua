-- Codem Store  https://discord.gg/zj3QsUfxWs
-- Codem Store  https://discord.gg/zj3QsUfxWs
-- Codem Store  https://discord.gg/zj3QsUfxWs
-- Codem Store  https://discord.gg/zj3QsUfxWs


ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)
local display = false

local markets = {
    {name="Market",  x= 373.875,y= 325.896, z = 102.566}
   
}

Citizen.CreateThread(function()

      for _, item in pairs(markets) do
        item.blip = AddBlipForCoord(item.x, item.y, item.z)
        SetBlipSprite(item.blip, 52)
        SetBlipColour(item.blip, 29)
        SetBlipAsShortRange(item.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(item.name)
        EndTextCommandSetBlipName(item.blip)
      end
    
end)

RegisterNUICallback("update", function(data,cb)
    coins = true
    if coins then 
        cb(Config.Vehicle)
    else
        cb(false)
    end
end)


RegisterNUICallback('escape', function() SetNuiFocus(false, false) end)

RegisterNUICallback("itemdata", function(data,cb)
    money =  tonumber(data.price) 
    itemname = data.itemcode 
    itemstring = data.itemsname
    TriggerServerEvent('itemgo' , money , itemname,itemstring)
end)





Citizen.CreateThread(function()
    while true do 
        local Sleep =2000
        if (IsNearMarket()) then 
            Sleep = 3
            drawTxt('~r~E~w~ - Market',0,1,0.5,0.8,0.6,255,255,255,255)
            if IsControlJustReleased(1, 38) then
                    SetNuiFocus(true, true)
                    SendNUIMessage({
                        type = "data",
                        item = Config.items
                    })
            end
        end
        Citizen.Wait(Sleep)
    end
end)




function IsNearMarket()
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply)
    for _, item in pairs(markets) do
      local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
      if(distance <= 2) then
        return true
      end
    end
  end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x , y)
end