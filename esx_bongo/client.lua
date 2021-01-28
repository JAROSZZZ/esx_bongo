--[[DEVELOPED BY JAROSZ#4793!]]


local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}


ESX = nil
local PlayerData              = {}




Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer

end)
Citizen.CreateThread(function()
while true do
    Citizen.Wait(0)
    RegisterCommand('usun_efekt', function(source, args)
        SetTimecycleModifier("spectator0")
    end, false)
end
end)
    RegisterNetEvent('bongo:use')
    AddEventHandler('bongo:use', function()
        TriggerServerEvent('3dme:shareDisplayMe', "Dookoła czuć zapach marihuany")
        TriggerEvent("pNotify:SendNotification", {text = "Zaciągasz się bongosem...", type = "success", timeout = 3400, layout = "centerLeft"})
        local ped = GetPlayerPed(-1)
        TriggerEvent("mythic_progbar:client:progress", {
            name = "unique_action_name",
            duration = 10000,
            label = "Używasz bongo",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = false,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "anim@safehouse@bong",
                anim = "bong_stage4",
            },
            prop = {
                model = "prop_bong_01",
            }
        }, function(status)
            if not status then
                Citizen.Wait(5000)
                DoScreenFadeOut(1000)
                Citizen.Wait(1000)
                TriggerEvent("pNotify:SendNotification", {text = "Marihuana powoduje <b style='color:yellow'>halucynacje!</b>", type = "success", timeout = 2400, layout = "centerLeft"})
                ClearPedTasksImmediately(GetPlayerPed(-1))
                SetTimecycleModifier("spectator9")
                SetPedMotionBlur(GetPlayerPed(-1), true)
                SetPedMovementClipset(GetPlayerPed(-1), "move_m@drunk@verydrunk", true)
                SetPedIsDrunk(GetPlayerPed(-1), true)
                DoScreenFadeIn(1000)
                Citizen.Wait(600000)
                DoScreenFadeOut(1000)
                Citizen.Wait(1000)
                DoScreenFadeIn(1000)
                ClearTimecycleModifier()
                ResetScenarioTypesEnabled()
                ResetPedMovementClipset(GetPlayerPed(-1), 0)
                SetPedIsDrunk(GetPlayerPed(-1), false)
                SetPedMotionBlur(GetPlayerPed(-1), false)
            end
        end)
    end)

    
RegisterNetEvent('bongo:error')
AddEventHandler('bongo:error', function()
  local playerPed = GetPlayerPed(-1)
  TriggerEvent("pNotify:SendNotification", {text = "Nie posiadasz wystarczającej ilości marihuany.", type = "error", timeout = 4400, layout = "centerLeft"})
end)
--[[DEVELOPED BY JAROSZ#4793!]]