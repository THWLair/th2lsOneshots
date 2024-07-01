local part = 1
local active = true

function onCreate()
    if not seenCutscene then
	playMusic('cutscene-0', 1, true)

        makeLuaSprite('blackScreen', nil, -500, -300)
		makeGraphic('blackScreen', screenWidth * 2, screenHeight * 2, '000000')
		setScrollFactor('blackScreen', 0, 0)
		setProperty('blackScreen.alpha', 1)
        setObjectCamera('blackScreen', 'other')
        addLuaSprite('blackScreen')

        makeLuaSprite('warning', 'warn/boss1', 0, 0)
        addLuaSprite('warning', true)
        setProperty('warning.alpha', 0)
        setObjectCamera('warning', 'other')
        screenCenter('warning', 'xy')
        
	makeLuaText('skip', 'S for skip.', 0, 40, 880)
	setTextSize('skip', 40)
	setProperty('skip.alpha', 0.7)
	setTextBorder('skip', 5, '000000')
	setObjectCamera('skip', 'other')
	addLuaText('skip')
	
	makeLuaText('buttom', 'press ENTER', 0, 1020, 780)
	setTextSize('buttom', 30)
	setProperty('buttom.alpha', 0.7)
	setTextAlignment('buttom', 'center')
	setTextBorder('buttom', 5, '000000')
	setObjectCamera('buttom', 'other')
	addLuaText('buttom')
	
	makeLuaText('lore', 'You`re playing as Mei Marley. A 18 years old girl who lives with her grandma and aunt, after having gone through a difficult childhood that she half managed to overcome over the years', 0, 120, 610)
	setTextWidth('lore', 1000)
	setTextSize('lore', 40)
	setTextAlignment('lore', 'center')
	setObjectCamera('lore', 'other')
	addLuaText('lore')


        makeAnimatedLuaSprite('cutscene', 'cutscene/relevant', 0, 30)
        addAnimationByPrefix('cutscene', 'a', 'a', 12, true)
        addAnimationByPrefix('cutscene', 'b', 'b', 8, true)
        addAnimationByPrefix('cutscene', 'c', 'c', 10, true)
        addAnimationByPrefix('cutscene', 'd', 'd', 12, true)
        addAnimationByPrefix('cutscene', 'e', 'e', 10, true)
        addAnimationByPrefix('cutscene', 'f', 'f', 12, true)
        addAnimationByPrefix('cutscene', 'g', 'g', 10, true)
        addAnimationByPrefix('cutscene', 'h', 'h', 16, true)
        addAnimationByPrefix('cutscene', 'i', 'i', 12, true)
        addAnimationByPrefix('cutscene', 'j', 'j', 8, true)
        addAnimationByPrefix('cutscene', 'k', 'k', 12, true)
        addAnimationByPrefix('cutscene', 'l', 'l', 12, true)
        scaleObject('cutscene', 0.8, 0.8)
       	screenCenter('cutscene', 'x')
        setObjectCamera('cutscene', 'other')
        addLuaSprite('cutscene', true)
        playAnim('cutscene', 'a', true)
        
        makeLuaSprite('ok0', 'warn/ok0', 1000, 800)
        addLuaSprite('ok0', true)
        setObjectCamera('ok0', 'other')
		
		makeLuaSprite('ok1', 'warn/ok1', 1000, 800)
        addLuaSprite('ok1', true)
        setProperty('ok1.alpha', 0)
        setObjectCamera('ok1', 'other')

    else
        --close(true)
    end
end

local idk = false
function onStartCountdown()
	if not idk and not seenCutscene then
		return Function_Stop
	end
end


function onUpdate()
if not idk and keyboardJustPressed('S') then
		idk = true
		active = false
	soundFadeOut(nil, 1, 0)
		setProperty('cutscene.alpha', 0)
		doTweenAlpha('loreAlpha2', 'lore', 0, 0.1)
            setProperty('blackScreen.alpha', 0.8)
            setProperty('ok1.alpha', 0)
            doTweenAlpha('okTT', 'ok0', 0, 1)
            doTweenAlpha('b', 'blackScreen', 0, 1)
            doTweenAlpha('warnOut1', 'warning', 0, 1)
            playSound('pressed')
end

if not idk and active == true and keyboardJustPressed('ENTER') and part == 1 then
	setTextString('lore', 'One night, she was sleeping comfortably in her bed. But just like every night, she had a dream that would wake her up')
        playAnim('cutscene', 'b', true)
        setProperty('ok1.alpha', 1)
        doTweenAlpha('okT', 'ok1', 0, 0.5)
        part = 2
        playSound('pressed')
        setTextString('buttom', 'now SPACE')
end

if not idk and not seenCutscene and active == true and part == 2 and keyboardJustPressed('SPACE') then
	setTextString('lore', 'A very deep voice that told her things that would make sense to her to this today')
        playAnim('cutscene', 'c', true)
        setProperty('ok1.alpha', 1)
        doTweenAlpha('okT', 'ok1', 0, 0.5)
        playSound('pressed')
        part = 3
        setTextString('buttom', 'ENTER again')
end

if not idk and not seenCutscene and active == true and part == 3 and keyboardJustPressed('ENTER') then
	setTextString('lore', 'She saw through her window a strong light coming from a large structure in the distance, shining directly towards her.')
        playAnim('cutscene', 'd', true)
        setProperty('ok1.alpha', 1)
        doTweenAlpha('okT', 'ok1', 0, 0.5)
        playSound('pressed')
        part = 4
        setTextString('buttom', 'SPACE again!')
end

