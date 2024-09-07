; Settings | 0 = false (off), 1 = true (on)
Enabled = 0
ShouldLock = 1

; Enable Hotkey
XButton2::
    if (Enabled := not Enabled)
        SetTimer, Main, -1
return

; Mouse Lock Hotkey
Insert::
    ShouldLock := not ShouldLock
    Gosub, CheckShouldLock
return

; Safeguard Exit Hotkey
End:: ExitApp

; Functionality (Only edit if you know what you're doing)

CheckShouldLock:
    if ShouldLock
        if Enabled {
            BlockInput, MouseMove
            MouseGetPos, MouseX, MouseY
        }
        else
            BlockInput, MouseMoveOff
    else
        BlockInput, MouseMoveOff
return

Main:
    Gosub, CheckShouldLock

    while Enabled {
        if ((WinExist("Roblox") and WinActive("Roblox")) or not WinExist("Roblox")) {
            if ShouldLock
                Click, %MouseX% %MouseY%
            else
                Click
        }
        else {
            Enabled = 0
        }

        Sleep, 10
    }

    Gosub, CheckShouldLock
return
