# OBSAssistant for MAME
A very hacky OBSAssistant plugin for MAME 0.236 and up, based on [GameName by TwystNeko](https://github.com/TwystNeko/MAME-gamename)

# Installation:

## Per-Machine Config

First, you need to make a few adjustments to the script depending on your computer's OS and where you keep your Marquees and OBS images.

1. Place the contents of this repo in ``MAMEDir\plugins\obsassistant``

2. Edit the init.lua file to change references of ``H:\\Support\\MAME\\marquees`` to wherever you have your marquee files stored.

3. Edit the init.lua file to change references of ``C:\\StreamTools\\Shared Images\\`` to where OBS will be looking for them; you'll be telling OBS to use that file as a image in your stream layout. In the current author's case, that would be ``C:\\StreamTools\\Shared Images\\marquee.png`` (escaping the backslashes because Lua) that OBS is looking for.

4. Lastly, if you're not on Windows, you'll want to change the ``@copy /Y`` instances to ``cp -f``

## Configure MAME

Then either:

1. edit ``MAMEdir\ini\plugin.ini``

2. Add:

``obsassistant   1``

or

1. edit ``MAMEDIR\mame.ini``

2. Change the line with plugin in the scripting options section to one of the following:

3A. If you already have plugins on the line, add obsassistant to the end like this:

``plugin                    cheat,autofire,cheatfind,hiscore,portname,obsassistant``

3B. Otherwise, make the line look like this:

``plugin                    obsassistant``

# Usage:

Assuming you've edited the ``init.lua`` file to match your filesystem (and changed the copy command if needed), you should now be able to restart MAME and see ``[OBSAssistant]`` comments pop up as you load MAME drivers.

It will output the game name to "MAMEDir\gamename.txt" and copy the associated marquee (or parent set marquee if THAT exists and the set doesn't have one) for OBS to use.

When you exit, it will copy the transparent-marquee.png file over the marquee file so that OBS doesn't get grumpy about a referenced image file being missing in action on the next time you load OBS.

# Example console output:

```
C:\Emu\mame-indev>mame.exe sfzj
Warning: layout view 'Inst_Card_JPN' contains deprecated bezel element
Warning: layout view 'Inst_Card_JPN' contains deprecated bezel element
[OBSAssistant] - Set name is sfzj
[OBSAssistant] - Parent set name is sfa
[OBSAssistant] - Copying Parent Marquee: H:\Support\MAME\marquees\sfa.png to C:\StreamTools\Shared Images\marquee.png
        1 file(s) copied.
[OBSAssistant] - Restoring blank marquee        
        1 file(s) copied.

C:\Emu\mame-indev>
```
