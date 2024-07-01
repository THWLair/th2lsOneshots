function onUpdate()
if mustHitSection == true then
doTweenAngle('cam1', 'camGame', -2, 5)
doTweenAngle('cam2', 'camHUD', 2, 5)
end
if not mustHitSection then
doTweenAngle('cam3', 'camGame', 2, 5)
doTweenAngle('cam4', 'camHUD', -2, 5)
end
end