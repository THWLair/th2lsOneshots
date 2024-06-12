local enableCustomRatings = true -- Is this script enabled?
local enableComboHit = true -- Do you want text to show when you hit/miss a note?
local enableSideCombo = false -- Do you want to show side text of you combo/combos broken?
local thwlScores = 0
local hit = 0

local MaxCombo = 0
idk1 = false
idk2 = false

-- Your images!
local ratingImages = {
    { -- You can edit this with your images if you don't want to edit certain lines of code under onCreatePost().
        'rating0',
        'rating1',
        'rating2',
        'rating3',
        'rating4'
    },
    { -- Optionally add more images, but you'll need to edit some lines of code under onCreatePost() for them to be used properly.
        '',
        '',
        '',
        ''
    }
}

-- You can enable precacheing in case of lag.
local areYouLagging = true

-- Sync the images.
local ball_1
local ball_2
local ball_3
local ball_4
local ball_5

-- yes
local POS = {}

-- Scale and Alpha timers.
local scaleThing = 1 -- Default 0.65
local tweenTimer = 0.5 -- Default 0.5

-- Combo stuff.
local combo = 0
local combosBroken = 0

function onCreate() 

makeAnimatedLuaSprite('resultBG', 'result', 0, 0)
addAnimationByPrefix('resultBG', 'perfect', 'result perfect', 1, true)
addAnimationByPrefix('resultBG', 'admirable', 'result admirable', 1, true)
addAnimationByPrefix('resultBG', 'brilliant', 'result brilliant', 1, true)
addAnimationByPrefix('resultBG', 'clueless', 'result clueless', 1, true)
addAnimationByPrefix('resultBG', 'disastrous', 'result disastrous', 1, true)
playAnim('resultBG', 'brilliant', true)
scaleObject('resultBG', 1.4, 1.4)
setObjectCamera('resultBG', 'camother')
addLuaSprite('resultBG', true)

makeLuaSprite('RESULTS', 'ui/info', 0, 0) 
setObjectCamera('RESULTS', 'camother')
scaleObject('RESULTS', 1.4, 1.4)
setProperty('RESULTS.antialiasing', false)
addLuaSprite('RESULTS', true)
------------------------------------------
makeLuaSprite('sick1', 'rating0', -999, 355) 
setObjectCamera('sick1', 'camother')
scaleObject('sick1', 1.3, 1.3)
setProperty('sick1.antialiasing', false)
addLuaSprite('sick1', true)

makeLuaSprite('good1', 'rating1', -999, 450) 
setObjectCamera('good1', 'camother')
scaleObject('good1', 1.3, 1.3)
setProperty('good1.antialiasing', false)
addLuaSprite('good1', true)

makeLuaSprite('bad1', 'rating2', -999, 540) 
setObjectCamera('bad1', 'camother')
scaleObject('bad1', 1.3, 1.3)
setProperty('bad1.antialiasing', false)
addLuaSprite('bad1', true)

makeLuaSprite('shit1', 'rating3', -999, 630) 
setObjectCamera('shit1', 'camother')
scaleObject('shit1', 1.3, 1.3)
setProperty('shit1.antialiasing', false)
addLuaSprite('shit1', true)

