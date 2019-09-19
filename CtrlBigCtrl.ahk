
#SingleInstance force

path_script = %A_ScriptDir%\BigCtrl.ahk 

Startup:
  WinWaitActive, emacs 
  {
    ; Run real bigctrl.ahk when emacs get focus.
    Run %A_AhkPath% %path_script%
    Goto, Closeit
  }

Closeit:
  WinWaitNotActive, emacs 
  {
    ; Kill real bigctrl.ahk when emacs lose focus.
    DetectHiddenWindows, On
    IfWinExist, %path_script%
    {
      WinClose, %path_script% ahk_class AutoHotkey
    }
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

#include Launch.ahk 
