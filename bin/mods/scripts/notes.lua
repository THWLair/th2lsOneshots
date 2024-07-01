local notePos0 = 730
local notePos1 = 850
local notePos2 = 970
local notePos3 = 1090
local noteY = 30
local nAlpha = 1
local pAlpha = 0
local pixScale = 6

function onCreatePost()

if downscroll == true then
noteY = 800
end

if songName == 'Senpai' then
	nAlpha = 0
	pAlpha = 1
elseif songName == 'Roses' then
	nAlpha = 0
	pAlpha = 1
elseif songName == 'Thorns' then
	nAlpha = 0
	pAlpha = 1
end

-------------------------------------------------------------------- Arrows
	makeLuaSprite('arrow0', 'ui/left', notePos0 - 10, noteY)
	setObjectCamera('arrow0', 'hud')
	setProperty('arrow0.alpha', nAlpha)
	scaleObject('arrow0', 0.7, 0.7)
	addLuaSprite('arrow0', false)
	
	makeLuaSprite('arrow1', 'ui/down', notePos1 - 10, noteY)
	setObjectCamera('arrow1', 'hud')
	setProperty('arrow1.alpha', nAlpha)
	scaleObject('arrow1', 0.7, 0.7)
	addLuaSprite('arrow1', false)

	makeLuaSprite('arrow2', 'ui/up', notePos2 - 10, noteY)
	setObjectCamera('arrow2', 'hud')
	setProperty('arrow2.alpha', nAlpha)
	scaleObject('arrow2', 0.7, 0.7)
	addLuaSprite('arrow2', false)

	makeLuaSprite('arrow3', 'ui/right', notePos3 - 10, noteY)
	setObjectCamera('arrow3', 'hud')
	setProperty('arrow3.alpha', nAlpha)
	scaleObject('arrow3', 0.7, 0.7)
	addLuaSprite('arrow3', false)
	
-------------------------------------------------------------------- Opp Hit

	makeLuaSprite('opp0', 'ui/lOpp', notePos0 - 10, noteY)
	setObjectCamera('opp0', 'hud')
	setProperty('opp0.alpha', nAlpha)
	scaleObject('opp0', 0.7, 0.7)
	addLuaSprite('opp0', false)
	
	makeLuaSprite('opp1', 'ui/dOpp', notePos1 - 10, noteY)
	setProperty('opp1.alpha', nAlpha)
	setObjectCamera('opp1', 'hud')
	scaleObject('opp1', 0.7, 0.7)
	addLuaSprite('opp1', false)

	makeLuaSprite('opp2', 'ui/uOpp', notePos2 - 10, noteY)
	setProperty('opp2.alpha', nAlpha)
	setObjectCamera('opp2', 'hud')
	scaleObject('opp2', 0.7, 0.7)
	addLuaSprite('opp2', false)

	makeLuaSprite('opp3', 'ui/rOpp', notePos3 - 10, noteY)
	setProperty('opp3.alpha', nAlpha)
	setObjectCamera('opp3', 'hud')
	scaleObject('opp3', 0.7, 0.7)
	addLuaSprite('opp3', false)

-------------------------------------------------------------------- Note Hit
	makeLuaSprite('hit0', 'ui/lHit', notePos0 - 10, noteY)
	setProperty('hit0.alpha', nAlpha)
	setObjectCamera('hit0', 'hud')
	scaleObject('hit0', 0.7, 0.7)
	addLuaSprite('hit0', false)
	
	makeLuaSprite('hit1', 'ui/dHit', notePos1 - 10, noteY)
	setProperty('hit1.alpha', nAlpha)
	setObjectCamera('hit1', 'hud')
	scaleObject('hit1', 0.7, 0.7)
	addLuaSprite('hit1', false)

	makeLuaSprite('hit2', 'ui/uHit', notePos2 - 10, noteY)
	setProperty('hit2.alpha', nAlpha)
	setObjectCamera('hit2', 'hud')
	scaleObject('hit2', 0.7, 0.7)
	addLuaSprite('hit2', false)

	makeLuaSprite('hit3', 'ui/rHit', notePos3 - 10, noteY)
	setProperty('hit3.alpha', nAlpha)
	setObjectCamera('hit3', 'hud')
	scaleObject('hit3', 0.7, 0.7)
	addLuaSprite('hit3', false)

	doTweenAlpha('hTween0', 'hit0', 0, 1)
	doTweenAlpha('hTween1', 'hit1', 0, 1)
	doTweenAlpha('hTween2', 'hit2', 0, 1)
	doTweenAlpha('hTween3', 'hit3', 0, 1)

