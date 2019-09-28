; -----------------------------------------------------------------
; Declare Your hotkeys in this section
; -----------------------------------------------------------------
;  ---- these are samples ----
#F2::ToggleWindowHide("- Mozilla Firefox") - Win + J
;  #c::ToggleWindow("SecureCRT")         - Win + C
;  !x::ToggleWindow("cmd.exe")           - Alt + X 

; -----------------------------------------------------------------
; Function for toggling windows - Do not edit
; -----------------------------------------------------------------
ToggleWindow(TheWindowTitle)
{
    SetTitleMatchMode,2
    DetectHiddenWindows, Off
    IfWinActive, %TheWindowTitle%
    {
        WinMinimize, %TheWindowTitle%
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
                WinShow
                WinActivate
            }
        }
    }
}

ToggleWindowHide(TheWindowTitle)
{
	SetTitleMatchMode,2
	DetectHiddenWindows, Off
	IfWinActive, %TheWindowTitle%
	{
		WinMinimize, %TheWindowTitle%
		WinHide, %TheWindowTitle%
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
				WinShow
				WinActivate
			}
		}
	}
}