if not idk and not seenCutscene and active == true and part == 4 and keyboardJustPressed('SPACE') then
	setTextString('lore', 'Curiosity was killing her, so to finally find out what was happening, she decided to risk sneaking out without anyone at home finding out.')
        playAnim('cutscene', 'e', true)
        setProperty('ok1.alpha', 1)
        doTweenAlpha('okT', 'ok1', 0, 0.5)
        playSound('pressed')
        part = 5
        setTextString('buttom', 'ENTER!')
end

if not idk and not seenCutscene and active == true and part == 5 and keyboardJustPressed('ENTER') then
	setTextString('lore', 'She walked through the streets as her doubts dazed her peace of mind, wondering if this would really be worth it, nervous about the dangers of the night.')
        playAnim('cutscene', 'f', true)
        setProperty('ok1.alpha', 1)
        doTweenAlpha('okT', 'ok1', 0, 0.5)
        playSound('pressed')
        part = 6
        setTextString('buttom', 'SPACE!!')
end

if not idk and not seenCutscene and active == true and part == 6 and keyboardJustPressed('SPACE') then
	setTextString('lore', 'But to her surprise, she did find what she expected from the beginning, everything was real')
        playAnim('cutscene', 'g', true)
        setProperty('ok1.alpha', 1)
        doTweenAlpha('okT', 'ok1', 0, 0.5)
        playSound('pressed')
        part = 7
        setTextString('buttom', 'ENTER!!!')
end

if not idk and not seenCutscene and active == true and part == 7 and keyboardJustPressed('ENTER') then
	setTextString('lore', 'The strong light shone in her eyes, she felt a strong energy covering the entire place, the giant structure was in front of her.')
        playAnim('cutscene', 'h', true)
        setProperty('ok1.alpha', 1)
        doTweenAlpha('okT', 'ok1', 0, 0.5)
        playSound('pressed')
        part = 8
        setTextString('buttom', 'SPACE!!!')
end

if not idk and not seenCutscene and active == true and part == 8 and keyboardJustPressed('SPACE') then
	setTextString('lore', 'THE SOLAR TOWER, which reserves solar energy to provide it to the earth and maintain the balance of the entire island, was the deep voice that spoke to her during all this time')
        playAnim('cutscene', 'i', true)
        setProperty('ok1.alpha', 1)
        doTweenAlpha('okT', 'ok1', 0, 0.5)
        playSound('pressed')
        part = 9
        setTextString('buttom', 'press ENTER!!')
end

if not idk and not seenCutscene and active == true and part == 9 and keyboardJustPressed('ENTER') then
	setTextString('lore', 'She explained that she needed someone to defend and represent her from anyone who wanted something against her, giving to Mei a "special weapon" that she knew how to use.')
        playAnim('cutscene', 'j', true)
        setProperty('ok1.alpha', 1)
        doTweenAlpha('okT', 'ok1', 0, 0.5)
        playSound('pressed')
        part = 10
        setTextString('buttom', 'press SPACE!!!')
end

if not idk and not seenCutscene and active == true and part == 10 and keyboardJustPressed('SPACE') then
	setTextString('lore', '"I chose you because you are the most convenient and pure i know" said the tower. At any moment i will let you know so that you can come and take care of me.')
        playAnim('cutscene', 'k', true)
        setProperty('ok1.alpha', 1)
        doTweenAlpha('okT', 'ok1', 0, 0.5)
        playSound('pressed')
        part = 11
        setTextString('buttom', 'ENTER!')
end

if not idk and not seenCutscene and active == true and part == 11 and keyboardJustPressed('ENTER') then
	setTextString('lore', 'Mei without any hesitation accepted her position and promised to be aware of her warnings, even knowing that perhaps she was not the most capable. The next night, the tower would call her again.')
        playAnim('cutscene', 'l', true)
        setProperty('ok1.alpha', 1)
        doTweenAlpha('okT', 'ok1', 0, 0.5)
        playSound('pressed')
        part = 12
        setTextString('buttom', 'SPACE!')
end

if not idk and not seenCutscene and active == true and part == 12 and keyboardJustPressed('SPACE') then
        active = false
        setProperty('blackScreen.alpha', 0.8)
	soundFadeOut(nil, 1, 0)
        doTweenAlpha('cutAlpha', 'cutscene', 0, 0.5)
	doTweenAlpha('loreAlpha', 'lore', 0, 0.1)
        doTweenAlpha('warnAlpha', 'warning', 1, 1)
        setProperty('ok1.alpha', 1)
        doTweenAlpha('okT', 'ok1', 0, 0.5)
        playSound('pressed')
        setTextString('buttom', 'ENTER')
end

    if not idk and not seenCutscene and active == false and keyboardJustPressed('ENTER') then
            idk = true
            setProperty('ok1.alpha', 1)
            doTweenAlpha('okT', 'ok1', 0, 0.5)
            doTweenAlpha('okTT', 'ok0', 0, 1.3)
            doTweenAlpha('b', 'blackScreen', 0, 1.3)
            doTweenAlpha('warnOut', 'warning', 0, 1.3)
            playSound('pressed')
            setTextString('buttom', 'good job')
   end
end

function onTweenCompleted(tag)
    if tag == 'warnOut' then
	
        startCountdown()
        removeLuaSprite('warning', true)
        removeLuaSprite('blackScreen', true)
        setProperty('skip.alpha', 0)
        setProperty('buttom.alpha', 0)
	
    elseif tag == 'warnOut1' then
	
        startCountdown()
        removeLuaSprite('warning', true)
        removeLuaSprite('blackScreen', true)
        setProperty('skip.alpha', 0)
        setProperty('buttom.alpha', 0)
	
    end
end