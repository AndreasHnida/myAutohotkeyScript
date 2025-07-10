#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

GroupAdd, AdobeMMButton, ahk_exe Photoshop.exe
GroupAdd, AdobeMMButton, ahk_exe InDesign.exe
GroupAdd, AdobeMMButton, ahk_exe Illustrator.exe
GroupAdd, AdobeMMButton, ahk_exe AcroRD32.exe
GroupAdd, AdobeMMButton, ahk_exe Acrobat.exe
GroupAdd, AdobeMMButton, ahk_exe Muse.exe
;for every Adobe app where you want to use this trick


; If window is Adobe, Use middle button as an equivalent of hand tool
#IfWinActive ahk_group AdobeMMButton
    MButton::
    Send {Space Down}{LButton Down}
    Keywait, MButton
    Send {LButton Up}{Space Up}
    Return
#IfWinActive

#IfWinNotActive, ahk_exe VirtualBoxVM.exe
	Capslock::Esc
	Esc::Capslock
	Return	
#IfWinNotActive

+!q::send !{f4}

#b::
	run, "C:\Program Files\Mozilla Firefox\firefox.exe"
	Return

#t::Right
	run,  "C:\Program Files\Alacritty\alacritty.exe"
	Return

;!m:: 	
;	WinMinimize, A
;	Return
      

#Persistent
#SingleInstance Force

SetTitleMatchMode RegEx
CoordMode, Mouse, Screen

; Constants
kShift := 0x4
kControl := 0x8
kNone := 0x0

#h::  ; Windows key + H
WinGet, activeID, ID, A  ; Get the active window's ID
WinMinimize, ahk_id %activeID%  ; Minimize the active window
return

!+2::WinMaximize, A  ; Ctrl+Up
return

+^#c::
    ; Check if Terminal is already running
    Process, Exist, WindowsTerminal.exe
    If (ErrorLevel) {
        ; If running, check if the qutebrowser window is visible
        IfWinExist, ahk_exe WindowsTerminal.exe
        {
            ; If the window is visible, minimize it
            IfWinActive, ahk_exe WindowsTerminal.exe
            {
                WinMinimize, ahk_exe WindowsTerminal.exe
                return
            }
            ; If the window is not active, activate it
            WinActivate, ahk_exe WindowsTerminal.exe
        }
    } else {
        ; If not running, run qutebrowser
        Run, C:\Program Files\qutebrowser\WindowsTerminal.exe
    }
    ; Wait for the qutebrowser window to appear
    WinWait, ahk_exe WindowsTerminal.exe
    WinSet, AlwaysOnTop, On, ahk_exe WindowsTerminal.exe
    ; Set the window width to 400px
    ; WinMove, ahk_exe WindowsTerminal.exe,, 0, 0, 400, A
return

+#t::
    ; Check if qutebrowser is already running
    Process, Exist, WindowsTerminal.exe
    If (ErrorLevel) {
        ; If running, check if the qutebrowser window is visible
        IfWinExist, ahk_exe WindowsTerminal.exe
        {
            ; If the window is visible, minimize it
            IfWinActive, ahk_exe WindowsTerminal.exe
            {
                WinMinimize, ahk_exe WindowsTerminal.exe
                return
            }
            ; If the window is not active, activate it
            WinActivate, ahk_exe WindowsTerminal.exe
        }
    } else {
        ; If not running, run qutebrowser
        Run, C:\Program Files\qutebrowser\WindowsTerminal.exe
    }
    ; Wait for the qutebrowser window to appear
    WinWait, ahk_exe WindowsTerminal.exe
    WinSet, AlwaysOnTop, On, ahk_exe WindowsTerminal.exe
    ; Set the window width to 400px
    ; WinMove, ahk_exe WindowsTerminal.exe,, 0, 0, 400, A
return

