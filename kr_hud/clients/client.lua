function showNotification(message, color, flash, saveToBrief)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    ThefeedSetNextPostBackgroundColor(color)
    EndTextCommandThefeedPostTicker(flash, saveToBrief)
end

RegisterCommand('testNotification', function(_, args, rawCommand)
    showNotification(
        rawCommand,
        130,
        true,
        true
    )
end)

-- ADCANCEDNOTIFICATION

function showAdvancedNotification(message, sender, subject, textureDict, iconType, savedToBrief, color)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    ThefeedSetNextPostBackgroundColor(color)
    EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
end

RegisterCommand('testAdvanceNotification', function(_, args, rawCommand)
    showAdvancedNotification(
        rawCommand,
        "This is Sender",
        "This is Subject",
        "CHAR_AMMUNATION",
        8,
        true,
        130
    )
end)

-- SHOW ALERT

function showAlert(message, beep, duration)
    AddTextEntry("KR_ALERT", message)

    BeginTextCommandDisplayHelp("KR_ALERT")
    EndTextCommandDisplayHelp(0, false, beep, duration)
end

RegisterCommand('testAlert', function(_, _, rawCommand)
    showAlert(
        rawCommand,
        true,
        5000
    )
end)

-- DRAW MARKER

RegisterCommand('testMarker1', function()
    CreateThread(function()
        local start = GetGameTimer()
        while GetGameTimer() < (start + 10000) do
            local playerCoordinates = GetEntityCoords(PlayerPedId())
            DrawMarker(
                6, --TYPE
                playerCoordinates.x,
                playerCoordinates.y,
                playerCoordinates.z,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0,
                1.0,
                1.0,
                0,
                0,
                250,
                180,
                true,
                true,
                2
            )
            Wait(0)
        end
    end)
end)

-- TESTSUBTITLE

function showSubtitle(message, duration)
    print("Showing subtitle")
    BeginTextCommandPrint('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandPrint(duration, true)
end

RegisterCommand('testSubtitle', function(_, args, rawCommand)
    showSubtitle(rawCommand, 5000)
end)
