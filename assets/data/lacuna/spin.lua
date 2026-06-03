local currentTurn = 0 -- The starting angle
local turnSpeed = 10000 -- How fast it turns

function onUpdate(elapsed)
    -- This adds to the turn every frame
    currentTurn = currentTurn + (turnSpeed * elapsed)

    for i = 0, 7 do
        setPropertyFromGroup('strumLineNotes', i, 'angle', currentTurn)
    end
end