local notePos0 = 730
local notePos1 = 850
local notePos2 = 970
local notePos3 = 1090

function onCreatePost()

noteTweenX('opp0', 0, -999, 0.1)
noteTweenX('opp1', 1, -999, 0.1)
noteTweenX('opp2', 2, -999, 0.1)
noteTweenX('opp3', 3, -999, 0.1)

noteTweenX('p1t', 4, notePos0, 1)
noteTweenX('p2t', 5, notePos1, 1.2)
noteTweenX('p3t', 6, notePos2, 1.5)
noteTweenX('p4t', 7, notePos3, 1.7)
-------------------------------------------------------------------- Arrows
	makeLuaSprite('arrow0', 'ui/left', notePos0 - 10, 30)
	setObjectCamera('arrow0', 'hud')
	setProperty('arrow0.alpha', 0.5)
	scaleObject('arrow0', 0.7, 0.7)
	addLuaSprite('arrow0', false)
	
	makeLuaSprite('arrow1', 'ui/down', notePos1 - 10, 30)
	setObjectCamera('arrow1', 'hud')
	setProperty('arrow1.alpha', 0.5)
	scaleObject('arrow1', 0.7, 0.7)
	addLuaSprite('arrow1', false)

	makeLuaSprite('arrow2', 'ui/up', notePos2 - 10, 30)
	setObjectCamera('arrow2', 'hud')
	setProperty('arrow2.alpha', 0.5)
	scaleObject('arrow2', 0.7, 0.7)
	addLuaSprite('arrow2', false)

	makeLuaSprite('arrow3', 'ui/right', notePos3 - 10, 30)
	setObjectCamera('arrow3', 'hud')
	setProperty('arrow3.alpha', 0.5)
	scaleObject('arrow3', 0.7, 0.7)
	addLuaSprite('arrow3', false)
	
-------------------------------------------------------------------- Opp Hit

	makeLuaSprite('opp0', 'ui/lOpp', notePos0 - 10, 30)
	setObjectCamera('opp0', 'hud')
	scaleObject('opp0', 0.7, 0.7)
	addLuaSprite('opp0', false)
	
	makeLuaSprite('opp1', 'ui/dOpp', notePos1 - 10, 30)
	setObjectCamera('opp1', 'hud')
	scaleObject('opp1', 0.7, 0.7)
	addLuaSprite('opp1', false)

	makeLuaSprite('opp2', 'ui/uOpp', notePos2 - 10, 30)
	setObjectCamera('opp2', 'hud')
	scaleObject('opp2', 0.7, 0.7)
	addLuaSprite('opp2', false)

	makeLuaSprite('opp3', 'ui/rOpp', notePos3 - 10, 30)
	setObjectCamera('opp3', 'hud')
	scaleObject('opp3', 0.7, 0.7)
	addLuaSprite('opp3', false)

-------------------------------------------------------------------- Note Hit
	makeLuaSprite('hit0', 'ui/lHit', notePos0 - 10, 30)
	setObjectCamera('hit0', 'hud')
	scaleObject('hit0', 0.7, 0.7)
	addLuaSprite('hit0', false)
	
	makeLuaSprite('hit1', 'ui/dHit', notePos1 - 10, 30)
	setObjectCamera('hit1', 'hud')
	scaleObject('hit1', 0.7, 0.7)
	addLuaSprite('hit1', false)

	makeLuaSprite('hit2', 'ui/uHit', notePos2 - 10, 30)
	setObjectCamera('hit2', 'hud')
	scaleObject('hit2', 0.7, 0.7)
	addLuaSprite('hit2', false)

	makeLuaSprite('hit3', 'ui/rHit', notePos3 - 10, 30)
	setObjectCamera('hit3', 'hud')
	scaleObject('hit3', 0.7, 0.7)
	addLuaSprite('hit3', false)

	setProperty('opp0.alpha', 0)
	setProperty('opp1.alpha', 0)
	setProperty('opp2.alpha', 0)
	setProperty('opp3.alpha', 0)

	doTweenAlpha('hTween0', 'hit0', 0, 1)
	doTweenAlpha('hTween1', 'hit1', 0, 1)
	doTweenAlpha('hTween2', 'hit2', 0, 1)
	doTweenAlpha('hTween3', 'hit3', 0, 1)

	setProperty('rgbShader', false)
	
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if direction == 0 and isSustainNote == false then
	setProperty('hit0.alpha', 1)
	doTweenAlpha('hTween0', 'hit0', 0, 0.5)
	elseif direction == 1 and isSustainNote == false then
	setProperty('hit1.alpha', 1)
	doTweenAlpha('hTween1', 'hit1', 0, 0.5)
	elseif direction == 2 and isSustainNote == false then
	setProperty('hit2.alpha', 1)
	doTweenAlpha('hTween2', 'hit2', 0, 0.5)
	elseif direction == 3 and isSustainNote == false then
	setProperty('hit3.alpha', 1)
	doTweenAlpha('hTween3', 'hit3', 0, 0.5)
	end
	
	if direction == 0 and isSustainNote == true then
		setProperty('hold.alpha', 1)
		playAnim('hold', 'holding', true, false, 0)
	elseif direction == 1 and isSustainNote == true then
		setProperty('hold1.alpha', 1)
		playAnim('hold1', 'holding', true, false, 0)
	elseif direction == 2 and isSustainNote == true then
		setProperty('hold2.alpha', 1)
		playAnim('hold2', 'holding', true, false, 0)
	elseif direction == 3 and isSustainNote == true then
		setProperty('hold3.alpha', 1)
		playAnim('hold3', 'holding', true, false, 0)
	end

end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if direction == 0 then
	setProperty('opp0.alpha', 1)
	doTweenAlpha('oTween0', 'opp0', 0, 0.5, 'circOut')
	elseif direction == 1 then
	setProperty('opp1.alpha', 1)
	doTweenAlpha('oTween1', 'opp1', 0, 0.5, 'circOut')
	elseif direction == 2 then
	setProperty('opp2.alpha', 1)
	doTweenAlpha('oTween2', 'opp2', 0, 0.5, 'circOut')
	elseif direction == 3 then
	setProperty('opp3.alpha', 1)
	doTweenAlpha('oTween3', 'opp3', 0, 0.5, 'circOut')
	end
end