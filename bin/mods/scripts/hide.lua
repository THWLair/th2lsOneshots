local hudStuff = {'scoreTxt', 'timeTxt', 'timeBar', 'timeBarBG', 'healthBarOverlay'} 

function onCreatePost()
    for i = 1, 5 do setProperty(hudStuff[i] ..'.visible', false) end --this thing hide vanilla stuff end
addCharacterToList('bf2', 'boyfriend')
addCharacterToList('cris', 'dad')

setProperty('healthBar.alpha', 0); setProperty('iconP1.alpha', 0); setProperty('iconP2.alpha', 0);

setPropertyFromClass("openfl.Lib", "application.window.title", "thwl's oneshot: " ..songName)
end