local initialPosX = -800
local initialPosY = -650

function onCreate()

makeLuaSprite('0', 'stages/center/0', initialPosX, initialPosY)
setProperty('0.antialiasing')
addLuaSprite('0', false)

makeLuaSprite('1', 'stages/center/1', initialPosX, initialPosY)
setScrollFactor('1', 0.1, 1)
setProperty('1.antialiasing')
addLuaSprite('1', false)

makeLuaSprite('2', 'stages/center/2', initialPosX, initialPosY)
setScrollFactor('2', 0.3, 1)
setProperty('2.antialiasing')
addLuaSprite('2', false)

makeLuaSprite('4', 'stages/center/4', initialPosX, initialPosY)
setScrollFactor('4', 0.5, 1)
setProperty('4.antialiasing')
addLuaSprite('4', false)

makeLuaSprite('5', 'stages/center/5', initialPosX, initialPosY)
setProperty('5.antialiasing')
addLuaSprite('5', false)

makeLuaSprite('6', 'stages/center/6', initialPosX, initialPosY)
setProperty('6.antialiasing')
addLuaSprite('6', true)

makeLuaSprite('7', 'stages/center/7', initialPosX, initialPosY)
setProperty('7.antialiasing')
addLuaSprite('7', true)
end
