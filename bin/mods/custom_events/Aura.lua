local Hurtd = false
local canAttack = false

function onCreate()
	makeAnimatedLuaSprite('aura', 'attacks/aura', -200, -200)
	addAnimationByPrefix('aura', 'idle', 'aura idle', 24, true)
	addLuaSprite('aura')
	
	makeAnimatedLuaSprite('fire', 'attacks/fireM', 600, 250)
	addAnimationByPrefix('fire', 'anim', 'fireM anim', 10, false)
	scaleObject('fire', 1, 1)
	setProperty('fire.scale.x', -1)
	addLuaSprite('fire')
	setProperty('fire.alpha', 0)

	makeAnimatedLuaSprite('ball', 'attacks/ball', 700, 250)
	addAnimationByPrefix('ball', 'idle', 'ball idle', 2, true)
	addAnimationByPrefix('ball', 'hit', 'ball anim', 10, false)
	playAnim('ball', 'idle')
	scaleObject('ball', 1, 1)
	addLuaSprite('ball', true)
	setProperty('ball.alpha', 0)
end

function onSongStart()
doTweenAlpha('hud1', 'camHUD', 0, 55)
end

function onEvent(n, v1, v2)
	if n == "Aura" then
	doTweenAlpha('aura_a', 'aura', 0, 1)
	canAttack = true
	end
end

function onUpdate()
	if canAttack == true and keyboardJustPressed('SPACE') then
	cancelTween('hud1')
	cancelTween('hud3')
	setProperty('camHUD.alpha', 1)
	doTweenAlpha('aura_again', 'aura', 1, 1)
	Hurtd = true
	canAttack = false
	triggerEvent("Play Animation", "hurt", "dad")
	triggerEvent("Play Animation", "attack", "bf")
	runTimer('ballTimer', 0.06)
	playSound('ball_attack', 0.6)
	setProperty('fire.alpha', 1)
	setProperty('ball.alpha', 1)
	playAnim('fire', 'anim')
	setProperty('ball.x', 700)
	doTweenX('ballX', 'ball', 200, 0.05)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'ballTimer' then
playAnim('ball', 'hit')
doTweenAlpha('hud3', 'camHUD', 0, 55)
end
end