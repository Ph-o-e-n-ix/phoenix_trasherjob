
if Config.UseNewESX then
    ESX = exports["es_extended"]:getSharedObject()
else
    ESX = nil

    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end
    end)
end

AddEventHandler('onClientResourceStart', function(ressourceName)
    if(GetCurrentResourceName() ~= ressourceName) then 
        return 
    end 
    print("" ..ressourceName.." started sucessfully")
end)

rewardpoints = 0

step6 = true
busy = false
busy2 = false
blipactive = false
delete = false
spawnprop = false
inhand = false
pressed = false
trashinhand = false
zuruecklegen = false
busy3 = false
step5 = false
text = false

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        for k, v in pairs(Config.StartMission) do 
            local player = PlayerPedId()
            local playercoords = GetEntityCoords(player)
            local dst = Vdist(playercoords, v.startcoords.x , v.startcoords.y, v.startcoords.z)
            if dst < 3 then 
                DrawText3D(v.startcoords.x , v.startcoords.y, v.startcoords.z, Translation[Config.Locale]['start_mission_text'])
                DrawText3D(v.startcoords.x , v.startcoords.y, v.startcoords.z - 0.15, Translation[Config.Locale]['cancel_mission_text'])
                if IsControlJustReleased(0, 38) then 
                    if not IsPedInAnyVehicle(player, false) then
                        startjob()
                        if not busy then 
                            DoScreenFadeOut(1000)
                            Citizen.Wait(1500)
                            busy = true
                            busy2 = true
                            busy3 = true

                            local car = GetHashKey(v.vehiclespawnname)
                            RequestModel(car)
                            while not HasModelLoaded(car) do
                                RequestModel(car)
                                Citizen.Wait(50)
                            end
                            vehicle = CreateVehicle(car, v.vehiclespawncoords.x, v.vehiclespawncoords.y, v.vehiclespawncoords.z, v.vehiclespawnheading, true, false)
                            if Config.UseLegacyFuel then
                                local getFuel = exports['LegacyFuel']:GetFuel(vehicle)
                                local fuelLevel = getFuel 
                                exports['LegacyFuel']:SetFuel(vehicle, 100)
                            end
                            SetPedIntoVehicle(player, vehicle, -1)
                            SetEntityAsNoLongerNeeded(vehicle)
                            SetVehicleNumberPlateText(vehicle, 'TRASH')
                            SetVehicleNumberPlateTextIndex(vehicle, 1)
                            SetEntityAsMissionEntity(vehicle, false, false)
                            Citizen.Wait(1500)
                            DoScreenFadeIn(1000)
                            Config.MSG(Translation[Config.Locale]['sucessfully_started_mission'])
                            if Config.Bail > 0 then
                                showPictureNotification('CHAR_CHEF', Translation[Config.Locale]['took_bail'], 'Chef', '')
                                TriggerServerEvent("trash:takebail")
                            end
                            Citizen.CreateThread(function()
                                while true do 
                                        Citizen.Wait(0)
                                        if busy and not spawnprop then
                                            spawnprop = true
                                            local playerPed = PlayerPedId()
                                            local nowcoords = GetEntityCoords(playerPed)
                                            missionvehicle = GetVehiclePedIsIn(playerPed, true)
                                            RequestModel(GetHashKey("prop_cs_bin_03"))
                                            while not HasModelLoaded("prop_cs_bin_03") do 
                                                Citizen.Wait(1)
                                            end
                                        end
                                        if not blipactive then
                                            blipactive = true
                                            results = Config.SpawnProps[math.random(#Config.SpawnProps)]
                                            Prop = CreateObject(GetHashKey("prop_cs_bin_03"), results.x, results.y, results.z -1.0, Config.VisibleforOtherPlayer, false, false)
                                            SetEntityHeading(Prop, results.h)
                                            FreezeEntityPosition(Prop, true)
                                            FirstBlip = AddBlipForCoord(results.x, results.y, results.z)
                                            SetBlipSprite(FirstBlip, 1)
                                            SetBlipScale(FirstBlip, 0.9)
                                            SetBlipColour(FirstBlip, 2)
                                            BeginTextCommandSetBlipName("STRING")
                                            AddTextComponentString(Translation[Config.Locale]['prop_blip_name'])
                                            EndTextCommandSetBlipName(FirstBlip)
                                            SetBlipRoute(FirstBlip, true)
                                            delete = false
                                            step5 = true
                                        end
                                end
                            end)
                        else 
                            Config.MSG(Translation[Config.Locale]['already_startet_mission'])
                        end
                    else
                        Config.MSG(Translation[Config.Locale]['cant_do_in_vehicle'])
                    end
                end
                if IsControlJustReleased(0, 47) then 
                    if busy then
                        if not IsPedInAnyVehicle(PlayerPedId(), false) and busy then 
                            local playercoords = GetEntityCoords(PlayerPedId())
                            local vehiclecoords = GetEntityCoords(vehicle)
                            local distance = Vdist(playercoords, vehiclecoords)
                            if distance < 250 then
                                if Config.Bail > 0 then
                                    showPictureNotification('CHAR_CHEF', Translation[Config.Locale]['back_bail'], 'Chef', '')
                                    TriggerServerEvent("trash:givebailback")
                                end
                                DeleteEntity(vehicle)
                                DeleteEntity(Prop)
                                Config.MSG(Translation[Config.Locale]['canceled_mission'])
                                busy = false
                                endjob()
                                RemoveBlip(FirstBlip)
                            else 
                                if Config.Bail > 0 then
                                    Config.MSG(Translation[Config.Locale]['trasher_not_nearby'])
                                end
                                DeleteEntity(vehicle)
                                DeleteEntity(Prop)
                                Config.MSG(Translation[Config.Locale]['canceled_mission'])
                                busy = false
                                endjob()
                                RemoveBlip(FirstBlip)
                            end
                        else 
                            Config.MSG(Translation[Config.Locale]['cant_do_in_vehicle'])
                        end 
                    else 
                        Config.MSG('Du hast den Job noch nicht gestartet')
                    end
                end
            end 
        end 
    end
end)
    


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        if busy2 and step5 and step6 then                              
            DrawMarker(0, results.x, results.y, results.z + 0.75, 0, 0, 0, 0, 0, 0, 1.0,1.0,1.1, 232,224,6, 150, 1, 0, 2, 0, 0, 0, 0) -- gelb
            local playerPed = PlayerPedId()
            local jetztcoords = GetEntityCoords(playerPed)
            local distanz = Vdist(jetztcoords, results.x, results.y, results.z)
            if distanz < 2 and not text then 
                DrawText3D(results.x, results.y, results.z , Translation[Config.Locale]['press_e_to_take_trash'])
            end
        end
        if busy3 and step5 and step6 then 
            
            local playerPed = PlayerPedId()
            local nowcoords = GetEntityCoords(playerPed)
            local propdistance = Vdist(nowcoords, results.x, results.y, results.z)
            if propdistance < 3 and not delete then 
                if IsControlJustPressed(0, 38) and not pressed then
                    if not IsPedInAnyVehicle(playerPed, false) then
                        Config.MSG(Translation[Config.Locale]['step1'])
                        text = true
                        busy2 = false
                        trashinhand = true
                        pressed = true
                        DeleteEntity(Prop)
                        RequestAnimDict('anim@heists@box_carry@')
                        while not HasAnimDictLoaded('anim@heists@box_carry@') do
                            Citizen.Wait(1)
                        end
                        TaskPlayAnim(playerPed, 'anim@heists@box_carry@', 'idle', 1.0, -8.0, -1, 49, 0, false, false, false)
                        garbagebag = CreateObject(GetHashKey("prop_cs_bin_03"), 0, 0, 0, true, true, true) -- creates object
                        AttachEntityToEntity(garbagebag, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.00, -0.420, -1.290, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                        inhand = true
                    else 
                        Config.MSG(Translation[Config.Locale]['cant_do_in_vehicle'])
                    end 
                end
            end
        end
    end
end)

step2 = false 
step3 = false
endstep = false

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
            if trashinhand then 
                local playerPed = PlayerPedId()
                local vehicle = missionvehicle
                local trunkpos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "boot"))
                local playerCoords = GetEntityCoords(playerPed)
                local Distance = Vdist(playerCoords, trunkpos.x , trunkpos.y, trunkpos.z)
                if Distance < 3 then
                    DrawText3D(trunkpos.x , trunkpos.y, trunkpos.z , Translation[Config.Locale]['press_to_take_trunk'])
                    shownotify('Drücke E')
                    if IsControlJustReleased(0, 38) then 
                        if not IsPedInAnyVehicle(playerPed, false) then 
                            if Config.UseMiniGame then
                                game = exports["k5_skillcheck"]:skillCheck("easy")
                                if game then 
                                    if Config.UseAnProgbar then
                                        SetVehicleDoorOpen(vehicle, 5, false, false)
                                        exports['an_progBar']:run(2,Translation[Config.Locale]['trash_empty'],'#E14127')
                                        Citizen.Wait(2000)
                                        SetVehicleDoorShut(vehicle, 5, false)
                                    end
                                    Config.MSG(Translation[Config.Locale]['bring_can_back'])
                                    DeleteEntity(garbagebag)
                                    trash2 = CreateObject(GetHashKey("prop_cs_bin_01_skinned"), 0, 0, 0, true, true, true) -- creates object
                                    AttachEntityToEntity(trash2, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.00, -0.420, -1.290, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                                    zuruecklegen = true
                                    trashinhand = false
                                    step2 = true
                                    Citizen.Wait(1000)
                                    step3 = true
                                    endstep = false
                                end
                            else 
                                if Config.UseAnProgbar then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                    exports['an_progBar']:run(2,Translation[Config.Locale]['trash_empty'],'#E14127')
                                    Citizen.Wait(2000)
                                    SetVehicleDoorShut(vehicle, 5, false)
                                end
                                Config.MSG(Translation[Config.Locale]['bring_can_back'])
                                DeleteEntity(garbagebag)
                                trash2 = CreateObject(GetHashKey("prop_cs_bin_01_skinned"), 0, 0, 0, true, true, true) -- creates object
                                AttachEntityToEntity(trash2, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.00, -0.420, -1.290, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                                zuruecklegen = true
                                trashinhand = false
                                step2 = true
                                Citizen.Wait(1000)
                                step3 = true
                                endstep = false
                            end
                        else 
                            Config.MSG(Translation[Config.Locale]['cant_do_in_vehicle'])
                        end
                    end
                end 
            end
            if step2 then 
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                local destence = Vdist(playerCoords, results.x, results.y, results.z)
                if destence < 10 then
                    DrawMarker(0, results.x, results.y, results.z, 0, 0, 0, 0, 0, 0, 1.0,1.0,1.1, 18,222,86, 150, 1, 0, 2, 0, 0, 0, 0)
                    if not endstep then 
                        if destence < 2 then 
                            DrawText3D(results.x, results.y, results.z , Translation[Config.Locale]['press_to_bring_trash_back'])
                            if IsControlJustReleased(0, 38) and step3 then 
                                if not IsPedInAnyVehicle(playerPed, false) then
                                    endstep = true
                                    DeleteEntity(trash2)
                                    local Prop2 = CreateObject(GetHashKey("prop_cs_bin_01_skinned"), results.x, results.y, results.z - 1.0, false, false, false)
                                    SetEntityHeading(Prop2, results.h)
                                    ClearPedTasks(playerPed)
                                    RemoveBlip(FirstBlip)
                                    busy2 = true
                                    blipactive = false
                                    pressed = false
                                    text = false
                                    step2 = false
                                    showPictureNotification('CHAR_CHEF', Translation[Config.Locale]['reward'], Translation[Config.Locale]['reward_title'], '')
                                    TriggerServerEvent("trash:getreward")
                                    rewardpoints = rewardpoints + 1
                                    Citizen.Wait(5000)
                                    DeleteEntity(Prop2)
                                else 
                                    Config.MSG(Translation[Config.Locale]['cant_do_in_vehicle'])
                                end
                            end
                        end 
                    end
                end
            end 
    end      
end)

bonus1 = false 
bonus2 = false 
bonus3 = false
bonus4 = false

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        if rewardpoints == 10 and not bonus1 then 
            bonus1 = true
            Citizen.Wait(500)
            TriggerServerEvent("trash:getbonus")
            Config.MSG(Translation[Config.Locale]['Bonus'])
        elseif rewardpoints == 20 and not bonus2 then 
            bonus2 = true
            Citizen.Wait(500)
            TriggerServerEvent("trash:getbonus")
            Config.MSG(Translation[Config.Locale]['Bonus'])
        elseif rewardpoints == 30 and not bonus3 then 
            bonus3 = true
            Citizen.Wait(500)
            TriggerServerEvent("trash:getbonus")
            Config.MSG(Translation[Config.Locale]['Bonus'])
        elseif rewardpoints == 40 and not bonus4 then 
            bonus4 = true
            Citizen.Wait(500)
            TriggerServerEvent("trash:getbonus")
            Config.MSG(Translation[Config.Locale]['Bonus'])
        end 
    end
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.StartMission) do 
        local Blip = AddBlipForCoord(v.startcoords.x, v.startcoords.y, v.startcoords.z)
        SetBlipSprite(Blip, 318)
        SetBlipDisplay(Blip, 4)
        SetBlipScale(Blip, 0.8)
        SetBlipColour(Blip, 2)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Trasher Job')
        EndTextCommandSetBlipName(Blip)
    end
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.StartMission) do
        RequestModel(GetHashKey(v.pedname))
        while not HasModelLoaded(GetHashKey(v.pedname)) do
            Wait(1)
        end
        RequestAnimDict("oddjobs@assassinate@guard")
        while not HasAnimDictLoaded("oddjobs@assassinate@guard") do
            Wait(1)
        end
        local ped =  CreatePed(4, v.pedname, v.startcoords.x, v.startcoords.y, v.startcoords.z -1.0, v.pedheading, false, false)
        SetEntityHeading(ped, v.pedheading)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskPlayAnim(ped,"oddjobs@assassinate@guard","unarmed_fold_arms", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)

