-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )

local scene = composer.newScene()
-- Code


local background = display.newImage("ruin.png")
background.x=200
background.y=320
local bolt = display.newImage("blitze.png")

bolt.x = 200
bolt.y = 100

local trail = display.newImage("trail_00.png")

trail.x = 200
trail.y = 100


local myText = display.newText( "The Peril Of ", 160, 55, "Matura MT Script Capitals", 40 )
local myText = display.newText( "Einstein", 160, 135, "Matura MT Script Capitals", 40 )


local start = display.newRect(160,355,180,40)
local cred = display.newRect(160, 450, 180, 40)
start.alpha=0.01;
cred.alpha=0.01;
local myText = display.newText( "Play", 160, 357, "Matura MT Script Capitals", 40 )
local myText = display.newText( "Credits", 160, 452, "Matura MT Script Capitals", 40 )



function start:touch(event)
--transition
  if event.phase == "began" then
  composer.gotoScene( "story" )
  return true
  end

end
start:addEventListener("touch", start)

function cred:touch(event)
--transition
  if event.phase == "began" then

    composer.gotoScene( "creds" )
  return true
  end

end
cred:addEventListener("touch", cred)


-----------------------------------------------------------------------------------------
--
-- Scene_Template.lua
--
-----------------------------------------------------------------------------------------
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
