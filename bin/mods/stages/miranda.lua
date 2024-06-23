local initialPosX = -800
local initialPosY = -650

function onCreate()

makeLuaSprite('0', 'stages/miranda/0', initialPosX, initialPosY)
setProperty('0.antialiasing')
addLuaSprite('0', false)

makeLuaSprite('2', 'stages/miranda/2', initialPosX, initialPosY)
setScrollFactor('2', 0.6, 1)
setProperty('2.antialiasing')
addLuaSprite('2', false)

makeLuaSprite('3', 'stages/miranda/3', initialPosX, initialPosY)
setScrollFactor('3', 0.8, 1)
setProperty('3.antialiasing')
addLuaSprite('3', false)

makeLuaSprite('5', 'stages/miranda/5', initialPosX, initialPosY)
setProperty('5.antialiasing')
addLuaSprite('5', false)

makeLuaSprite('4', 'stages/miranda/4', initialPosX, initialPosY + 50)
setProperty('4.antialiasing')
addLuaSprite('4', false)

makeLuaSprite('6', 'stages/miranda/6', initialPosX, initialPosY)
setProperty('6.antialiasing')
addLuaSprite('6', false)

makeLuaSprite('7', 'stages/miranda/7', initialPosX, initialPosY)
setProperty('7.antialiasing')
addLuaSprite('7', true)
end
