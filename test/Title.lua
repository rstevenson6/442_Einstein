-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
-- Code


--CREATE SCENE FUNCTION---------------------------------------------------------------
function scene:create(event)
sceneGroup = self.view
print("Title Screen has been created and added to the scene")
local background = display.newImage("ruin.png")
background.x=200
background.y=320
sceneGroup:insert(background)


local bolt = display.newImage("blitze.png")
bolt.x = 200
bolt.y = 100
sceneGroup:insert(bolt)

local trail = display.newImage("trail_00.png")
trail.x = 200
trail.y = 100
sceneGroup:insert(trail)

local textTitle = display.newText( "The Peril Of ", 160, 55, "Matura MT Script Capitals", 40)
local textTitle2 = display.newText( "Einstein", 160, 135, "Matura MT Script Capitals", 40 )
sceneGroup:insert(textTitle)
sceneGroup:insert(textTitle2)


local start = display.newRect(160,355,180,40)
local cred = display.newRect(160, 450, 180, 40)
start.alpha=0.01;
cred.alpha=0.01;
sceneGroup:insert(start)
sceneGroup:insert(cred)

local myText1 = display.newText( "Play", 160, 357, "Matura MT Script Capitals", 40 )
local myText2 = display.newText( "Credits", 160, 452, "Matura MT Script Capitals", 40 )
sceneGroup:insert(myText1)
sceneGroup:insert(myText2)


local function goToStart()
	local options={effect="crossFade", time = 1000}
	composer.gotoScene("story", options)
end


local function goToCredits()
    composer.gotoScene("creds")
end

cred:addEventListener("tap", goToCredits)
start:addEventListener("tap", goToStart)

------------------------------------------------------------------------------------------
end
--END OF CREATE SCENE
-------------------------------------------------------------------------------------------


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
