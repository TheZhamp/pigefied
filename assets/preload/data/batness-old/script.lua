--[[local ogX = getPropertyFromObject('dad', 'x');

function preHit()
	doTweenX('attackTween', 'dad', 1.5, 0.1, 'backOut');
end

function attack()
	--doTweenX('backTween', 'dad', -1.5, 0.1, 'backOut');
end

function onCreate()
	
end

function onStepHit()
	if curStep == 60 then
		preHit();
	end
	if curStep == 62 then
		attack();
	end
	
end]]