; https://superuser.com/a/1819950/881662

#SingleInstance Force
#InstallKeybdHook


; Disable win + l key locking (This line must come before any hotkey assignments in the .ahk file)


RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 1


; Optional: Remap winKey + <someKey> here:


; #space::return

#r::
Reload
return
#+r::
RunWait, komorebic reload-configuration, , Hide
return
#+c::  ; This listens for Win + Shift + C
WinClose, A  ; Close the active window
return

; Launch Wezterm with Win + T
#t::
Run, "wezterm-gui"  ; Replace "path_to_wezterm_executable" with the actual path to the Wezterm executable
return
#+e::
Run, "explorer"  ; Replace "path_to_wezterm_executable" with the actual path to the Wezterm executable
return


; Manipulate windows
#f::
RunWait, komorebic toggle-float, , Hide
return
#m::
RunWait, komorebic toggle-monocle, , Hide
return
#e::
RunWait, komorebic retile, , Hide
return

#h::
RunWait, komorebic resize-axis horizontal decrease, , Hide
return
#l::
RunWait, komorebic resize-axis horizontal increase, , Hide
return

; Jumping Between Windows
#j::
RunWait, komorebic cycle-focus previous, , Hide
return
#k::
RunWait, komorebic cycle-focus next, , Hide
return

#+h::
RunWait, komorebic move left, , Hide
return
#+j::
RunWait, komorebic move down, , Hide
return
#+k::
RunWait, komorebic move up, , Hide
return
#+l::
RunWait, komorebic move right, , Hide
return
#+return::
RunWait, komorebic promote, , Hide
return

; Toggling Workspaces
#1::
RunWait, komorebic focus-workspace 0, , Hide
return
#2::
RunWait, komorebic focus-workspace 1, , Hide
return
#3::
RunWait, komorebic focus-workspace 2, , Hide
return
#4::
RunWait, komorebic focus-workspace 3, , Hide
return
#5::
RunWait, komorebic focus-workspace 4, , Hide
return

; Moving Workspaces
#+1::
RunWait, komorebic move-to-workspace 0, , Hide
return
#+2::
RunWait, komorebic move-to-workspace 1, , Hide
return
#+3::
RunWait, komorebic move-to-workspace 2, , Hide
return
#+4::
RunWait, komorebic move-to-workspace 3, , Hide
return
#+5::
RunWait, komorebic move-to-workspace 4, , Hide
return

; Multi-Monitor Setup
#,::
RunWait, komorebic cycle-monitor previous, , Hide
return
#.::
RunWait, komorebic cycle-monitor next, , Hide
return
#+,::
RunWait, komorebic cycle-move-to-monitor previous, , Hide
return
#+.::
RunWait, komorebic cycle-move-to-monitor next, , Hide
return


;CTRL+WIN+L
^F12::
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 0
DllCall("LockWorkStation")
;after locking workstation force a reload of this script which effectively disables Win + L locking the computer again
Reload