makeLuaSprite('missed', 'rating4', -999, 720) 
setObjectCamera('missed', 'camother')
scaleObject('missed', 1.3, 1.3)
setProperty('missed.antialiasing', false)
addLuaSprite('missed', true)
----------------------------------------
makeLuaSprite('RATINGS', 'rating0', -150, 150) 
setObjectCamera('RATINGS', 'camother')
addLuaSprite('RATINGS', true)
           
           makeLuaText('hitText', '0', 0, -99, 180) 
           setObjectCamera('hitText', 'camother')
           setTextColor('hitText', 'FFFFFF')
           setTextBorder('hitText', 4, '000000') 
           setTextSize('hitText', 60)
           addLuaText('hitText')
           
           makeLuaText('comboMAX', '0', 0, -99, 270) 
           setObjectCamera('comboMAX', 'camother')
           setTextColor('comboMAX', 'FFFFFF')
           setTextBorder('comboMAX', 4, '000000') 
           setTextSize('comboMAX', 60)
           addLuaText('comboMAX')
           
           makeLuaText('sickText', '0', 0, -99, 360);  
	       setObjectCamera('sickText', 'camother');
	       setTextColor('sickText', 'FFFFFF')
           setTextBorder('sickText', 4, '000000') 
       	setTextSize('sickText', 60);
	       addLuaText('sickText')
	
	       makeLuaText('goodText', '0', 0, -99, 455) 
	       setObjectCamera('goodText', 'camother')
	       setTextColor('goodText', 'FFFFFF')
           setTextBorder('goodText', 4, '000000') 
       	setTextSize('goodText', 60)
	       addLuaText('goodText')
	
	       makeLuaText('badText', '0', 0, -99, 545)  
	       setObjectCamera('badText', 'camother')
	       setTextColor('badText', 'FFFFFF')
           setTextBorder('badText', 4, '000000') 
       	setTextSize('badText', 60)
	       addLuaText('badText')
	
	       makeLuaText('shitText', '0', 0, -99, 640)  
	       setObjectCamera('shitText', 'camother')
	       setTextColor('shitText', 'FFFFFF')
           setTextBorder('shitText', 4, '000000') 
       	setTextSize('shitText', 60)
	       addLuaText('shitText')
  
           makeLuaText('missesText', '0', 0, -99, 745)
           setObjectCamera('missesText', 'camother')
           setTextColor('missesText', 'FFFFFF')
           setTextBorder('missesText', 4, '000000') 
           setTextSize('missesText', 60)
           addLuaText('missesText')
           
           makeLuaText('scoreText', '0', 0, -99, 850) 
           setObjectCamera('scoreText', 'camother')
           setTextColor('scoreText', 'FFFFFF')
           setTextBorder('scoreText', 4, '000000') 
           setTextSize('scoreText', 80)
           addLuaText('scoreText')
           
makeLuaSprite('NSUS', 'empty', 0, 0)
makeGraphic('NSUS', 1280, 1280, '000000')
setObjectCamera('NSUS', 'camother')
addLuaSprite('NSUS', true)

makeAnimatedLuaSprite('rank', 'rank', 480, 360)
addAnimationByPrefix('rank', 'perfect', 'rank perfect', 1, true)
addAnimationByPrefix('rank', 'admirable', 'rank admirable', 1, true)
addAnimationByPrefix('rank', 'brilliant', 'rank brilliant', 1, true)
addAnimationByPrefix('rank', 'clueless', 'rank clueless', 1, true)
addAnimationByPrefix('rank', 'disastrous', 'rank disastrous', 1, true)
scaleObject('rank', 1.4, 1.4)
playAnim('rank', 'brilliant', true)
setProperty('rank.antialiasing', false)
setObjectCamera('rank', 'camother')
addLuaSprite('rank', true)

setProperty('resultBG.alpha', 0)
setProperty('rank.alpha', 0)
doTweenAlpha('N', 'NSUS', 0, 0.1, 'linear')
doTweenAlpha('55', 'RESULTS', 0, 0.1, 'linear')
doTweenAlpha('77', 'RATINGS', 0, 0.1, 'linear')

end

function onCreatePost()
	makeLuaText('hits', '', 0, 20, 20)
	setTextSize('hits', 40)
	setTextBorder('hits', 5, '000000')
	addLuaText('hits')

	makeLuaText('scores0', 'Score: X', 0, 40, 880)
	setTextSize('scores0', 40)
	setTextBorder('scores0', 5, '000000')
	addLuaText('scores0')

makeLuaText('fc', 'Perfect!', 0, 1060, 880)
setTextSize('fc', 40)
setTextBorder('fc', 5, '000000')
setObjectCamera('fc', 'hud')
addLuaText('fc')
setProperty('fc.alpha', 1)

    makeLuaSprite('comboIMG', 'hud/combo', -300, 510)
    scaleObject('comboIMG', 0.3, 0.3)
    addLuaSprite('comboIMG', true)
    setObjectCamera('comboIMG', 'hud')

