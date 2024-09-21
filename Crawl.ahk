; Settings
Enabled := false

; Enable Hotkey
XButton2::
    if (Enabled := not Enabled)
        SetTimer, Main, -1
return

; Safeguard Exit Hotkey
End:: ExitApp

; Functionality (Only edit if you know what you're doing)

Main:
    Click Down
    while Enabled {
        if WinActive("Roblox") {
            Send, er
        }
        else {
            Enabled := false ; 0
        }

        Sleep, 10
    }
    Click Up
return