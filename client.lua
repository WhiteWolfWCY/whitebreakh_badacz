ESX = nil
local PlayerData = {}

local pracuje = false

--- WĄTKI ---

Citizen.CreateThread(function()
    
    Citizen.Trace('esx_badacz: Start')

        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end

        PlayerData = ESX.GetPlayerData()
        while ESX.GetPlayerData().job.name ~= 'badacz' do
            Citizen.Wait(6000)
        end

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local player = GetPlayerPed(-1)

            if GetDistanceBetweenCoords(GetEntityCoords(player, true), Config.badaniastart.x, Config.badaniastart.y, Config.badaniastart.z, true) < 10 then
                DrawMarker(20, Config.badaniastart.x, Config.badaniastart.y, Config.badaniastart.z + 0.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.75, 0.75, 0.75, 33, 196, 185, 100, true, true, 2, false, false, false, false)

                if GetDistanceBetweenCoords(GetEntityCoords(player, true), Config.badaniastart.x, Config.badaniastart.y, Config.badaniastart.z, true) < 1.5 then
                    ESX.ShowHelpNotification("Naciśnij ~INPUT_CONTEXT~, aby otworzyć przebieralnię")
                        if IsControlJustReleased(1, 51) then
                        MenuPrzebieralnia()
                        end
                end

            end
            

    end
end)

