local initialPosX = -750
local initialPosY = -650

function onCreate()
makeLuaSprite('0', 'stages/train/0', initialPosX, initialPosY)
scaleObject('0', 1, 1)
addLuaSprite('0', false)

makeAnimatedLuaSprite('bfstage', 'stages/train/bf', 900, 300)
addAnimationByPrefix('bfstage', 'idle', 'bf idle', 12, false)
addAnimationByPrefix('bfstage', 'left', 'bf left', 12, false)
addAnimationByPrefix('bfstage', 'up', 'bf up', 12, false)
addAnimationByPrefix('bfstage', 'down', 'bf down', 12, false)
addAnimationByPrefix('bfstage', 'right', 'bf right', 12, false)
addAnimationByPrefix('bfstage', 'miss', 'bf miss', 12, true)
addAnimationByPrefix('bfstage', 'angry', 'bf angry', 12, true)
setProperty('bfstage.antialiasing', false)
addLuaSprite('bfstage')

makeAnimatedLuaSprite('bgeffect', 'stages/train/bg', initialPosX, initialPosY + 300)
addAnimationByPrefix('bgeffect', 'anim', 'bg anim', 6, true)
setScrollFactor('bgeffect', 0, 0)
setProperty('bgeffect.alpha', 0)
playAnim('bgeffect', 'anim')
addLuaSprite('bgeffect')

makeLuaSprite('2', 'stages/train/2', initialPosX, initialPosY)
scaleObject('2', 1, 1)
addLuaSprite('2', true)
end

function onUpdate()
triggerEvent("Screen Shake", "0.1, 0.002", "")
end