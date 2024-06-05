function onUpdate()
      if keyboardJustPressed('SPACE') and boyfriendName == 'bf' then
          triggerEvent('Change Character','bf','cris')
          	playAnim('icons', 'cris', true, true, 0)

      elseif keyboardJustPressed('SPACE') and boyfriendName == 'cris' then
          triggerEvent('Change Character','bf','bf')
          	playAnim('icons', 'bf', true, true, 0)

      end
end
