local floatHeight = 180 -- How high/low they float
local floatSpeed = 0.4   -- How fast they move

function onUpdate(elapsed)
    local songPos = getSongPosition()
    local currentBeat = (songPos / 1000) * (bpm / 60)
    
    -- Calculate the vertical shift
    local yOffset = math.sin(currentBeat * floatSpeed) * floatHeight
    
    -- Loop through all 8 notes
    for i = 0, 7 do
        -- We use defaultPlayerStrumY0 as the base for all (it's the same for Opponent)
        setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 + yOffset)
    end
end