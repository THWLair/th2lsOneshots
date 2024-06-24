local enableCustomRatings = true -- Is this script enabled?
local enableComboHit = true -- Do you want text to show when you hit/miss a note?
local enableSideCombo = false -- Do you want to show side text of you combo/combos broken?
local thwlScores = 0
local hit = 0
local Ypos = 770
local Ppos = 880
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

function onCreatePost()
if downscroll == true then
Ypos = 70
Ppos = 30
end

	makeLuaText('hits', '', 0, 20, 20)
	setTextSize('hits', 40)
	setTextBorder('hits', 5, '000000')
	addLuaText('hits')

	makeLuaText('scores0', 'Score: X', 0, 40, 880)
	setTextSize('scores0', 40)
	setTextBorder('scores0', 5, '000000')
	addLuaText('scores0')

makeLuaText('fc', 'Perfect!', 0, 1060, Ppos)
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
thwlScores = thwlScores - 50
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
    makeLuaSprite('RATING', IMAGE, 1050, Ypos);
    scaleObject('RATING', 1, 1);
    setProperty('RATING.alpha', 1);
    doTweenAlpha('RATING', 'RATING', 0, tweenTimer, 'circIn');
    doTweenY('RATING_Y3', 'RATING', Ypos + 30, 0.5, 'circIn');
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

function onUpdate()
setTextString('scores0', 'Score: '..thwlScores)
end