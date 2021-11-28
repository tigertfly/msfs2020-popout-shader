;
; MSFS2020 Popup Dimmer using AutoHotkey. This script creates a shaded
; non-interactive overlay on your screen as specified in the coordinates
; at the bottom of this script. it responds to Ctrl-Shift-[+.-] and 
; Ctrl-Shift-[numbers] where number 1 is most dimmed, and 0 means no 
; dimming at all, and 2-9 are varying brightness in between.
;
; 1. Get AutoHotkey from https://www.autohotkey.com/ or from the Windows
;    package manager from commandline: winget install "AutoHotkey Store Edition"
;
; 2. Save this script somewhere like C:\AutoHotkeyScripts\ and edit the
;    screen coordinates (see "EDIT" below) to where you put your poput 
;    window. Save.
;
; 3. Right click the script and choose "run script", which starts AutoHotkey
;    and places it in the task bar icon tray area. Test that it works ()
;
; 4. Optionally set up MobiFlight to either generate Ctrl-Shift-plus/minus
;    keystrokes from an encoder, or tie it to a potentiometer.
;
;    Potentiometer is a bit more involved because we can only send one
;    keystroke regardless of the potentiometer value currently. Thus we 
;    need to add several lines and only match the correct potentiometer
;    value for each. A mcc file is provided as an example.
;    

#Persistent
#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Destroy
intensity:=50 ; should be middle ground (0-100 percent multiplier)
minimum:=150   ;(transparency of the overlay, 0 = totally black, 255 = no darkening)
maximum:=255

; Ctrl - Shift - plus
+^+::
intensity+=10
If intensity>100
   intensity:=100
GoSub Overlay
Return

; Ctrl - Shift - minus
+^-::
intensity-=10
if intensity<10
  intensity:=10
GoSub Overlay
Return

; Individual values to access from the Mobiflight potentiometer..
; I know this could likely be defined in a loop, but I got other
; things to worry about, this works.

; set 10%
+^1::
intensity:=10
GoSub Overlay
Return

; set 20%
+^2::
intensity:=20
GoSub Overlay
Return

; set 30%
+^3::
intensity:=30
GoSub Overlay
Return

; set 40%
+^4::
intensity:=40
GoSub Overlay
Return

; set 50%
+^5::
intensity:=50
GoSub Overlay
Return

; set 60%
+^6::
intensity:=60
GoSub Overlay
Return

; set 70%
+^7::
intensity:=70
GoSub Overlay
Return

; set 80%
+^8::
intensity:=80
GoSub Overlay
Return

; set 90%
+^9::
intensity:=90
GoSub Overlay
Return

; set 100%
+^0::
intensity:=100
GoSub Overlay
Return

; The actual window overlay is defined here..
Overlay:
; we calculate the 0-255 range for the overlay opacity first..
overlay_opacity := (100-intensity)/100 * (maximum-minimum)

Gui, FMS: Default
Gui, Color, 0x000000 ; Color to black
Gui, +LastFound +AlwaysOnTop -Caption +E0x20 ; Click through GUI always on top.
WinSet, Transparent, %overlay_opacity% ; Set intensity first based on the time of dday
; EDIT your coordinates here. The first two are X,Y of your external monitor top left in the
; virtual desktop space (my monitor is ultrawide, thus huge horizontal value)
Gui, FMS:Show, x3200 y1200 w640 h480, Overlay ; FMC on second monitor

; if you want another one
;Gui, Whatever: Default
;Gui, Color, 0x000000 ; Color to black
;Gui, +LastFound +AlwaysOnTop -Caption +E0x20 ; Click through GUI always on top.
;WinSet, Transparent, %overlay_opacity% ; Set intensity first based on the time of dday
;Gui, Whatever:Show, x800 y200 w640 h480, Overlay ; FMC on second monitor

return


