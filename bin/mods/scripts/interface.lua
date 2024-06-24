local miss = 0
local hp = 5
local heal = 0
local hPos0 = 110
local hPos1 = 150
local hPos2 = 190
local hPos3 = 230
local hPos4 = 270

function onCreate()

makeLuaSprite('border', 'ui/border', 0, 0)
scaleObject('border', 1.4, 1.4)
setObjectCamera('border', 'hud')
addLuaSprite('border', false)

makeLuaSprite('base', 'ui/base', hPos0, 835)
setObjectCamera('base', 'hud')
addLuaSprite('base', false)

makeLuaSprite('base1', 'ui/base', hPos1, 835)
setObjectCamera('base1', 'hud')
addLuaSprite('base1', false)

makeLuaSprite('base2', 'ui/base', hPos2, 835)
setObjectCamera('base2', 'hud')
addLuaSprite('base2', false)

makeLuaSprite('base3', 'ui/base', hPos3, 835)
setObjectCamera('base3', 'hud')
addLuaSprite('base3', false)

makeLuaSprite('base4', 'ui/base', hPos4, 835)
setObjectCamera('base4', 'hud')
addLuaSprite('base4', false)

makeAnimatedLuaSprite('hp', 'hp', hPos0, 835)
addAnimationByPrefix('hp', 'hp', 'hp idle', 12, true)
setObjectCamera('hp', 'hud')
playAnim('hp', 'idle')
addLuaSprite('hp', true)

makeAnimatedLuaSprite('hp1', 'hp', hPos1, 835)
addAnimationByPrefix('hp1', 'hp', 'hp idle', 12, true)
setObjectCamera('hp1', 'hud')
playAnim('hp1', 'idle')
addLuaSprite('hp1', true)

makeAnimatedLuaSprite('hp2', 'hp', hPos2, 835)
addAnimationByPrefix('hp2', 'hp', 'hp idle', 12, true)
setObjectCamera('hp2', 'hud')
playAnim('hp2', 'idle')
addLuaSprite('hp2', true)

makeAnimatedLuaSprite('hp3', 'hp', hPos3, 835)
addAnimationByPrefix('hp3', 'hp', 'hp idle', 12, true)
setObjectCamera('hp3', 'hud')
playAnim('hp3', 'idle')
addLuaSprite('hp3', true)

makeAnimatedLuaSprite('hp4', 'hp', hPos4, 835)
addAnimationByPrefix('hp4', 'hp', 'hp idle', 12, true)
setObjectCamera('hp4', 'hud')
playAnim('hp4', 'idle')
addLuaSprite('hp4', true)


makeLuaText('lives', 'HP:', 0, 40, 840)
setTextSize('lives', 40)
setTextBorder('lives', 5, '000000')
setObjectCamera('lives', 'hud')
addLuaText('lives')

makeLuaSprite('drain', 'ui/drain', 0, 0)
scaleObject('drain', 1.35, 1.35)
setObjectCamera('drain', 'hud')
addLuaSprite('drain', true)
setProperty('drain.alpha', 0)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	heal = heal + 1
	setProperty('health', 10)
	
	if heal > 8 and hp == 4 then
	heal = 0
	hp = hp + 1
	setProperty('drain.alpha', 0)
	playSound('heal', 4)
	doTweenAlpha('base4_1', 'base4', 1, 0.5, 'bounceOut')
	
	elseif heal > 8 and hp == 3 then
	heal = 0
	hp = hp + 1
	setProperty('drain.alpha', 0.2)
	playSound('heal', 4)
	doTweenAlpha('base3_1', 'base3', 1, 0.5, 'bounceOut')
	
	elseif heal > 8 and hp == 2 then
	heal = 0
	hp = hp + 1
	setProperty('drain.alpha', 0.4)
	playSound('heal', 4)
	doTweenAlpha('base2_1', 'base2', 1, 0.5, 'bounceOut')
	
	elseif heal > 8 and hp == 1 then
	heal = 0
	hp = hp + 1
	setProperty('drain.alpha', 0.8)
	playSound('heal', 4)
	doTweenAlpha('base1_1', 'base1', 1, 0.5, 'bounceOut')
end
end

function noteMiss(id, direction, noteType, isSustainNote)
playSound('hurt', 4)     
     heal = 0
    if hp == 5 then
    doTweenAlpha('base4_0', 'base4', 0, 0.5, 'bounceOut')
	hp = hp - 1
	setProperty('drain.alpha', 0.2)
	playSound('miss', 0.5)
    elseif hp == 4 then
    doTweenAlpha('base3_0', 'base3', 0, 0.5, 'bounceOut')
	hp = hp - 1
	setProperty('drain.alpha', 0.4)
	playSound('miss', 0.5)
    elseif hp == 3 then
    doTweenAlpha('base2_0', 'base2', 0, 0.5, 'bounceOut')
	hp = hp - 1
	setProperty('drain.alpha', 0.8)
	playSound('miss', 0.5)
    elseif hp == 2 then
    doTweenAlpha('base1_0', 'base1', 0, 0.5, 'bounceOut')
	hp = hp - 1
	setProperty('drain.alpha', 1)
	playSound('miss', 0.5)
	elseif hp == 1 then
	hp = hp - 1
end 
end

function onUpdate()
if hp == 0 then
setProperty('health', 0)
end
end
function onCountdownStarted()
for i = 0, getProperty('unspawnNotes.length') - 1 do
setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
end
end