-------------------------------------------------------------------- Arrows Pix
	makeLuaSprite('arrow0Pix', 'ui/leftPix', notePos0 + 10, noteY + 10)
	setObjectCamera('arrow0Pix', 'hud')
	setProperty('arrow0Pix.antialiasing', false)
	setProperty('arrow0Pix.alpha', pAlpha)
	scaleObject('arrow0Pix', pixScale, pixScale)
	addLuaSprite('arrow0Pix', false)
	
	makeLuaSprite('arrow1Pix', 'ui/downPix', notePos1 + 10, noteY + 10)
	setProperty('arrow1Pix.antialiasing', false)
	setObjectCamera('arrow1Pix', 'hud')
	setProperty('arrow1Pix.alpha', pAlpha)
	scaleObject('arrow1Pix', pixScale, pixScale)
	addLuaSprite('arrow1Pix', false)

	makeLuaSprite('arrow2Pix', 'ui/upPix', notePos2 + 10, noteY + 10)
	setProperty('arrow2Pix.antialiasing', false)
	setObjectCamera('arrow2Pix', 'hud')
	setProperty('arrow2Pix.alpha', pAlpha)
	scaleObject('arrow2Pix', pixScale, pixScale)
	addLuaSprite('arrow2Pix', false)

	makeLuaSprite('arrow3Pix', 'ui/rightPix', notePos3 + 10, noteY + 10)
	setProperty('arrow3Pix.antialiasing', false)
	setObjectCamera('arrow3Pix', 'hud')
	setProperty('arrow3Pix.alpha', pAlpha)
	scaleObject('arrow3Pix', pixScale, pixScale)
	addLuaSprite('arrow3Pix', false)
	
-------------------------------------------------------------------- Opp Hit Pix

	makeLuaSprite('opp0Pix', 'ui/lOppPix', notePos0 - 15, noteY - 15)
	setProperty('opp0Pix.antialiasing', false)
	setProperty('opp0Pix.alpha', pAlpha)
	setObjectCamera('opp0Pix', 'hud')
	scaleObject('opp0Pix', pixScale, pixScale)
	addLuaSprite('opp0Pix', false)
	
	makeLuaSprite('opp1Pix', 'ui/dOppPix', notePos1 - 15, noteY - 15)
	setProperty('opp1Pix.antialiasing', false)
	setProperty('opp1Pix.alpha', pAlpha)
	setObjectCamera('opp1Pix', 'hud')
	scaleObject('opp1Pix', pixScale, pixScale)
	addLuaSprite('opp1Pix', false)

	makeLuaSprite('opp2Pix', 'ui/uOppPix', notePos2 - 15, noteY - 15)
	setProperty('opp2Pix.antialiasing', false)
	setProperty('opp2Pix.alpha', pAlpha)
	setObjectCamera('opp2Pix', 'hud')
	scaleObject('opp2Pix', pixScale, pixScale)
	addLuaSprite('opp2Pix', false)

	makeLuaSprite('opp3Pix', 'ui/rOppPix', notePos3 - 15, noteY - 15)
	setProperty('opp3Pix.antialiasing', false)
	setProperty('opp3Pix.alpha', pAlpha)
	setObjectCamera('opp3Pix', 'hud')
	scaleObject('opp3Pix', pixScale, pixScale)
	addLuaSprite('opp3Pix', false)