setPropertyFromClass('ClientPrefs', 'globalAntialiasing', false)
setPropertyFromClass('ClientPrefs', 'ghostTapping', false)

    if enableCustomRatings then
        POS = {getProperty('boyfriend.x'), getProperty('boyfriend.y')}
        setProperty('showRating', false);
        setProperty('showComboNum', false);
        ball_1 = ratingImages[1][1]
        ball_2 = ratingImages[1][2]
        ball_3 = ratingImages[1][3]
        ball_4 = ratingImages[1][4]
        ball_5 = ratingImages[1][5]
        --[[
            if songName == 'Song' then
                ball_1 = ratingImages[1][1]
                ball_2 = ratingImages[1][2]
                ball_3 = ratingImages[1][3]
                ball_4 = ratingImages[1][4]
                ball_5 = ratingImages[1][5]
            else
                ball_1 = ratingImages[2][1]
                ball_2 = ratingImages[2][2]
                ball_3 = ratingImages[2][3]
                ball_4 = ratingImages[2][4]
                ball_4 = ratingImages[2][5]
            end
        ]]
        if areYouLagging then
            precacheImage(ball_1);
            precacheImage(ball_2);
            precacheImage(ball_3);
            precacheImage(ball_4);
            precacheImage(ball_5);
        end
            setTextAlignment('currentCombo', 'Center');
            setTextSize('currentCombo', 20);
            addLuaText('currentCombo');
            setProperty('currentCombo.alpha', 0);
        end
        if enableSideCombo then
            makeLuaText('currentComboCounter', ': '..combo, 0, -300, 520);
            setTextSize('currentComboCounter', 20);
            addLuaText('currentComboCounter');
        end
    end

function goodNoteHit(id, direction, noteType, isSustainNote)

    if enableCustomRatings and not isSustainNote then
    
    hit = hit + 1
    
        sick = (getProperty('ratingsData[0].hits'))
        good = (getProperty('ratingsData[1].hits'))
        bad = (getProperty('ratingsData[2].hits'))
        shit = (getProperty('ratingsData[3].hits'))
        
        combo = combo + 1
        if sick then
            makeRatingTexture(ball_1);
            onUpdateComboText(1);
		thwlScores = thwlScores + 20
        elseif good then
            makeRatingTexture(ball_2);
            onUpdateComboText(1);
		thwlScores = thwlScores + 10
        elseif bad then
            makeRatingTexture(ball_3);
            onUpdateComboText(1);
		thwlScores = thwlScores - 5
        elseif shit then
            makeRatingTexture(ball_4);
            onUpdateComboText(1);
		thwlScores = thwlScores + 10
        end
    end
end

function noteMissPress() noteMiss(); end

function noteMiss(id, direction, noteType, isSustainNote)
doTweenX('combotween', 'currentComboCounter', 140, 0.3, 'circOut')
doTweenX('combottween', 'comboIMG', 20, 0.3, 'circOut')
thwlScores = thwlScores - 25
setProperty('fc.alpha', 0)
    if enableCustomRatings then
        if combo > 0 then
            combo = 0
            combosBroken = combosBroken + 1
            makeRatingTexture(ball_5);
            onUpdateComboText(2);
        end
    end
end

function makeRatingTexture(IMAGE)
    makeLuaSprite('RATING', IMAGE, 1050, 770);
    scaleObject('RATING', 1, 1);
    setProperty('RATING.alpha', 1);
    doTweenAlpha('RATING', 'RATING', 0, tweenTimer, 'circIn');
    doTweenY('RATING_Y3', 'RATING', 800, 0.5, 'circIn');
    doTweenX('RATING_X', 'RATING.scale', 1.2, 0.3, 'circOut');
    doTweenY('RATING_Y', 'RATING.scale', 1.2, 0.3, 'circOut');
    
    setObjectCamera('RATING', 'hud')
    addLuaSprite('RATING', true);
end

function onUpdateComboText(comboCheck)
    if comboCheck == 1 then
        setTextString('currentCombo', 'COMBO! '..combo..'');
    elseif comboCheck == 2 then
        setTextString('currentCombo', 'COMBO GONE! '..combo..'');
    end
    setProperty('currentCombo.alpha', 1);
    scaleObject('currentCombo', 1, 1);
    doTweenAlpha('txt', 'currentCombo', 0, tweenTimer, 'linear');
    doTweenY('txtY', 'currentCombo.scale', scaleThing, tweenTimer, 'circInOut');
    setTextString('currentComboCounter', ': '..combo);
