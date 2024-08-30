; Settings | 0 = false (off), 1 = true (on)
Enabled = 0

; Enable Hotkey
XButton2::
    if (Enabled := not Enabled)
        SetTimer, Main, -1
return

; Safeguard Exit Hotkey
End:: ExitApp

; Functionality (Only edit if you know what you're doing)

Main:
    while Enabled {
        if WinActive("Roblox") {
            Click
            Send, {e down}
            Sleep, 500
            Send, {e up}
        }
        else {
            Enabled = 0
        }

        Sleep, 10
    }
return