-------------------------------------------------------------------- Note Hit Pix
	makeLuaSprite('hit0Pix', 'ui/lHitPix', notePos0 - 15, noteY - 15)
	setProperty('hit0Pix.antialiasing', false)
	setProperty('hit0Pix.alpha', pAlpha)
	setObjectCamera('hit0Pix', 'hud')
	scaleObject('hit0Pix', pixScale, pixScale)
	addLuaSprite('hit0Pix', false)
	
	makeLuaSprite('hit1Pix', 'ui/dHitPix', notePos1 - 15, noteY - 15)
	setProperty('hit1Pix.antialiasing', false)
	setProperty('hit1Pix.alpha', pAlpha)
	setObjectCamera('hit1Pix', 'hud')
	scaleObject('hit1Pix', pixScale, pixScale)
	addLuaSprite('hit1Pix', false)

	makeLuaSprite('hit2Pix', 'ui/uHitPix', notePos2 - 15, noteY - 15)
	setProperty('hit2Pix.antialiasing', false)
	setProperty('hit2Pix.alpha', pAlpha)
	setObjectCamera('hit2Pix', 'hud')
	scaleObject('hit2Pix', pixScale, pixScale)
	addLuaSprite('hit2Pix', false)

	makeLuaSprite('hit3Pix', 'ui/rHitPix', notePos3 - 15, noteY - 15)
	setProperty('hit3Pix.antialiasing', false)
	setProperty('hit3Pix.alpha', pAlpha)
	setObjectCamera('hit3Pix', 'hud')
	scaleObject('hit3Pix', pixScale, pixScale)
	addLuaSprite('hit3Pix', false)

	doTweenAlpha('hTween0', 'hit0', 0, 1)
	doTweenAlpha('hTween1', 'hit1', 0, 1)
	doTweenAlpha('hTween2', 'hit2', 0, 1)
	doTweenAlpha('hTween3', 'hit3', 0, 1)

	doTweenAlpha('hpTween0', 'hit0Pix', 0, 1)
	doTweenAlpha('hpTween1', 'hit1Pix', 0, 1)
	doTweenAlpha('hpTween2', 'hit2Pix', 0, 1)
	doTweenAlpha('hpTween3', 'hit3Pix', 0, 1)

	setProperty('rgbShader', false)

end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if direction == 0 and isSustainNote == false then
	setProperty('hit0.alpha', nAlpha)
	doTweenAlpha('hTween0', 'hit0', 0, 0.5)
	
	setProperty('hit0Pix.alpha', pAlpha)
	doTweenAlpha('hTween0Pix', 'hit0Pix', 0, 0.5)

	elseif direction == 1 and isSustainNote == false then
	setProperty('hit1.alpha', nAlpha)
	doTweenAlpha('hTween1', 'hit1', 0, 0.5)
	
	setProperty('hit1Pix.alpha', pAlpha)
	doTweenAlpha('hTween1Pix', 'hit1Pix', 0, 0.5)

	elseif direction == 2 and isSustainNote == false then
	setProperty('hit2.alpha', nAlpha)
	doTweenAlpha('hTween2', 'hit2', 0, 0.5)
	
	setProperty('hit2Pix.alpha', pAlpha)
	doTweenAlpha('hTween2Pix', 'hit2Pix', 0, 0.5)

	elseif direction == 3 and isSustainNote == false then
	setProperty('hit3.alpha', nAlpha)
	doTweenAlpha('hTween3', 'hit3', 0, 0.5)
	
	setProperty('hit3Pix.alpha', pAlpha)
	doTweenAlpha('hTween3Pix', 'hit3Pix', 0, 0.5)

	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if direction == 0 then
	setProperty('opp0.alpha', nAlpha)
	doTweenAlpha('oTween0', 'opp0', 0, 0.5)
	
	setProperty('opp0Pix.alpha', pAlpha)
	doTweenAlpha('oTween0Pix', 'opp0Pix', 0, 0.5)

	elseif direction == 1 then
	setProperty('opp1.alpha', nAlpha)
	doTweenAlpha('oTween1', 'opp1', 0, 0.5)
	
	setProperty('opp1Pix.alpha', pAlpha)
	doTweenAlpha('oTween1Pix', 'opp1Pix', 0, 0.5)

	elseif direction == 2 then
	setProperty('opp2.alpha', nAlpha)
	doTweenAlpha('oTween2', 'opp2', 0, 0.5)
	
	setProperty('opp2Pix.alpha', pAlpha)
	doTweenAlpha('oTween2Pix', 'opp2Pix', 0, 0.5)

	elseif direction == 3 then
	setProperty('opp3.alpha', nAlpha)
	doTweenAlpha('oTween3', 'opp3', 0, 0.5)
	
	setProperty('opp3Pix.alpha', pAlpha)
	doTweenAlpha('oTween3Pix', 'opp3Pix', 0, 0.5)

	end
end