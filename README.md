# OBSAssistant for MAME
A very hacky OBSAssistant plugin for MAME 0.236 and up

# Installation:

1. Place the contents of this repo in MAMEDir\plugins\obsassistant
2. Edit the init.lua file to change references of "H:\\Support\\MAME\\marquees" to wherever you have your marquee files stored.
3. Edit the init.lua file to change references of "C:\\StreamTools\\Shared Images\\" to where OBS will be looking for them; you'll be telling OBS to use that file as a image in your stream layout. In the current author's case, that would be "C:\\StreamTools\\Shared Images\\marquee.png" (escaping the backslashes because Lua) that OBS is looking for.

Then either:

* edit MAMEdir\ini\plugin.ini 
* Add:
* obsassistant   1

or

* edit MAMEDIR\mame.ini
* Change the line with plugin in the scripting options section to one of the following:
* If you already have plugins on the line, add obsassistant to the end like this:
* plugin                    cheat,autofire,cheatfind,hiscore,portname,obsassistant
* Otherwise, make the line look like this:
* plugin                    obsassistant

Now restart MAME and you should see [OBSAssistant] comments pop up as you load MAME drivers.

It will output the game name to "MAMEDir\gamename.txt" and copy the associated marquee (or parent set marquee if THAT exists and the set doesn't have one) for OBS to use.

When you exit, it will copy the transparent-marquee.png file over the marquee file so that OBS doesn't get grumpy about a referenced image file being missing in action on the next time you load OBS.