function onCreate()
    -- background shit
    makeLuaSprite('houseBG', 'houseBG', -350, -500);
    setLuaSpriteScrollFactor('houseBG', 1.0, 1.0);

	addLuaSprite('houseBG', false);
    
    close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end