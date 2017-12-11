-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- SCENE STUFF


local composer = require( "composer" )
local scene = composer.newScene()

function scene:create(event)
local sceneGroup = self.view

local myText = display.newText( "Game Over", 160, 135, "Matura MT Script Capitals", 40 )
sceneGroup:insert(myText)

local Menu = display.newRect(160,355,180,40)
sceneGroup:insert(Menu)
Menu.alpha=0.01;
local myText2 = display.newText( "Exit Game", 160, 357, "Matura MT Script Capitals", 40 )
sceneGroup:insert(myText2)

function Menu:touch(event)
--transition
  if event.phase == "began" then
  native.requestExit()
  return true
  end

end

Menu:addEventListener("touch", Menu)
saveData = saveData .. "Player Has Died "

end





-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        composer.removeHidden()
    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
