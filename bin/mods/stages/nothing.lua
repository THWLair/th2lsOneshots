function onCreatePost()
    
    setProperty('gf.alpha', 0);
	setProperty('boyfriend.alpha', 0);

	makeLuaSprite('main','stages/nothing', -400, -300)
	addLuaSprite('main')
	
	precacheImage('PIXELNOTE_assets')

end
