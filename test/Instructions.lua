-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- SCENE STUFF

print("instructions has been created")

local composer = require( "composer" )
composer.removeScene("Story")
local scene = composer.newScene()



function scene:create( event )

    local sceneGroup = self.view

	local background = display.newImage("ruin.png")
	background.x=200
	background.y=320
	sceneGroup:insert(background)

local myText1 = display.newText( "Instructions", 160, 0, "Matura MT Script Capitals", 30)
local myText2 = display.newText( "Navigate your character by tapping", 160, 100, "Matura MT Script Capitals", 18)
local myText3 = display.newText( "the arrows on the screen.", 160, 150, "Matura MT Script Capitals", 18)
local myText4 = display.newText( "Bumping into chests activates puzzles!", 160, 200, "Matura MT Script Capitals", 18)
local myText5 = display.newText( "Solve challenges by dragging pieces", 160, 250, "Matura MT Script Capitals", 18)
local myText6 = display.newText( "into place or memorizing cards.", 160, 300, "Matura MT Script Capitals", 18)
local myText7 = display.newText( "Now get to the top and save Einstein!", 160, 350, "Matura MT Script Capitals", 18)
local myText8 = display.newText( "", 160, 400, "Segoe Script", 22)
sceneGroup:insert(myText1)
sceneGroup:insert(myText2)
sceneGroup:insert(myText3)
sceneGroup:insert(myText4)
sceneGroup:insert(myText5)
sceneGroup:insert(myText6)
sceneGroup:insert(myText7)
sceneGroup:insert(myText8)




local easy = display.newText( "Easy", 160, 407, "Matura MT Script Capitals", 20 )
sceneGroup:insert(easy)
local easy1 = display.newRect(160,400,180,40)
easy1.alpha=0.01;
sceneGroup:insert(easy1)

local medium = display.newText( "Medium", 160, 457, "Matura MT Script Capitals", 20 )
sceneGroup:insert(medium)
local medium1 = display.newRect(160,450,180,40)
medium1.alpha=0.01;
sceneGroup:insert(medium1)

local hard = display.newText( "Hard", 160, 507, "Matura MT Script Capitals", 20 )
sceneGroup:insert(hard)
local hard1 = display.newRect(160,500,180,40)
hard1.alpha=0.01;
sceneGroup:insert(hard1)

difficultyVar = 0
function easy1:touch(event)
  difficultyVar = 0
  local scene = composer.gotoScene("level1a")
end
function medium1:touch(event)
  difficultyVar = 1
  local scene = composer.gotoScene("level1b")
end
function hard1:touch(event)
  difficultyVar = 2
  local scene = composer.gotoScene("level1c")
end

easy1:addEventListener("touch", easy1)
medium1:addEventListener("touch", medium1)
hard1:addEventListener("touch", hard1)


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