--- BLIPY ---

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(3000)

            local player = GetPlayerPed(-1)

            if PlayerData.job ~= nil and PlayerData.job.name == 'badacz' and not IsEntityDead(player) then

                local blip1 = AddBlipForCoord(Config.badaniastart.x, Config.badaniastart.y, Config.badaniastart.z)
                    SetBlipSprite(blip1, 499)
                    SetBlipColour(blip1, 26)
                    SetBlipAsShortRange(blip1, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Rozpocznij badania")
                    EndTextCommandSetBlipName(blip1)
                    return
            end

            
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3000)

        local player = GetPlayerPed(-1)

        if pracuje then
            
            if PlayerData.job ~= nil and PlayerData.job.name == 'badacz' and not IsEntityDead(player) then

                local blip2 = AddBlipForCoord(Config.badaniawoda1.x, Config.badaniawoda1.y, Config.badaniawoda1.z)
                    SetBlipSprite(blip2, 499)
                    SetBlipColour(blip2, 26)
                    SetBlipAsShortRange(blip2, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Próbki wody")
                    EndTextCommandSetBlipName(blip2)
                    

                local blip3 = AddBlipForCoord(Config.badaniadrzewo1.x, Config.badaniadrzewo1.y, Config.badaniadrzewo1.z)
                    SetBlipSprite(blip3, 499)
                    SetBlipColour(blip3, 26)
                    SetBlipAsShortRange(blip3, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Próbki drewna")
                    EndTextCommandSetBlipName(blip3)
                    

                local blip4 = AddBlipForCoord(Config.analiza.x, Config.analiza.y, Config.analiza.z)
                    SetBlipSprite(blip4, 499)
                    SetBlipColour(blip4, 26)
                    SetBlipAsShortRange(blip4, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Analiza próbek")
                    EndTextCommandSetBlipName(blip4)
                    

                local blip5 = AddBlipForCoord(Config.raport.x, Config.raport.y, Config.raport.z)
                    SetBlipSprite(blip5, 499)
                    SetBlipColour(blip5, 26)
                    SetBlipAsShortRange(blip5, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Drukowanie raportu")
                    EndTextCommandSetBlipName(blip5)
                    

                local blip6 = AddBlipForCoord(Config.szefu.x, Config.szefu.y, Config.szefu.z)
                    SetBlipSprite(blip6, 480)
                    SetBlipColour(blip6, 26)
                    SetBlipAsShortRange(blip6, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Szef")
                    EndTextCommandSetBlipName(blip6)
                    
                return
            end
        end
    end
end)

Citizen.CreateThread(function() 

    local zbieranie1 = false
    local zbieranie2 = false
    local zbieranie3 = false
    local zbieranie4 = false

    while true do
        Citizen.Wait(1)

        local ped = PlayerPedId()
        local koordy = GetEntityCoords(ped)

        if pracuje then 
            
            if PlayerData.job ~= nil and PlayerData.job.name == 'badacz' and not IsEntityDead( ped ) and zbieranie1 == false then
                if GetDistanceBetweenCoords(koordy, Config.badaniawoda1.x, Config.badaniawoda1.y, Config.badaniawoda1.z, true ) < 50 then
                    DrawMarker(20, Config.badaniawoda1.x, Config.badaniawoda1.y, Config.badaniawoda1.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 33, 196, 185, 155, 0, 0, 2, 0, 0, 0, 0)
                    if GetDistanceBetweenCoords(koordy, Config.badaniawoda1.x, Config.badaniawoda1.y, Config.badaniawoda1.z, true ) < 1 then
                        ESX.ShowHelpNotification("Naciśnij ~INPUT_CONTEXT~ aby zbierać próbki wody.")
                            if IsControlJustReleased(1, 51) then
                                Citizen.Wait(100)
                                    TriggerServerEvent("esx_badacz:zbierzwode")
                                    Citizen.Wait(15500) 
                                    zbieranie1 = true
                        end
                    end
                end
            end

            if PlayerData.job ~= nil and PlayerData.job.name == 'badacz' and not IsEntityDead( ped ) and zbieranie2 == false then
                if GetDistanceBetweenCoords(koordy, Config.badaniawoda2.x, Config.badaniawoda2.y, Config.badaniawoda2.z, true ) < 50 then
                    DrawMarker(20, Config.badaniawoda2.x, Config.badaniawoda2.y, Config.badaniawoda2.z+0.2, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 33, 196, 185, 155, 0, 0, 2, 0, 0, 0, 0)
                    if GetDistanceBetweenCoords(koordy, Config.badaniawoda2.x, Config.badaniawoda2.y, Config.badaniawoda2.z, true ) < 1 then
                        ESX.ShowHelpNotification("Naciśnij ~INPUT_CONTEXT~ aby zbierać próbki wody.")
                            if IsControlJustReleased(1, 51) then
                                Citizen.Wait(100)
                                    TriggerServerEvent("esx_badacz:zbierzwode")
                                    Citizen.Wait(15500) 
                                    zbieranie2 = true
                        end
                    end
                end
            end

            if PlayerData.job ~= nil and PlayerData.job.name == 'badacz' and not IsEntityDead( ped ) and zbieranie3  == false then
                if GetDistanceBetweenCoords(koordy, Config.badaniawoda3.x, Config.badaniawoda3.y, Config.badaniawoda3.z, true ) < 50 then
                    DrawMarker(20, Config.badaniawoda3.x, Config.badaniawoda3.y, Config.badaniawoda3.z+0.4, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 33, 196, 185, 155, 0, 0, 2, 0, 0, 0, 0)
                    if GetDistanceBetweenCoords(koordy, Config.badaniawoda3.x, Config.badaniawoda3.y, Config.badaniawoda3.z, true ) < 1 then
                        ESX.ShowHelpNotification("Naciśnij ~INPUT_CONTEXT~ aby zbierać próbki wody.")
                            if IsControlJustReleased(1, 51) then
                                Citizen.Wait(100)
                                    TriggerServerEvent("esx_badacz:zbierzwode")
                                    Citizen.Wait(15500) 
                                    zbieranie3 = true
                        end
                    end
                end
            end

            if PlayerData.job ~= nil and PlayerData.job.name == 'badacz' and not IsEntityDead( ped ) and zbieranie4 == false then
                if GetDistanceBetweenCoords(koordy, Config.badaniawoda4.x, Config.badaniawoda4.y, Config.badaniawoda4.z, true ) < 50 then
                    DrawMarker(20, Config.badaniawoda4.x, Config.badaniawoda4.y, Config.badaniawoda4.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 33, 196, 185, 155, 0, 0, 2, 0, 0, 0, 0)
                    if GetDistanceBetweenCoords(koordy, Config.badaniawoda4.x, Config.badaniawoda4.y, Config.badaniawoda4.z, true ) < 1 then
                        ESX.ShowHelpNotification("Naciśnij ~INPUT_CONTEXT~ aby zbierać próbki wody.")
                            if IsControlJustReleased(1, 51) then
                                Citizen.Wait(100)
                                    TriggerServerEvent("esx_badacz:zbierzwode")
                                    Citizen.Wait(15500) 
                                    zbieranie4 = true
                        end
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    local zbieranie1 = false
    local zbieranie2 = false
    local zbieranie3 = false
    local zbieranie4 = false
    while true do

        local ped = PlayerPedId()
        local koordy = GetEntityCoords(ped)

        Citizen.Wait(0)
        if pracuje then 

            if PlayerData.job ~= nil and PlayerData.job.name == 'badacz' and not IsEntityDead( ped ) and zbieranie1 == false then
                if GetDistanceBetweenCoords(koordy, Config.badaniadrzewo1.x, Config.badaniadrzewo1.y, Config.badaniadrzewo1.z, true ) < 50 then
                    DrawMarker(20, Config.badaniadrzewo1.x, Config.badaniadrzewo1.y, Config.badaniadrzewo1.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 5, 99, 0, 155, 0, 0, 2, 0, 0, 0, 0)
                    if GetDistanceBetweenCoords(koordy, Config.badaniadrzewo1.x, Config.badaniadrzewo1.y, Config.badaniadrzewo1.z, true ) < 1 then
                        ESX.ShowHelpNotification("Naciśnij ~INPUT_CONTEXT~ aby zbierać próbki drewna.")
                            if IsControlJustReleased(1, 51) then
                                Citizen.Wait(100)
                                    TriggerServerEvent("esx_badacz:zbierzdrewno")
                                    Citizen.Wait(15500) 
                                    zbieranie1 = true
                        end
                    end
                end
            end

                if PlayerData.job ~= nil and PlayerData.job.name == 'badacz' and not IsEntityDead(ped) and zbieranie2 == false then
                    if GetDistanceBetweenCoords(koordy, Config.badaniadrzewo2.x, Config.badaniadrzewo2.y, Config.badaniadrzewo2.z, true) < 50 then
                        DrawMarker(20, Config.badaniadrzewo2.x, Config.badaniadrzewo2.y, Config.badaniadrzewo2.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 5, 99, 0, 155, 0, 0, 2, 0, 0, 0, 0)
                        if GetDistanceBetweenCoords(koordy, Config.badaniadrzewo2.x, Config.badaniadrzewo2.y, Config.badaniadrzewo2.z, true) < 1 then
                            ESX.ShowHelpNotification("Naciśnij ~INPUT_CONTEXT~ aby zbierać próbki drewna.")
                                if IsControlJustReleased(1, 51) then
                                    Citizen.Wait(100)
                                        TriggerServerEvent("esx_badacz:zbierzdrewno")
                                        Citizen.Wait(15500)
                                        zbieranie2 = true
                                end
                        end
                    end
                end

                if PlayerData.job ~= nil and PlayerData.job.name == 'badacz' and not IsEntityDead(ped) and zbieranie3 == false then
                    if GetDistanceBetweenCoords(koordy, Config.badaniadrzewo3.x, Config.badaniadrzewo3.y, Config.badaniadrzewo3.z, true) < 50 then
                        DrawMarker(20, Config.badaniadrzewo3.x, Config.badaniadrzewo3.y, Config.badaniadrzewo3.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 5, 99, 0, 155, 0, 0, 2, 0, 0, 0, 0)
                        if GetDistanceBetweenCoords(koordy, Config.badaniadrzewo3.x, Config.badaniadrzewo3.y, Config.badaniadrzewo3.z, true) < 1 then
                            ESX.ShowHelpNotification("Naciśnij ~INPUT_CONTEXT~ aby zbierać próbki drewna.")
                                if IsControlJustReleased(1, 51) then
                                    Citizen.Wait(100)
                                        TriggerServerEvent("esx_badacz:zbierzdrewno")
                                        Citizen.Wait(15500)
                                        zbieranie3 = true
                                end
                        end
                    end
                end

                if PlayerData.job ~= nil and PlayerData.job.name == 'badacz' and not IsEntityDead(ped) and zbieranie4 == false then
                    if GetDistanceBetweenCoords(koordy, Config.badaniadrzewo4.x, Config.badaniadrzewo4.y, Config.badaniadrzewo4.z, true) < 50 then
                        DrawMarker(20, Config.badaniadrzewo4.x, Config.badaniadrzewo4.y, Config.badaniadrzewo4.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 5, 99, 0, 155, 0, 0, 2, 0, 0, 0, 0)
                        if GetDistanceBetweenCoords(koordy, Config.badaniadrzewo4.x, Config.badaniadrzewo4.y, Config.badaniadrzewo4.z, true) < 1 then
                            ESX.ShowHelpNotification("Naciśnij ~INPUT_CONTEXT~ aby zbierać próbki drewna.")
                                if IsControlJustReleased(1, 51) then
                                    Citizen.Wait(100)
                                        TriggerServerEvent("esx_badacz:zbierzdrewno")
                                        Citizen.Wait(15500)
                                        zbieranie4 = true
                                end
                        end
                    end
                end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        local koordy = GetEntityCoords(ped, true)

        if GetDistanceBetweenCoords(koordy, Config.analiza.x, Config.analiza.y, Config.analiza.z, true) < 15 and pracuje == true then
            DrawMarker(20, Config.analiza.x, Config.analiza.y, Config.analiza.z + 0.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.75, 0.75, 0.75, 33, 196, 185, 100, true, true, 2, false, false, false, false)
            if GetDistanceBetweenCoords(koordy, Config.analiza.x, Config.analiza.y, Config.analiza.z, true) < 2 and pracuje == true then
                ESX.ShowHelpNotification("Naciśnij ~INPUT_CONTEXT~, aby poddać próbki ~b~analizie")
                if IsControlJustReleased(1, 51) then
                    Citizen.Wait(200)
                        TriggerServerEvent()
                end
            end
        end
    end

end)


--- EVENTY ---
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('esx_badacz:zbieranie')
AddEventHandler('esx_badacz:zbieranie', function()
    Zbieranie()
end)

RegisterNetE

RegisterNetEvent('esx_badacz:zaduzo')
AddEventHandler('esx_badacz:zaduzo', function()
    ESX.ShowHelpNotification("Posiadasz maksymalną ilość próbek w swoim ekwipunku!")
    
end)

RegisterNetEvent('esx_badacz:maanalize')
AddEventHandler('esx_badacz:maanalize', function()
    ESX.ShowHelpNotification("Posiadasz już analizę na pendrive!")
    
end)

RegisterNetEvent('esx_badacz:timer')
AddEventHandler('esx_badacz:timer', function()
    local timer = 0
    local ped = PlayerPedId()
    
    Citizen.CreateThread(function()
		while timer > -1 do
			Citizen.Wait(140)

			if timer > -1 then
				timer = timer + 1
            end
            if timer == 100 then
                break
            end
		end
    end) 

    Citizen.CreateThread(function()
        while true do
            
            Citizen.Wait(0)
                if GetDistanceBetweenCoords( Config.badaniawoda1.x, Config.badaniawoda1.y, Config.badaniawoda1.z, GetEntityCoords((ped))) < 3.0 then
                    Draw3DText( Config.badaniawoda1.x, Config.badaniawoda1.y, Config.badaniawoda1.z+0.5 -1.400, ('Trwa zbieranie próbek ' .. timer .. '%'), 4, 0.1, 0.1)
                end
                if timer == 100 then
                    break
                end
                if GetDistanceBetweenCoords( Config.badaniawoda2.x, Config.badaniawoda2.y, Config.badaniawoda2.z, GetEntityCoords((ped))) < 3.0 then
                    Draw3DText( Config.badaniawoda2.x, Config.badaniawoda2.y, Config.badaniawoda2.z+0.5 -1.400, ('Trwa zbieranie próbek ' .. timer .. '%'), 4, 0.1, 0.1)
                end
                if timer == 100 then
                    break
                end
                if GetDistanceBetweenCoords( Config.badaniawoda3.x, Config.badaniawoda3.y, Config.badaniawoda3.z, GetEntityCoords((ped))) < 3.0 then
                    Draw3DText( Config.badaniawoda3.x, Config.badaniawoda3.y, Config.badaniawoda3.z+0.5 -1.400, ('Trwa zbieranie próbek ' .. timer .. '%'), 4, 0.1, 0.1)
                end
                if timer == 100 then
                    break
                end
                if GetDistanceBetweenCoords( Config.badaniawoda4.x, Config.badaniawoda4.y, Config.badaniawoda4.z, GetEntityCoords((ped))) < 3.0 then
                    Draw3DText( Config.badaniawoda4.x, Config.badaniawoda4.y, Config.badaniawoda4.z+0.5 -1.400, ('Trwa zbieranie próbek ' .. timer .. '%'), 4, 0.1, 0.1)
                end
                if timer == 100 then
                    break
                end
                if GetDistanceBetweenCoords( Config.badaniadrzewo1.x, Config.badaniadrzewo1.y, Config.badaniadrzewo1.z, GetEntityCoords((ped))) < 3.0 then
                    Draw3DText( Config.badaniadrzewo1.x, Config.badaniadrzewo1.y, Config.badaniadrzewo1.z+0.5 -1.400, ('Trwa zbieranie próbek ' .. timer .. '%'), 4, 0.1, 0.1)
                end
                if timer == 100 then
                    break
                end
                if GetDistanceBetweenCoords( Config.badaniadrzewo2.x, Config.badaniadrzewo2.y, Config.badaniadrzewo2.z, GetEntityCoords((ped))) < 3.0 then
                    Draw3DText( Config.badaniadrzewo2.x, Config.badaniadrzewo2.y, Config.badaniadrzewo2.z+0.5 -1.400, ('Trwa zbieranie próbek ' .. timer .. '%'), 4, 0.1, 0.1)
                end
                if timer == 100 then
                    break
                end
                if GetDistanceBetweenCoords( Config.badaniadrzewo3.x, Config.badaniadrzewo3.y, Config.badaniadrzewo3.z, GetEntityCoords((ped))) < 3.0 then
                    Draw3DText( Config.badaniadrzewo3.x, Config.badaniadrzewo3.y, Config.badaniadrzewo3.z+0.5 -1.400, ('Trwa zbieranie próbek ' .. timer .. '%'), 4, 0.1, 0.1)
                end
                if timer == 100 then
                    break
                end
                if GetDistanceBetweenCoords( Config.badaniadrzewo4.x, Config.badaniadrzewo4.y, Config.badaniadrzewo4.z, GetEntityCoords((ped))) < 3.0 then
                    Draw3DText( Config.badaniadrzewo4.x, Config.badaniadrzewo4.y, Config.badaniadrzewo4.z+0.5 -1.400, ('Trwa zbieranie próbek ' .. timer .. '%'), 4, 0.1, 0.1)
                end
                if timer == 100 then
                    break
                end
        end
    end)
end)

--- FUNKCJE ---

function Zbieranie() 
    local ped = PlayerPedId()

    Citizen.CreateThread(function()
        RequestAnimDict("amb@medic@standing@kneel@idle_a")
        Citizen.Wait(100)
        TaskPlayAnim((ped), 'amb@medic@standing@kneel@idle_a', 'idle_a', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
        Citizen.Wait(7000)
        TaskPlayAnim((ped), 'amb@medic@standing@kneel@idle_a', 'idle_a', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
    end)
end

function Analiza() 
    local ped = PlayerPedId()

    Citizen.CreateThread(function()
        RequestAnimDict("amb@medic@standing@kneel@idle_a")
        Citizen.Wait(100)
        TaskPlayAnim((ped), 'amb@medic@standing@kneel@idle_a', 'idle_a', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
        Citizen.Wait(7000)
        TaskPlayAnim((ped), 'amb@medic@standing@kneel@idle_a', 'idle_a', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
    end)
end

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100 
    SetTextScale(0.35, 0.35)
    SetTextFont(fontId)
    SetTextProportional(0)
    SetTextColour(33, 196, 185, 215)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()   
end

function MenuPrzebieralnia()
	ESX.UI.Menu.CloseAll()
  
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'cloakroom',
	  {
		title    = 'Szatnia',
		align    = 'center',
		elements = {
		  {label = 'Ubranie robocze', value = 'job_wear'},
		  {label = 'Ubranie cywilne', value = 'citizen_wear'}
		}
	  },
	  function(data, menu)
		if data.current.value == 'citizen_wear' then
  
			  TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_BUM_STANDING", 0, true)
			  Wait(3000)
			  ClearPedTasks(GetPlayerPed(-1))
		  pracuje = false

		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			  TriggerEvent('skinchanger:loadSkin', skin)
		  end)
		end
		if data.current.value == 'job_wear' then
  
			  TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_BUM_STANDING", 0, true)
			  Wait(3000)
			  ClearPedTasks(GetPlayerPed(-1))
		  pracuje = true
  
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			  if skin.sex == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)   
			else
				TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
			end
			
		  end)
		end
		menu.close()
	  end,
	  function(data, menu)
		menu.close()
	  end
	)
end

-- Written by WhiteWolf and BreakH in 2019 -- 
