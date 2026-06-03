local turnvalue = 0

function onCreate()
	-- triggered when the lua file is started, some variables weren't created yet
end

function onBeatHit()

turnvalue = 0
if curBeat % 2 == 0 then
turnvalue = 0
end

setProperty('iconP2.angle',-turnvalue)
setProperty('iconP1.angle',turnvalue)

doTweenAngle('iconTween1','iconP1',0,crochet/222,'circOut')
doTweenAngle('iconTween2','iconP2',0,crochet/222,'circOut')

end