local shaderName = "chroma"

function onCreate()
    precacheImage('flash')
    precacheImage('static')
    precacheImage('void')
    addCharacterToList('memory', 'dad')
    addCharacterToList('george', 'gf')
    --setGraphicSize('dad', -0.5, -0.5)

    makeAnimatedLuaSprite('flash', 'static', 0, 0);
    addAnimationByPrefix('flash', 'static', 'static', 24, true);
    objectPlayAnimation('flash', 'static', true);
    setBlendMode('flash', 'add');
    addLuaSprite('flash', true);

    doTweenAlpha('flashtween', 'flash', 0.1, 0.01, linear)
    doTweenAlpha('funnytween', 'amongus', 0.1, 0.01, linear)

    makeLuaSprite('amongus', 'void', 0, 0);
    setScrollFactor('amongus', 0.9, 0.9)
    scaleObject('amongus', 1, 1);
    addLuaSprite('amongus', false);

    if not getPropertyFromClass('ClientPrefs', 'lowQuality') then
        shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

        makeLuaSprite("tempShader0")
    
        runHaxeCode([[
            var shaderName = "]] .. shaderName .. [[";
            
            game.initLuaShader(shaderName);
            
            var shader0 = game.createRuntimeShader(shaderName);
            game.camGame.setFilters([new ShaderFilter(shader0)]);
            game.getLuaObject("tempShader0").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        ]])
    end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
            spr.__cacheBitmapColorTransform = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
        ]])
        temp()
    end
end

function onStepHit()
    if curStep == 260 then
        setBlendMode('flash', 'normal');
        doTweenAlpha('flashtween', 'flash', 1, 1, linear)
        doTweenAlpha('funnytween', 'amongus', 1, 1, linear)
    end
    if curStep == 272 then
        doTweenAlpha('flashtween', 'flash', 0, 0.5, linear)
        doTweenAlpha('funnytween', 'amongus', 0, 0.5, linear)
    end

end
