
#SingleInstance force

pathToScript = %A_ScriptDir%\bigctrl\BigCtrl.ahk 

Startup:
  WinWaitActive, emacs 
  {
    ; WinMaximize  ; Maximizes the Notepad window found by IfWinActive above.
    run, %pathToScript%
    Goto, Closeit
    ; return
  }

Closeit:
  WinWaitNotActive, emacs 
  {
    DetectHiddenWindows, On
    IfWinExist, %pathToScript%
    {
      ; WinWait, %pathToScript%,
      ; IfWinNotActive, %pathToScript%, , WinActivate, %pathToScript%,
        ; WinWaitActive, %pathToScript%,
      WinClose, %pathToScript% ahk_class AutoHotkey
      ; MsgBox "OK"
    }
    ; run, taskkill /f /im BigCtrl.ahk,,hide
    Goto, Startup
  }

IfWinActive, emacs
{
  Goto, Startup
}
else
{
  Goto, Closeit 
}


^!BS::ExitApp ; Suspend script with Ctrl+Alt+S

; BEGIN:
;   WinGetActiveTitle, emacs 
;   If WINTITLE = Program Manager
;   {
;     Goto, BEGIN
;   }
;   WinWaitNotActive, %WINTITLE%
;   IfWinNotActive, %WINTITLE%
;   {
;     WinClose, %WINTITLE%
;     WinWaitClose, %WINTITLE%
; }
; Goto, BEGIN