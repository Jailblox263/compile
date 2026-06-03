local defaultNotePos = {};
local spin = true;
local modchartX = 200;
local modchartY = 30;

function onSongStart()
    for i = 0, 7 do
        local x = getPropertyFromGroup('strumLineNotes', i, 'x')
        local y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x, y})
    end
end

function onUpdate(elapsed)
    -- currentBeat is a global variable in Psych Engine
    if spin == true and #defaultNotePos > 0 then
        for i = 0, 7 do 
            -- We use i + 1 because Lua tables are 1-indexed
            local targetX = defaultNotePos[i + 1][1] + modchartX * math.sin((getSongPosition() / 1000 + i * 1.10) * math.pi)
            local targetY = defaultNotePos[i + 1][2] + modchartY * math.sin((getSongPosition() / 1000 + i * 1.40) * math.pi)
            
            setPropertyFromGroup('strumLineNotes', i, 'x', targetX)
            setPropertyFromGroup('strumLineNotes', i, 'y', targetY)
        end
    end
end