+^b::
    ; Check if qutebrowser is already running
    Process, Exist, opera.exe
    If (ErrorLevel) {
        ; If running, check if the qutebrowser window is visible
        IfWinExist, ahk_exe opera.exe
        {
            ; If the window is visible, minimize it
            IfWinActive, ahk_exe opera.exe
            {
                WinMinimize, ahk_exe opera.exe
                return
            }
            ; If the window is not active, activate it
            WinActivate, ahk_exe opera.exe
        }
    } else {
        ; If not running, run qutebrowser
        Run, opera.exe
    }
    ; Wait for the qutebrowser window to appear
    WinWait, ahk_exe opera.exe
    WinSet, AlwaysOnTop, Off, ahk_exe opera.exe
    ; Set the window width to 400px
    ; WinMove, ahk_exe opera.exe 0, 0, 400, A
return


^+m::  ; Strg + Shift + M

Process, Exist, Spark Desktop.exe
if (ErrorLevel) {
    
    if WinExist("ahk_exe Spark Desktop.exe") {
        
        if WinActive("ahk_exe Spark Desktop.exe") {
            WinMinimize, ahk_exe Spark Desktop.exe
        } else {
            WinActivate, ahk_exe Spark Desktop.exe
        }

    }

} else {

    Run, "C:\Users\User\AppData\Local\Programs\SparkDesktop\Spark Desktop.exe"
}

WinWait, ahk_exe Spark Desktop.exe
WinSet, AlwaysOnTop, Off, ahk_exe Spark Desktop.exe

return



+^Space::
    ; Check if qutebrowser is already running
    Process, Exist, WindowsTerminal.exe
    If (ErrorLevel) {
        ; If running, check if the qutebrowser window is visible
        IfWinExist, ahk_exe WindowsTerminal.exe
        {
            ; If the window is visible, minimize it
            IfWinActive, ahk_exe WindowsTerminal.exe
            {
                WinMinimize, ahk_exe WindowsTerminal.exe
                return
            }
            ; If the window is not active, activate it
            WinActivate, ahk_exe WindowsTerminal.exe
        }
    } else {
        ; If not running, run qutebrowser
        Run, WindowsTerminal.exe
    }
    ; Wait for the qutebrowser window to appear
    WinWait, ahk_exe WindowsTerminal.exe
    WinSet, AlwaysOnTop, Off, ahk_exe WindowsTerminal.exe
    ; Set the window width to 400px
     WinMove, ahk_exe WindowsTerminal.exe 0, 0, 400, A
return

+^L::
    ; Check if Logseq is already running
    Process, Exist, Logseq.exe
    If (ErrorLevel) {
        ; If running, check if the qutebrowser window is visible
        IfWinExist, ahk_exe Logseq.exe
        {
            ; If the window is visible, minimize it
            IfWinActive, ahk_exe Logseq.exe
            {
                WinMinimize, ahk_exe Logseq.exe
                return
            }
            ; If the window is not active, activate it
            WinActivate, ahk_exe Logseq.exe
        }
    } else {
        ; If not running, run Logseq.exe
        Run, C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Logseq\Logseq
    }
    ; Wait for the logseq.exe window to appear
    WinWait, ahk_exe Logseq.exe
    WinSet, AlwaysOnTop, Off, ahk_exe Logseq.exe
    ; Set the window width to 400px
     WinMove, ahk_exe Logseq.exe 0, 0, 400, A
return

;; Verschiebt das aktive Fenster von Monitor 1 auf Monitor 2 und maximiert es
+!3::
    MoveWindowToMonitor(2)
return

;; Verschiebt das aktive Fenster von Monitor 2 auf Monitor 1 und maximiert es
+!1::
    MoveWindowToMonitor(1)
return

MoveWindowToMonitor(targetMonitor) {
    WinGet, hwnd, ID, A  ; Aktives Fenster holen
    if (!hwnd)
        return
    
    SysGet, monCount, MonitorCount
    if (monCount < 2)
        return
    
    WinGetPos, x, y, w, h, ahk_id %hwnd%
    SysGet, mon1, Monitor, 1
    SysGet, mon2, Monitor, 2
    
    if (targetMonitor = 2) {
        newX := mon2Left := mon2Left
        newY := mon2Top := mon2Top
    } else {
        newX := mon1Left := mon1Left
        newY := mon1Top := mon1Top
    }
    
    WinMove, ahk_id %hwnd%, , newX, newY, w, h  ; Fenster verschieben
    WinMaximize, ahk_id %hwnd%  ; Fenster maximieren
}

^+h:: ; STRG+SHIFT+H
WinMinimize, A
return
