function onCreate()
    --variables
   Dodged = false;
    canDodge = false;
    DodgeTime = 0;
   
    precacheImage('danger');
   precacheSound('hit');
   precacheSound('preAttack');
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" then
    --Get Dodge time
    DodgeTime = (value1);
   
    --Make Dodge Sprite
   makeLuaSprite('danger', 'danger', 0, 0);
   setObjectCamera('danger', 'other');
    scaleObject('danger', 1, 1);
        playSound('preAttack', 0.7);
    addLuaSprite('danger', true); 
    if value2 == '1' then
      characterPlayAnim('dad', 'attack', true)
    end
   --Set values so you can dodge
   canDodge = true;
   runTimer('Died', DodgeTime);
   
   end
end

function onUpdate()
   if canDodge == true and keyJustPressed('space') then
   
   Dodged = true;
   playSound('hit', 0.7);
   characterPlayAnim('boyfriend', 'dodge', true);
   setProperty('boyfriend.specialAnim', true);
   removeLuaSprite('danger', true);
   canDodge = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0);
   
   elseif tag == 'Died' and Dodged == true then
   Dodged = false
   
   end
end