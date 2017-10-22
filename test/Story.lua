-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- SCENE STUFF


local composer = require( "composer" )

local background = display.newImage("ruin.png")
background.x=200
background.y=320

local myText = display.newText( "Story", 160, 0, "Matura MT Script Capitals", 30)

local myText = display.newText( "The great scientist, Albert Einstein", 160, 50, "Matura MT Script Capitals", 18)
local myText = display.newText( "has been kidnapped by an unknown", 160, 100, "Matura MT Script Capitals", 18)
local myText = display.newText( "villian. This unknown adversary has ", 160, 150, "Matura MT Script Capitals", 18)
local myText = display.newText( "travelled through space and time to", 160, 200, "Matura MT Script Capitals", 18)
local myText = display.newText( "take him, causing a disruption in the", 160, 250, "Matura MT Script Capitals", 18)
local myText = display.newText( "space-time continuum. Scale the tower ", 160, 300, "Matura MT Script Capitals", 18)
local myText = display.newText( "and complete the puzzles to hold the", 160, 350, "Matura MT Script Capitals", 18)
local myText = display.newText( "universe together... Before its too late.", 160, 400, "Matura MT Script Capitals", 18)




local next = display.newRect(160,500,180,40)
next.alpha=0.01;

local myText = display.newText( "Next", 160, 507, "Matura MT Script Capitals", 20 )


function next:touch(event)
--transition
  if event.phase == "began" then
  local scene = composer.gotoScene("Instructions")
  return true
  end

end

next:addEventListener("touch", next)

-----------------------------------------------------------------------------------------
--
-- Scene_Template.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

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
