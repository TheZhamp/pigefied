function onCreate()

    -- background shit
    makeLuaSprite('metroBG', 'metroBG', -480, -450);
    setLuaSpriteScrollFactor('metroBG', 1.0, 1.0);
    scaleObject('metroBG', 1.22, 1.22)

	addLuaSprite('metroBG', false);
    
    close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end