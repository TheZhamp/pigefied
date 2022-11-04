function onCreate()
    --sussy death
    setPropertyFromClass('GameOverSubstate', 'characterName', 'beef');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'beefDead');

    -- background shit
    makeLuaSprite('emptyBG', 'emptyBG', -900, -500);
    setLuaSpriteScrollFactor('emptyBG', 0.9, 0.9);
    scaleObject('emptyBG', 3, 2.3);

    addLuaSprite('emptyBG', false);
    
    close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end