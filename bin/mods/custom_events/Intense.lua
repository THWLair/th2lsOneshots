local active = false

function onEvent(n,v1,v2)

if n == "Intense" and active == false then
active = true
elseif n == "Intense" and active == active then
active = false

end

end
function onUpdate()
	if active == true then
		doTweenZoom('zoom_0', 'camHUD', 1.06, 0.01)
		doTweenZoom('zoom_1', 'camHUD', 1, 0.2)
	end
end