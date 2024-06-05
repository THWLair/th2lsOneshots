boomspeed = 4
bam = 1
function onEvent(n,v1,v2)

if n == "Boom Speed MS" then

boomspeed = tonumber(v1)
bam = tonumber(v2)

end

end
function onBeatHit()
	if curBeat % boomspeed == 0 then
		doTweenZoom('zoom_0', 'camHUD', 1.02, 0.01)
		doTweenZoom('zoom_1', 'camHUD', 1, 0.2)
	end
end