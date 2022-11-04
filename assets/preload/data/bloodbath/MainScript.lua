function onCreate()
    cameraFlash('hud', '000000', 10, false);
    makeLuaSprite('socool', 'escaped', 0, 0)
    addLuaSprite('socool')
    doTweenAlpha('socooltween', 'socool', 0, 0.1, linear)
    setObjectCamera('socool', 'other')
    makeLuaSprite('socool2', 'black', 0, 0)
    addLuaSprite('socool2')
    doTweenAlpha('socooltween2', 'socool2', 0, 0.1, linear)
    setObjectCamera('socool2', 'hud')
end

function onStepHit()
    
    if curStep == 2048 then
        doTweenAlpha('socooltween2', 'socool2', 1, 1, linear)
        doTweenAlpha('cooltween', 'socool', 1, 1, linear)
        doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 5)
	    doTweenAlpha('AlphaTween2', 'healthBar', 0, 5)
	    doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 5)
	    doTweenAlpha('AlphaTween4', 'iconP1', 0, 5)
	    doTweenAlpha('AlphaTween5', 'iconP2', 0, 5)
	    doTweenAlpha('AlphaTween6', 'timeBar', 0, 5)
	    doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 5)
	    doTweenAlpha('AlphaTween8', 'timeTxt', 0, 5)
        doTweenAlpha('AlphaTween9', 'botplayTxt', 0, 5)
    end
end