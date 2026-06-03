function onUpdate(elapsed)
    if curStep >= 0 then
        -- Get the song position and calculate the beat-based movement
        local songPos = getSongPosition()
        local currentBeat = (songPos / 1000) * (bpm / 80)
        
        -- Calculate the new Y position
        -- 300 is the base Y, 110 is the amplitude (how far he moves)
        local newY = -110 - 110 * math.sin((currentBeat * 0.1) * math.pi)
        
        -- Use setProperty instead of a tween for frame-by-frame updates
        setProperty('dad.y', newY)
    end
end