function endjob()
    RemoveBlip(FirstBlip)
    DeleteEntity(Prop)
    DeleteEntity(garbagebag)
    busy = false
    busy2 = false
    delete = false
    spawnprop = false
    inhand = false
    pressed = false
    trashinhand = false
    zuruecklegen = false
    busy3 = false
    step5 = false
    text = false
    step6 = false
    rewardpoints = 0
    bonus1 = false 
    bonus2 = false 
    bonus3 = false
    bonus4 = false
end 

function startjob()
    step6 = true
    blipactive = false
    delete = false
    spawnprop = false
    inhand = false
    pressed = false
    trashinhand = false
    zuruecklegen = false
    busy3 = false
    step5 = false
    text = false
end

function showPictureNotification(icon, msg, title, subtitle)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg);
    SetNotificationMessage(icon, icon, true, 1, title, subtitle);
    DrawNotification(false, true);
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	SetDrawOrigin(x,y,z, 0)
	DrawText(0.0, 0.0)
	local factor = (string.len(text)) / 370
	DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
	ClearDrawOrigin()
end

function shownotify(msg)
	CurrentActionMsg  = msg
	SetTextComponentFormat('STRING')
	AddTextComponentString(CurrentActionMsg)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end 

AddEventHandler('playerDropped', function ()
    endjob()
end)

