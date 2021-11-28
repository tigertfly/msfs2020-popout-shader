# MSFS 2020 popout shader


MSFS2020 Popup Dimmer using AutoHotkey. This script creates a shaded
non-interactive overlay on your screen as specified in the coordinates
at the bottom of this script. it responds to Ctrl-Shift-[+.-] and
Ctrl-Shift-[numbers] where number 1 is most dimmed, and 0 means no
dimming at all, and 2-9 are varying brightness in between.

 1. Get AutoHotkey from https://www.autohotkey.com/ or from the Windows
    package manager from commandline: winget install "AutoHotkey Store Edition"

 2. Save this script somewhere like C:\AutoHotkeyScripts\ and edit the
    screen coordinates (multiple monitors virtual size) to where you
    put your poput window. Save.

 3. Right click the script and choose "run script", which starts AutoHotkey
    and places it in the task bar icon tray area. Test that it works ()

 4. Set up MobiFlight to either generate Ctrl-Shift-plus/minus keystrokes
    from an encoder, or tie it to a potentiometer.

    Potentiometer is a bit more involved because we can only send one
    keystroke. Thus we need to create several input

