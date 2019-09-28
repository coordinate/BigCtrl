
ToggleWindowHide(TheWindowTitle, ExeFilePath, ProcessName=0)
{
  ; Get the filename without a path
  If !ProcessName
    SplitPath, ExeFilePath, ProcessName
  Process, Exist, %ProcessName%
  If ErrorLevel > 0
  {
    PID = %ErrorLevel%
  }
  Else
  {
    Run, %ExeFilePath%, , , PID 
  }
  SetTitleMatchMode,2
  DetectHiddenWindows, Off
  IfWinActive, %TheWindowTitle%
  {
    ; WinMinimize, %TheWindowTitle%
    WinHide, %TheWindowTitle%
    WinWaitNotActive, %TheWindowTitle%
  }
  Else
  {
    IfWinExist, %TheWindowTitle%
      WinActivate
    Else
    {
      DetectHiddenWindows, On
      IfWinExist, %TheWindowTitle%
      {
        WinShow, %TheWindowTitle%
        WinWait, %TheWindowTitle%, , 3
        WinActivate
      }
    }
  }
}

<#Tab::ToggleWindowHide("emacs", "D:\home\emacs-26.3-x86_64\bin\runemacs.exe", "emacs.exe")
<#F1::ToggleWindowHide("- Mozilla Firefox", "D:/Program Files/Mozilla Firefox/firefox.exe", "firefox.exe")
<#F2::ToggleWindowHide("Chrome", "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe", "chrome.exe")



; Emacs(Target)
; {
;   ; Get the filename without a path
;   ;SplitPath, Target, TargetNameOnly
; 	Process, Exist, emacs.exe
;     If ErrorLevel > 0
;        PID = %ErrorLevel%
;     Else
;        Run, %Target%, , , PID 

; 	SetTitleMatchMode, 2
; 	IfWinActive, emacs
; 	{
; 		;WinMinimize, emacs
; 		WinHide
;     WinWaitNotActive, emacs
; 	}
; 	else
; 	{
;     WinShow, emacs
; 		WinWait, emacs, , 3
; 		WinActivate, emacs
; 	}
; } 
; Return 
; <#Tab::Emacs("D:\home\emacs-26.3-x86_64\bin\runemacs.exe") 