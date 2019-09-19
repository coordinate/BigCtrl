
;==================Code Below==================================================
;===========================================================================
; Run a program or switch to it if already running.
;     Target - Program to run. E.g. Calc.exe or C:/Progs/Bobo.exe
;     WinTitle - Optional title of the window to activate. Programs like
;        MS Outlook might have multiple windows open (main window and email
;        windows). This parm allows activating a specific window.
;
;Original Source comes from forum on http://www.autohotkey.com
;Optimized by alongside (http://hi.baidu.com/alongside) @ 2007-04-26
; ===========================================================================
RunOrActivate(Target)
{
    ; Get the filename without a path
    ;SplitPath, Target, TargetNameOnly
	Process, Exist, emacs.exe
    If ErrorLevel > 0
       PID = %ErrorLevel%
    Else
       Run, %Target%, , , PID 

	SetTitleMatchMode, 2
	IfWinActive, emacs
	{
		WinMinimize, emacs
		WinWaitNotActive, emacs
	}
	else
	{
		WinWait, emacs, , 3
		WinActivate, emacs
	}
} 
Return 

<#Tab::RunOrActivate("D:\home\emacs-26.3-x86_64\bin\runemacs.exe") 