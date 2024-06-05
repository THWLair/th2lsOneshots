function onCreatePost()
    
	makeLuaSprite('bg0','stages/sak0', -400, -300)
	scaleObject('bg0', 1.5, 1.5)
	setProperty('bg0.antialiasing', false)
	setScrollFactor('bg0', 0, 0)
	addLuaSprite('bg0')
	
	makeLuaSprite('bg1','stages/sak1', -400, -300)
	scaleObject('bg1', 1.5, 1.5)
	setProperty('bg1.antialiasing', false)
	setScrollFactor('bg1', 0.3, 0.3)
	addLuaSprite('bg1')
	
	makeLuaSprite('bg2','stages/sak2', -400, -300)
	scaleObject('bg2', 1.5, 1.5)
	setProperty('bg2.antialiasing', false)
	setScrollFactor('bg2', 0.6, 0.6)
	addLuaSprite('bg2')
	
	makeLuaSprite('bg3','stages/sak3', -400, -300)
	scaleObject('bg3', 1.5, 1.5)
	setProperty('bg3.antialiasing', false)
	setScrollFactor('bg3', 0.9, 0.9)
	addLuaSprite('bg3')
	
	makeLuaSprite('bg4','stages/sak4', -400, -300)
	scaleObject('bg4', 1.5, 1.5)
	setProperty('bg4.antialiasing', false)
	addLuaSprite('bg4')

	makeLuaSprite('bg5','stages/sak5', -200, -200)
	scaleObject('bg5', 40, 20)
	setProperty('bg5.antialiasing', false)
	addLuaSprite('bg5', true)

	precacheImage('PIXELNOTE_assets')

end
