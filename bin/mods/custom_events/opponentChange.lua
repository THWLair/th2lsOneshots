precacheSound('pressed')

local theirPosX = -200
local oppPosX = 0

function onCreate()		
	makeAnimatedLuaSprite('themAgain', 'themAgain', 0, 100)
	addAnimationByPrefix('themAgain', 'bella', 'themAgain bella', 1, true)
	addAnimationByPrefix('themAgain', 'cris', 'themAgain cris', 1, true)
	
	playAnim('themAgain', 'cris')
	setProperty('themAgain.x', theirPosX + 20)
	setProperty('themAgain.y', 100 + 250)
	
	scaleObject('themAgain', 1, 1)
	addLuaSprite('themAgain')
	setProperty('themAgain.alpha', 0.8)
end

function onEvent(n, v1, v2)
	if n == "opponentChange" then
   if dadName == 'bella' then
   triggerEvent("Change Character", "dad", "cris")
   playSound('pressed', 1)
   setProperty('dad.x', oppPosX - 115)
   setProperty('themAgain.x', theirPosX + 115)
   doTweenX('swapcooltween_0', 'dad', oppPosX, 0.5, 'circOut')
   doTweenX('swapcooltween_1', 'themAgain', theirPosX, 0.5, 'circOut')

	playAnim('themAgain', 'bella')
	setProperty('themAgain.y', 100 - 60)
   
   elseif dadName == 'cris' then
   triggerEvent("Change Character", "dad", "bella")
   playSound('pressed', 1)
   setProperty('dad.x', oppPosX - 115)
   setProperty('themAgain.x', theirPosX + 115)
   doTweenX('swapcooltween_2', 'dad', oppPosX, 0.5, 'circOut')
   doTweenX('swapcooltween_3', 'themAgain', theirPosX + 20, 0.5, 'circOut')

	playAnim('themAgain', 'cris')
	setProperty('themAgain.y', 100 + 250)

	
	end
end
end