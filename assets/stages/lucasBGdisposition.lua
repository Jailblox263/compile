function onCreate()

    makeLuaSprite('lucasbgdisposition','lucasbgdisposition',-680,-330)
	addLuaSprite('lucasbgdisposition',false)
	setLuaSpriteScrollFactor('lucasbgdisposition', 0, 0)
    scaleObject('lucasbgdisposition', 1.9, 1.9);
    addGlitchEffect('lucasbgdisposition', 2, 2, 0.1);

    makeLuaSprite('lucasbaseplatedisposition','lucasbaseplatedisposition', -800, 600)
	addLuaSprite('lucasbaseplatedisposition',false)
	setLuaSpriteScrollFactor('lucasbaseplatedisposition', 1, 1)
    scaleObject('lucasbaseplatedisposition', 2.5, 2.5);
    addGlitchEffect('lucasbaseplatedisposition', 2, 10, 0.1);

end
