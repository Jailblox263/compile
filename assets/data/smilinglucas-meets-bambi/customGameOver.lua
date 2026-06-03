function onCreate()
setPropertyFromClass('GameOverSubstate', 'characterName', 'smilinglucas-dead') --Character json for death animation
setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'Emoji disintegrating') --put in mods/sounds/
setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver') --put in mods/music/
setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd') --put in mods/music/
end