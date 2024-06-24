local Dodged = false
local canDodge = false

function onCreate()			
	makeAnimatedLuaSprite('light', 'attacks/light', -100, 100)
	addAnimationByPrefix('light', 'anim', 'light idle', 20, true)
	addLuaSprite('light', true)
	playAnim('light', 'idle')
	setProperty('light.alpha', 0)
	
	makeAnimatedLuaSprite('magic', 'attacks/iceM', 850, 50)
	addAnimationByPrefix('magic', 'anim', 'iceM anim', 10, false)
	setProperty('magic.scale.x', -1)
	addLuaSprite('magic')
	setProperty('magic.alpha', 0)

	makeAnimatedLuaSprite('explosion', 'attacks/explosion', 200, -200)
	addAnimationByPrefix('explosion', 'anim', 'explosion', 20, false)
	scaleObject('explosion', 0.7, 0.7)
	addLuaSprite('explosion')
	setProperty('explosion.alpha', 0)
end

function onEvent(n, v1, v2)
	if n == "counterattack" then
	playSound('electric_attack', 1)
	setProperty('light.x', -100)
	setProperty('light.y', 100)
	setProperty('ice.x', 400)
	triggerEvent("Camera Follow Pos", "600", "100")
	triggerEvent("Set Cam Zoom", "0.7", "")
	triggerEvent("Play Animation", "attack", "dad")
	doTweenAlpha('lightalpha', 'light', 1, 1)
	doTweenY('lighty', 'light', -100, 0.6, 'circOut')
	runTimer('atkAnim', 0.7)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'atkAnim' then
doTweenX('lightx1', 'light', 900, 0.5, 'circIn')
canDodge = true
runTimer('Died', 0.5)
end

if tag == 'Died' and Dodged == false then
setProperty('health', 0)
elseif tag == 'Died' and Dodged == true then
Dodged = false

end
end

function onUpdate()
   if canDodge == true and keyboardJustPressed('SPACE') then
Dodged = true
canDodge = false
triggerEvent("Play Animation", "freeze", "bf")
triggerEvent("Play Animation", "hurt", "dad")
triggerEvent("Screen Shake", "0.2, 0.01", "0.2, 0.01")
playSound('explosion', 1)
playSound('ice_attack', 1)
triggerEvent("Camera Follow Pos", " ", " ")
triggerEvent("Set Cam Zoom", "0.8", "")
end

if Dodged == true then
setProperty('explosion.alpha', 1)
setProperty('magic.alpha', 1)
setProperty('light.alpha', 0)
playAnim('magic', 'anim')
playAnim('explosion', 'anim')

end
end