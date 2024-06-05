local Changed = false
local canChange = false

local themPosX = 1100
local playerPosX = 770

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
	
	makeAnimatedLuaSprite('them', 'them', 1000, 100)
	addAnimationByPrefix('them', 'emily', 'them emily', 1, true)
	addAnimationByPrefix('them', 'bf', 'them bf', 1, true)
	playAnim('them', 'bf')
	setProperty('them.x', themPosX - 70)
	setProperty('them.y', 100 + 140)
	scaleObject('them', 1, 1)
	addLuaSprite('them')
	setProperty('them.alpha', 0.8)

end

function onEvent(n, v1, v2)
	if n == "changeChar" then
	canChange = true
	doTweenAlpha('warnAlpha1', 'warn', 1, 0.15)
	doTweenX('warnSize1', 'warn.scale', 1, 0.3, 'circOut')
	doTweenY('warnSize2', 'warn.scale', 1, 0.3, 'circOut')
	runTimer('Died', 0.7)
	playSound('press', 1)
	end
end

function onUpdate()
   if canChange == true and keyboardJustPressed('SPACE') and boyfriendName == 'emily' then
	doTweenAlpha('warnAlpha2', 'warn', 0, 0.7)
	setProperty('splash.alpha', 1)
	doTweenAlpha('splash0', 'splash', 0, 0.3)
	playAnim('splash', 'splash')
	doTweenX('warnSize3', 'warn.scale', 1.5, 1, 'circOut')
	doTweenY('warnSize4', 'warn.scale', 1.5, 1, 'circOut')
   triggerEvent("Change Character", "BF", "bf2")
   
   setProperty('boyfriend.x', playerPosX + 115)
   setProperty('them.x', themPosX - 115)
   doTweenX('swapcooltween_0', 'boyfriend', playerPosX, 0.5, 'circOut')
   doTweenX('swapcooltween_1', 'them', themPosX + 30, 0.5, 'circOut')
   
	playAnim('them', 'emily')
	setProperty('them.y', 100 - 60)
   playSound('pressed', 1)
   Changed = true
   canChange = false
   
   elseif canChange == true and keyboardJustPressed('SPACE') and boyfriendName == 'bf2' then
	doTweenAlpha('warnAlpha3', 'warn', 0, 0.7)
	setProperty('splash.alpha', 1)
	doTweenAlpha('splash1', 'splash', 0, 0.3)
	playAnim('splash', 'splash')
	doTweenX('warnSize5', 'warn.scale', 1.5, 1, 'circOut')
	doTweenY('warnSize6', 'warn.scale', 1.5, 1, 'circOut')
   triggerEvent("Change Character", "BF", "emily")
   
   setProperty('boyfriend.x', playerPosX + 115)
   setProperty('them.x', themPosX - 115)
   doTweenX('swapcooltween_2', 'boyfriend', playerPosX, 0.5, 'circOut')
   doTweenX('swapcooltween_3', 'them', themPosX - 70, 0.5, 'circOut')

	playAnim('them', 'bf')
	setProperty('them.y', 100 + 140)
   playSound('pressed', 1)
   Changed = true
   canChange = false

   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Changed == false then
   setProperty('health', 0)
   setProperty('warn.alpha', 0)
   elseif tag == 'Died' and Changed == true then
   Changed = false
   end
end