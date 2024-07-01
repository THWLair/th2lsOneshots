function onCreate()
    if not seenCutscene then
        makeLuaSprite('blackScreen', nil, -500, -300)
		makeGraphic('blackScreen', screenWidth * 2, screenHeight * 2, '000000')
		setScrollFactor('blackScreen', 0, 0)
		setProperty('blackScreen.alpha', 0.8)
        setObjectCamera('blackScreen', 'other')
        addLuaSprite('blackScreen', true)

        makeLuaSprite('warning', 'warn/boss3', 0, 0)
        addLuaSprite('warning', true)
        setObjectCamera('warning', 'other')
        screenCenter('warning', 'xy')
        
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
    if not idk and not seenCutscene then
        if getProperty('controls.ACCEPT') then
            idk = true
            setProperty('ok1.alpha', 1)
            doTweenAlpha('okT', 'ok1', 0, 0.5)
            doTweenAlpha('okTT', 'ok0', 0, 1.3)
            doTweenAlpha('b', 'blackScreen', 0, 1.3)
            doTweenAlpha('warnOut', 'warning', 0, 1.3)
            playSound('pressed')
        end
    end
end

function onTweenCompleted(tag)
    if tag == 'warnOut' then
        startCountdown()
        removeLuaSprite('warning', true)
        removeLuaSprite('blackScreen', true)
    end
end