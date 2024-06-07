local camCustomSpeed = 1

function onEvent(n, v1, v2)
	if n == "customCamSpeed" and camCustomSpeed == 1 then
	camCustomSpeed = 0.001
	elseif n == "customCamSpeed" and camCustomSpeed == 0.001 then
	camCustomSpeed = 1
	end
end

function onUpdatePost()
    setProperty('isCameraOnForcedPos', true)
end

function onSectionHit()
getx2 = getMidpointX('dad')+150+getProperty('dad.cameraPosition[0]')+getProperty('opponentCameraOffset[0]') --+ getProperty("dad.positionArray[0]")
getx = getMidpointX('boyfriend')-100-getProperty('boyfriend.cameraPosition[0]')+getProperty('boyfriendCameraOffset[0]') --+ getProperty("boyfriend.positionArray[0]")
gety = getMidpointY('boyfriend')-100+getProperty('boyfriend.cameraPosition[1]')+getProperty('boyfriendCameraOffset[1]') --+ getProperty("boyfriend.positionArray[1]")
gety2 = getMidpointY('dad')-100+getProperty('dad.cameraPosition[1]')+getProperty('opponentCameraOffset[1]') --+ getProperty("dad.positionArray[1]")
    cancelTween('bleh')
    cancelTween('bleh2')
    doTweenX('bleh', 'camFollow', (mustHitSection and getx or getx2), camCustomSpeed)
    doTweenY('bleh2', 'camFollow', (mustHitSection and gety or gety2), camCustomSpeed)
end