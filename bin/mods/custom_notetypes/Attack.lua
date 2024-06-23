function onCreate()
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

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Attack' then
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
end
end