/*
Features:
- Auto Clicker
- Auto Skill
- Auto Hatch
- Stops if roblox window is closed
- Mouse locked while enabled
*/

; Optimizations (Ignore)

#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input

; Settings

; 0 = false (off), 1 = true (on)
Enabled = 0
AutoClickerEnabled = 1
AutoSkillEnabled = 1
HatchEnabled = 0

SkillSlot = 2 ; Recommended skill: Tempest Blade Barrage
SkillCooldown = 9000 ; Account for full mp regen

LastSkillUse = 0

; Hotkeys (Replace the text before the double colons (example::) with your keybind)

; Enable Hotkey
XButton2::
    if (Enabled := not Enabled)
        SetTimer, Main, -1
return

; Auto Hatch Hotkey
XButton1:: HatchEnabled := not HatchEnabled

; Auto Clicker Hotkey
Insert:: AutoClickerEnabled := not AutoClickerEnabled

; Auto Skill Hotkey
Delete:: AutoSkillEnabled := not AutoSkillEnabled

; Safeguard Exit Hotkey
End:: ExitApp

; Functionality (Only edit if you know what you're doing)

Main:
    Clicked = 0
    BlockInput, MouseMove
    MouseGetPos, MouseX, MouseY

    while Enabled {
        if WinActive("Roblox") {
            if HatchEnabled
                Send, r

            if (A_TickCount - LastSkillUse > SkillCooldown and AutoSkillEnabled) {
                if (Clicked)
                    Sleep, 500
                Send, %SkillSlot%
                LastSkillUse := A_TickCount
            }
            else if AutoClickerEnabled {
                Click, %MouseX% %MouseY%
                Clicked = 1
            }
        }
        else {
            Enabled = 0
        }

        Sleep, 10
    }

    BlockInput, MouseMoveOff
return
