-- OBSAssustant.lua
-- based on Game Name by TwystNeko (twystneko@gmail.com)
-- 
-- outputs a sanitized game name to a text file, also copies marquee for OBS use.
-- This really needs to be sanitized a bit more...

local exports = {}
exports.name = "obsassistant"
exports.version = "1.0.0"
exports.description = "OBSAssistant"
exports.license = "WTFPL license"
exports.author = { name = "firehawke@gmail.com" }
local gamename = exports
local images = 1

function exists(filename)
    local file=io.open(string.format('%s', filename),"r")
    if file~=nil then
        io.close(file)
        return true
    else
        return false
    end
end

function gamename.startplugin() 
    emu.register_start(function() 
        title = emu.romname();
        parent = manager.machine.system.parent
        output = emu.gamename();
				setname = emu.gamename();
				
        if output ~= 'No Driver Loaded' then
            
            if emu.softname() ~= "" then
                for name, dev in pairs(manager.machine.images) do
                    if dev.software_lonoutputame ~= nil then
                        output = output .. "\n" .. "Running: " .. dev.software_lonoutputame
                        break
                    end
                end
            end
            
            file = io.open("gamename.txt", "w");
            file:write(output);
            file:close();
						print("[OBSAssistant] - Set name is " .. title)
						if parent ~= "0" then
						            print("[OBSAssistant] - Parent set name is " .. parent)
						end
            if exists(string.format('H:\\Support\\MAME\\marquees\\%s.png', title)) then
                print("[OBSAssistant] - Copying Marquee: " .. string.format('H:\\Support\\MAME\\marquees\\%s.png to C:\\StreamTools\\Shared Images\\marquee.png', title)) 
                os.execute(string.format('@copy /Y "H:\\Support\\MAME\\marquees\\%s.png" "C:\\StreamTools\\Shared Images\\marquee.png" 2>nul', title))
						elseif exists(string.format('H:\\Support\\MAME\\marquees\\%s.png', parent)) then
                print("[OBSAssistant] - Copying Parent Marquee: " .. string.format('H:\\Support\\MAME\\marquees\\%s.png to C:\\StreamTools\\Shared Images\\marquee.png', parent)) 
                os.execute(string.format('@copy /Y "H:\\Support\\MAME\\marquees\\%s.png" "C:\\StreamTools\\Shared Images\\marquee.png" 2>nul', parent))
            end
            
        end
    end)
    
    emu.register_stop(function() 
        output = emu.gamename();	
        
        output = ""
        
        file = io.open("gamename.txt", "w");
        file:write(output);
        file:close();
            if exists(string.format('plugins\\obsassistant\\transparent-marquee.png')) then
								print("[OBSAssistant] - Restoring blank marquee")
                os.execute(string.format('@copy /Y "plugins\\obsassistant\\transparent-marquee.png" "C:\\StreamTools\\Shared Images\\marquee.png" 2>nul'))
						end
    end)
end

return exports