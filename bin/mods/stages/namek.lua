local initialPosX = -600
local initialPosY = -350

function onCreate()

makeLuaSprite('0', 'stages/namek/bg', initialPosX, initialPosY)
scaleObject('0', 4, 4)
setProperty('0.antialiasing')
addLuaSprite('0', false)

makeLuaSprite('1', 'stages/namek/geto', 500, 300)
setProperty('1.antialiasing')
addLuaSprite('1', false)
end
