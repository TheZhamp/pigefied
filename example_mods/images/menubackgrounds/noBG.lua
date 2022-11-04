function onCreate()
    --sussy death
    setPropertyFromClass('GameOverSubstate', 'characterName', 'beef');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'no');

    -- background shit
    makeLuaSprite('amongus', 'evilBG', 0, 0);
    setLuaSpriteScrollFactor('amongus', 0.9, 0.9);
    scaleObject('amongus', 2, 0);

    addLuaSprite('amongus', false);
    
    close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end