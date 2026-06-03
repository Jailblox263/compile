function onUpdate(elapsed)
    -- This calculates the beat based on the song position
    local currentBeat = (getSongPosition() / 1000) * (bpm / 20)

    -- Screen center constant
    local centerX = (screenWidth / 2) - (157 / 2)

    -- Player Notes (4, 5, 6, 7)
    setPropertyFromGroup('strumLineNotes', 4, 'x', centerX + 2.9 * (math.sin((currentBeat * 0.25) + (0) * 2) * 175))
    setPropertyFromGroup('strumLineNotes', 5, 'x', centerX + 2.3 * (math.sin((currentBeat * 0.25) + (1) * 2) * 175))
    setPropertyFromGroup('strumLineNotes', 6, 'x', centerX + 2 * (math.sin((currentBeat * 0.25) + (2) * 2) * 175))
    setPropertyFromGroup('strumLineNotes', 7, 'x', centerX + 3 * (math.sin((currentBeat * 0.25) + (3) * 2) * 175))

    -- Opponent Notes (0, 1, 2, 3)
    setPropertyFromGroup('strumLineNotes', 0, 'x', centerX + 2.9 * (math.sin((currentBeat * 0.25) + (4) * 2) * 175))
    setPropertyFromGroup('strumLineNotes', 1, 'x', centerX + 2.7 * (math.sin((currentBeat * 0.25) + (5) * 2) * 175))
    setPropertyFromGroup('strumLineNotes', 2, 'x', centerX + 1.5 * (math.sin((currentBeat * 0.25) + (6) * 2) * 175))
    setPropertyFromGroup('strumLineNotes', 3, 'x', centerX + 3.1 * (math.sin((currentBeat * 0.25) + (7) * 2) * 175))
end