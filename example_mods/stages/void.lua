function onCreate()
    setObjectOrder('dadGroup', 1);
    setObjectOrder('boyfriendGroup', 3);

    setPropertyFromClass('GameOverSubstate', 'characterName', 'beef');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'no');
    -- background shit
    makeAnimatedLuaSprite('void', 'vile/void', -600, -50)
    setLuaSpriteScrollFactor('void', 0.8, 0.8);
    addAnimationByPrefix('void', 'voididle', 'voidIdle', 24, true);
    objectPlayAnimation('void', 'voididle', true);
    scaleObject('void', 1.1, 1.1);

    addLuaSprite('void', false);

    makeAnimatedLuaSprite('floor', 'vile/floor', -500, 850)
    setLuaSpriteScrollFactor('floor', 0.9, 0.9);
    addAnimationByPrefix('floor', 'flooridle', 'floorIdle', 24, true);
    objectPlayAnimation('floor', 'flooridle', true);
    setObjectOrder('floor', getObjectOrder('boyfriendGroup')) 
    addLuaSprite('floor', false);
    
    close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end