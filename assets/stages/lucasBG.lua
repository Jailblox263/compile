function onCreate()

    makeLuaSprite('lucasbg','lucasbg',-680,-330)
	addLuaSprite('lucasbg',false)
	setLuaSpriteScrollFactor('lucasbg', 0, 0)
    scaleObject('lucasbg', 1.9, 1.9);
    addGlitchEffect('lucasbg', 2, 2, 0.1);

    makeLuaSprite('lucasbaseplate','lucasbaseplate', -800, 600)
	addLuaSprite('lucasbaseplate',false)
	setLuaSpriteScrollFactor('lucasbaseplate', 1, 1)
    scaleObject('lucasbaseplate', 2.5, 2.5);

end
