local initialPosX = -800
local initialPosY = -650

function onCreate()

makeLuaSprite('0', 'stages/party/0', initialPosX, initialPosY)
setProperty('0.antialiasing')
addLuaSprite('0', false)

makeAnimatedLuaSprite('1', 'stages/party/public', initialPosX, initialPosY)
addAnimationByPrefix('1', 'idle', 'public idle', 12, false)
setProperty('1.antialiasing')
addLuaSprite('1', false)

makeLuaSprite('2', 'stages/party/2', initialPosX, initialPosY)
setProperty('2.antialiasing')
addLuaSprite('2', true)

makeAnimatedLuaSprite('screen', 'stages/party/screen', initialPosX, initialPosY)
addAnimationByPrefix('screen', 'off', 'screen off', 2, true)
addAnimationByPrefix('screen', 'go', 'screen go', 2, true)
addAnimationByPrefix('screen', 'press', 'screen press', 2, true)
addAnimationByPrefix('screen', 'pressed', 'screen pressed', 2, true)
addAnimationByPrefix('screen', 'yellow', 'screen yellow', 2, true)
addAnimationByPrefix('screen', 'bestgf', 'screen bestgf', 2, true)
addAnimationByPrefix('screen', 'uhyea', 'screen uhyea', 2, true)
addAnimationByPrefix('screen', 'boring', 'screen boring', 2, true)
setProperty('screen.antialiasing')
addLuaSprite('screen', false)
playAnim('screen', 'off')

makeLuaSprite('4', 'stages/party/4', initialPosX, initialPosY)
setScrollFactor('4', 0.8, 1)
setProperty('4.antialiasing')
addLuaSprite('4', true)

makeLuaSprite('5', 'stages/party/5', initialPosX, initialPosY)
setScrollFactor('5', 0.6, 1)
setProperty('5.antialiasing')
addLuaSprite('5', true)
end

function onBeatHit()
	if curBeat % 2 == 0 then
playAnim('1', 'idle')
	end
end
