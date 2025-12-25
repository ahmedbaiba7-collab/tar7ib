local welcomeCam

function StartWelcomeCamera()
    -- إنشاء كاميرا في السماء
    welcomeCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    
    -- إحداثيات الكاميرا (يمكنك تغييرها حسب موقع سيرفرك)
    SetCamCoord(welcomeCam, -600.0, -900.0, 300.0) 
    SetCamRot(welcomeCam, -20.0, 0.0, 150.0)
    
    SetCamActive(welcomeCam, true)
    RenderScriptCams(true, true, 2000, true, true)
end

function StopWelcomeCamera()
    RenderScriptCams(false, true, 2000, true, true)
    DestroyCam(welcomeCam, false)
end

-- نعدل هذا الجزء في الكود السابق
AddEventHandler('playerSpawned', function()
    if not hasOpened then
        Wait(500)
        StartWelcomeCamera() -- تشغيل الكاميرا
        
        local playerName = GetPlayerName(PlayerId())
        SetNuiFocus(true, true)
        
        SendNUIMessage({
            type = "openWelcome",
            name = playerName
        })
        hasOpened = true
    end
end)

RegisterNUICallback('closeUI', function(data, cb)
    SetNuiFocus(false, false)
    StopWelcomeCamera() -- إيقاف الكاميرا والعودة للاعب
    cb('ok')
end)