end

function onEndSong()
if thwlScores < 7000 then
	playAnim('resultBG', 'disastrous', true)
	playAnim('rank', 'disastrous', true)
elseif thwlScores > 7000 and thwlScores < 9000 then
	playAnim('resultBG', 'clueless', true)
	playAnim('rank', 'clueless', true)
elseif thwlScores > 9000 and thwlScores < 11000 then
	playAnim('resultBG', 'brilliant', true)
	playAnim('rank', 'brilliant', true)
elseif thwlScores > 12000 then
	playAnim('resultBG', 'admirable', true)
	playAnim('rank', 'admirable', true)
end

if not idk2 then 
runTimer('coolResult', 2, 1) 
doTweenAlpha('1N', 'NSUS', 1, 1, 'circOut')
idk1 = true
return Function_Stop;
end
return Function_Continue;
end
function onUpdate(elapsed)
	setTextString('scores0', 'Score: '.. thwlScores)
	setTextString('hits', ''..hit)
if misses == 0 then
	playAnim('resultBG', 'perfect', true)
	playAnim('rank', 'perfect', true)
end
if idk1 == true then
if keyboardJustPressed('SPACE') then 
endSong() 
idk2 = true
end
else
end

if combo > MaxCombo then
		MaxCombo = combo
end

setTextString('comboMAX', ''.. MaxCombo)
setTextString('missesText', '' ..  misses)
setTextString('scoreText', '' ..  thwlScores)
setTextString('hitText', '' ..  hits)
setTextString('sickText', ''.. sick)
setTextString('goodText', ''.. good)
setTextString('badText', ''.. bad)
setTextString('shitText', ''.. shit)	

end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'coolResult' then
setProperty('rank.alpha', 1)
doTweenX('rankTween0', 'rank.scale', 1, 0.3, 'circOut')
doTweenY('rankTween1', 'rank.scale', 1, 0.3, 'circOut')
doTweenAlpha('1', 'resultBG', 1, 2, 'linear') 
doTweenAlpha('5', 'RESULTS', 1, 0.1, 'linear')
doTweenAlpha('7', 'RATINGS', 1, 0.1, 'linear')
doTweenAlpha('8', 'SCORE', 1, 0.1, 'linear')

runTimer('appear', 1, 1)
end
	if tag == 'appear' then
playMusic('results', 1, false)
doTweenAlpha('9', 'NSUS', 0, 1, 'linear')
objectPlayAnimation('RESULTS', 'RESULTS1', true) 
objectPlayAnimation('RATINGS', 'RATINGS1', true)
objectPlayAnimation('SCORE', 'SCORE1', true) 
doTweenX('rankTween2', 'rank', 990, 1, 'circOut')
doTweenY('rankTween3', 'rank', -20, 1, 'circOut')


doTweenX('HITS2', 'hitText', 540, 0.5, 'circOut')
doTweenX('MA2', 'comboMAX', 460, 0.5, 'circOut')
doTweenX('S2', 'sickText', 340, 0.5, 'circOut')
doTweenX('G2', 'goodText', 340, 0.5, 'circOut')
doTweenX('B2', 'badText', 340, 0.5, 'circOut')
doTweenX('SH2', 'shitText', 340, 0.5, 'circOut')
doTweenX('M2', 'missesText', 340, 0.5, 'circOut')
doTweenX('SCO2', 'scoreText', 400, 0.5, 'circOut') 

doTweenX('ratingTw0', 'sick1', 70, 0.5, 'circOut')
doTweenX('ratingTw1', 'good1', 75, 0.5, 'circOut')
doTweenX('ratingTw2', 'bad1', 90, 0.5, 'circOut')
doTweenX('ratingTw3', 'shit1', 80, 0.5, 'circOut')
doTweenX('ratingTw4', 'missed', 70, 0.5, 'circOut')

end
end
