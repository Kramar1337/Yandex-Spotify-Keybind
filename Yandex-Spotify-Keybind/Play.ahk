/*
Суть скрипта:
Перебиндить мультимедийные клавиши: Media_Play_Pause, Media_Next, Media_Prev



Расширение для Spotify
https://chrome.google.com/webstore/detail/spotify-player/bhdjjppbnlpjpeicimhemencfgjeldoa
Расширение для Яндекс.Музыка
https://chrome.google.com/webstore/detail/яндексмузыка-управление-п/gcfheefljlblchcfjlknidfimnfillec
*/



;Режим по умолчанию 1 - Media_Play, 2 - GUI
PlayMode = 1

;Play - Pause
key_PlayPause = XButton2

;Одиночный клик - Next, двойной клик - Prev
key_Next = XButton1



#NoEnv
#SingleInstance force
DetectHiddenWindows, On
SendMode Input
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
SetWinDelay, -1
SetTitleMatchMode, 2
CommandLine := DllCall("GetCommandLine", "Str")
If !(A_IsAdmin || RegExMatch(CommandLine, " /restart(?!\S)")) {
    Try {
        If (A_IsCompiled) {
            Run *RunAs "%A_ScriptFullPath%" /restart
        } Else {
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
        }
    }
    ExitApp
}
Menu,Tray, NoStandard
Menu,Tray, DeleteAll
Menu,Tray, add, KeyMode 1 (Classic), LabelPlayModeToggle1
Menu,Tray, add, KeyMode 2 (GUI), LabelPlayModeToggle2
Menu,Tray, add, KeyOff, LabelPlayModeToggle3
Menu,Tray, add
Menu,Tray, add, Exit, LabelExitApp
Menu,Tray, Default, Exit
Menu, Tray, Icon, Shell32.dll, 145
PlayModeToggle = 0
if (PlayMode = 1)
{
	Hotkey,%key_PlayPause%, LabelPlayPause, on
	Hotkey,%key_Next%, LabelNext, on
	ToolTip, 1 = Mode, % A_ScreenWidth // 2, % A_ScreenHeight // 2
	Sleep 500
	ToolTip
}
if (PlayMode = 2)
{
	Hotkey,%key_PlayPause%, LabelPlayPause, off
	Hotkey,%key_Next%, LabelNext, off
	ToolTip, 2 = Mode, % A_ScreenWidth // 2, % A_ScreenHeight // 2
	Sleep 500
	ToolTip
}
; Установка размеров и позиции кнопок
ButtonWidth := 64
ButtonHeight := 64
ButtonMargin := 1
GuiWidth := ButtonWidth + 2 * ButtonMargin
GuiHeight := 3 * ButtonHeight + 4 * ButtonMargin
GuiX := 0  ; Позиция слева
GuiY := (A_ScreenHeight - GuiHeight) // 2  ; По центру по вертикали
; Создание графического интерфейса
Gui, +LastFound +AlwaysOnTop -Caption +hwndNewhwnd
Gui, Color, White
Gui, Font, s10
; Рассчет позиций кнопок
Button1Y := ButtonMargin
Button2Y := 2 * ButtonMargin + ButtonHeight
Button3Y := 3 * ButtonMargin + 2 * ButtonHeight
; Создание кнопок
Gui, Add, Button, hWndhButton1 x%ButtonMargin% y%Button1Y% w%ButtonWidth% h%ButtonHeight% gNextTrack, %A_Space%
Gui, Add, Button, hWndhButton2 x%ButtonMargin% y%Button2Y% w%ButtonWidth% h%ButtonHeight% gPausePlay, %A_Space%
Gui, Add, Button, hWndhButton3 x%ButtonMargin% y%Button3Y% w%ButtonWidth% h%ButtonHeight% gPrevTrack, %A_Space%
; Установка иконок для кнопок
SetButtonIcon(hButton1, "imageres.dll", 252)
SetButtonIcon(hButton2, "imageres.dll", 281)
SetButtonIcon(hButton3, "imageres.dll", 256)
Gui, Show, x%GuiX% y%GuiY% w%GuiWidth% h%GuiHeight% Hide, KramPlayer
Return

; Gui метки
NextTrack:
    Send {Media_Next}
Return
PausePlay:
    Send {Media_Play_Pause}
Return
PrevTrack:
    Send {Media_Prev}
Return

; Функция рисования
SetButtonIcon(hButton, File, Index, Size := 64) {
    hIcon := LoadPicture(File, "h" . Size . " Icon" . Index, _)
    SendMessage 0xF7, 1, %hIcon%,, ahk_id %hButton% ; BM_SETIMAGE
}

;============================Метка, Play - Pause
LabelPlayPause:
if (PlayMode = 1)
{
	SendInput {Media_Play_Pause}
}
return

;============================Метка, Next - Prev
#UseHook, Off
LabelNext:
  ffP1ause_=300
  If not ffSecond1
  {
    ffSecond1=1
    SetTimer, ffFle1DoublePress, -%ffP1ause_%
  }
  Else
  {
    ffSecond1=0
    SetTimer, ffmetkammkli2, -1
  }
Return
ffFle1DoublePress:
  If not ffSecond1
    Return
  ffSecond1=0
  SetTimer, ffmetkammkli1, -1
Return
#UseHook, On
ffmetkammkli1:
	if (PlayMode = 1)
	{
		SendInput {Media_Next}
	}
	if (PlayMode = 2)
	{
		SendInput {Media_Next}
	}
Return
ffmetkammkli2:
	if (PlayMode = 1)
	{
		SendInput {Media_Prev}
	}
	if (PlayMode = 2)
	{
		SendInput {Media_Prev}
	}
Return


; Трей меню метки
LabelPlayModeToggle1:
PlayModeToggle = 1
goto LabelPlayModeToggle
Return
LabelPlayModeToggle2:
PlayModeToggle = 2
goto LabelPlayModeToggle
Return
LabelPlayModeToggle3:
PlayModeToggle = 3
goto LabelPlayModeToggle
Return
LabelExitApp:
Exitapp
return

;============================Метка, переключения режима
LabelPlayModeToggle:
if (PlayModeToggle = 1)
{
	PlayMode = 1
	Hotkey,%key_PlayPause%, LabelPlayPause, on
	Hotkey,%key_Next%, LabelNext, on
	Gui, hide
	ToolTip, 1 = Mode
	Sleep 500
	ToolTip
}
if (PlayModeToggle = 2)
{
	PlayMode = 3
	Hotkey,%key_PlayPause%, LabelPlayPause, off
	Hotkey,%key_Next%, LabelNext, off
	Gui, Show
	WinSet, Transparent, 100, ahk_id %Newhwnd%
	ToolTip, 3 = Mode
	Sleep 500
	ToolTip
}
if (PlayModeToggle = 3)
{
	Hotkey,%key_PlayPause%, LabelPlayPause, off
	Hotkey,%key_Next%, LabelNext, off
	Gui, hide
	ToolTip, 3 = Mode
	Sleep 500
	ToolTip
}
Return

; На будущее
; ControlGet,GetOutputVar,Hwnd,,Chrome_RenderWidgetHostHWND1,Яндекс Музык
; ControlFocus,,ahk_id %GetOutputVar%
; Sleep, 1
; ControlSend,Chrome_RenderWidgetHostHWND1,{K},Яндекс Музык 	;K - пауза

