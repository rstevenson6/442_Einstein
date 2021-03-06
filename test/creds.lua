-----------------------------------------------------------------------------------------
--
-- creds.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )

local scene = composer.newScene()



-- create()
function scene:create( event )
    local sceneGroup = self.view

local background = display.newImage("ruin.png")
background.x=200
background.y=320
sceneGroup:insert(background)

local bolt = display.newImage("blitze.png")
bolt.x = 200
bolt.y = 100
sceneGroup:insert(bolt)


local myText = display.newText( "Credits", 160, 0, "Matura MT Script Capitals", 30 )


local myText1 = display.newText( "Developed & Designed by ", 160, 50, "Matura MT Script Capitals", 12)
local myText2 = display.newText( "Max Marchand & Ross Stevenson", 160, 75, "Matura MT Script Capitals", 12)
local myText3 = display.newText( "", 160, 100, "Matura MT Script Capitals", 12)
local myText4 = display.newText( "Images:", 160, 125, "Matura MT Script Capitals", 12)
local myText5 = display.newText( "https://opengameart.org/content/lightning-effect", 160, 150, "Matura MT Script Capitals", 12)
local myText6 = display.newText( "https://opengameart.org/content/trail", 160, 175, "Matura MT Script Capitals", 12)
local myText7 = display.newText( "https://opengameart.org/content/chest-and-key", 160, 200, "Matura MT Script Capitals", 12)
local myText8 = display.newText( "https://opengameart.org/content/lpc-house-interior-and-decorations", 160, 225, "Matura MT Script Capitals", 12)
local myText9 = display.newText( "https://opengameart.org/content/samurai-animated", 160, 250, "Matura MT Script Capitals", 12)
local myText10 = display.newText( "https://opengameart.org/content/ruined-city-background", 160, 275, "Matura MT Script Capitals", 12)
local myText11 = display.newText( "", 160, 300, "Matura MT Script Capitals", 12)
local myText12 = display.newText( "Puzzles:", 160, 325, "Matura MT Script Capitals", 12)
local myText13 = display.newText( "https://github.com/roaminggamer/CoronaGeek/tree/master/Hangouts/ICanMakeThat", 160, 350, "Matura MT Script Capitals", 12)
local myText14 = display.newText( "", 160, 375, "Matura MT Script Capitals", 12)
local myText15 = display.newText( "Music by Craig Stevenson", 160, 400, "Matura MT Script Capitals", 12)
local myText16 = display.newText( "", 160, 425, "Matura MT Script Capitals", 12)
local myText17 = display.newText( "Project falls under share-alike license", 160, 450, "Matura MT Script Capitals", 12)

sceneGroup:insert(myText)
sceneGroup:insert(myText1)
sceneGroup:insert(myText2)
sceneGroup:insert(myText3)
sceneGroup:insert(myText4)
sceneGroup:insert(myText5)
sceneGroup:insert(myText6)
sceneGroup:insert(myText7)
sceneGroup:insert(myText8)
sceneGroup:insert(myText9)
sceneGroup:insert(myText10)
sceneGroup:insert(myText11)
sceneGroup:insert(myText12)
sceneGroup:insert(myText13)
sceneGroup:insert(myText14)
sceneGroup:insert(myText15)
sceneGroup:insert(myText16)
sceneGroup:insert(myText17)



local back = display.newRect(160, 500, 180, 20)
back.alpha=0.01;
sceneGroup:insert(back)
local backText = display.newText( "Back", 160, 502, "Matura MT Script Capitals", 20 )
sceneGroup:insert(backText)
function back:touch(event)
--transition
  if event.phase == "began" then
    composer.gotoScene( "Title" )
  return true
  end

end
back:addEventListener("touch", back)


end
-- Your code here


-----------------------------------------------------------------------------------------
--
-- Scene_Template.lua
--
-----------------------------------------------------------------------------------------



-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------




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
