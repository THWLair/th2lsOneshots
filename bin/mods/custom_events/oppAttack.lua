local Dodged = false
local canDodge = false

precacheImage('spacebar')
precacheSound('press')
precacheSound('pressed')

function onCreate()	
	makeLuaText('warn', 'PRESS SPACE!', 0, 840, 200)
	setTextSize('warn', 50)
	setTextBorder('warn', 5, 'FF0000')
	setObjectCamera('warn', 'hud')
	addLuaText('warn')
	setProperty('warn.alpha', 0)
	
	makeAnimatedLuaSprite('splash', 'splash', 880, 130)
	addAnimationByPrefix('splash', 'splash', 'splash', 10, false)
	setObjectCamera('splash', 'hud')
	scaleObject('splash', 0.7, 0.7)
	setProperty('splash.alpha', 0)
	addLuaSprite('splash', true)
	
	makeAnimatedLuaSprite('magic', 'attacks/iceM', 400, 250)
	addAnimationByPrefix('magic', 'anim', 'iceM anim', 10, false)
	scaleObject('magic', 1, 1)
	addLuaSprite('magic', true)
	setProperty('magic.alpha', 0)

	makeAnimatedLuaSprite('ice', 'attacks/iceA', 400, 250)
	addAnimationByPrefix('ice', 'idle', 'iceA idle', 10, true)
	addAnimationByPrefix('ice', 'break', 'iceA break', 10, false)
	scaleObject('ice', 1, 1)
	addLuaSprite('ice', true)
	setProperty('ice.alpha', 0)

end

function onEvent(n, v1, v2)
	if n == "oppAttack" then
	triggerEvent("Play Animation", "attack", "Dad")
	setProperty('magic.alpha', 1)
	setProperty('ice.alpha', 1)
	setProperty('ice.x', 400)
	playAnim('magic', 'anim')
	playAnim('ice', 'idle')
	playSound('ice_attack', 1)
	doTweenX('iceX', 'ice', 750, 0.4)
	canDodge = true
	doTweenAlpha('warnAlpha1', 'warn', 1, 0.15)
	doTweenX('warnSize1', 'warn.scale', 1, 0.3, 'circOut')
	doTweenY('warnSize2', 'warn.scale', 1, 0.3, 'circOut')
	runTimer('Died', 0.5)
	playSound('press', 1)
	end
end

function onUpdate()
   if canDodge == true and keyboardJustPressed('SPACE') then
	setProperty('splash.alpha', 1)
	playAnim('ice', 'break')
	playSound('ice_break', 1)
	doTweenAlpha('splash0', 'splash', 0, 0.3)
	playAnim('splash', 'splash')
	doTweenX('warnSize3', 'warn.scale', 1.5, 1, 'circOut')
	doTweenY('warnSize4', 'warn.scale', 1.5, 1, 'circOut')
	doTweenAlpha('warnAlpha2', 'warn', 0, 0.7)
   playSound('pressed', 1)
   Dodged = true
   canDodge = false
   playAnim('boyfriend', 'dodge')

   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0)
   setProperty('warn.alpha', 0)
   elseif tag == 'Died' and Dodged == true then
   Dodged = false
   end
end