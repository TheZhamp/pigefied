function onCreate()
    -- background shit
    makeAnimatedLuaSprite('houseanimated','house', -500, -300)
    addAnimationByPrefix('houseanimated','dance','House',24,false)
    setScrollFactor('houseanimated', 1.0, 1.0);

    makeLuaSprite('dark', 'dark', -400, 0);
    setLuaSpriteScrollFactor('dark', 1.0, 1.0);
    scaleObject('dark', 10, 10);

    addLuaSprite('houseanimated', false);
	addLuaSprite('dark', false);
    
    --close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onBeatHit()
    if math.random(1, 3) == 3 then
        objectPlayAnimation('houseanimated','dance',false)
    end
end