-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

print("story has been created")
  s2 = system.getTimer()
local composer = require( "composer" )
composer.removeScene("Title")
local scene = composer.newScene()


function scene:create(event)
	local sceneGroup = self.view


	local background = display.newImage("ruin.png")
	background.x=200
	background.y=320
	sceneGroup:insert(background)


local myText1 = display.newText( "Story", 160, 0, "Matura MT Script Capitals", 30)
local myText2 = display.newText( "The great scientist, Albert Einstein", 160, 50, "Matura MT Script Capitals", 18)
local myText3 = display.newText( "has been kidnapped by an unknown", 160, 100, "Matura MT Script Capitals", 18)
local myText4 = display.newText( "villian. This unknown adversary has ", 160, 150, "Matura MT Script Capitals", 18)
local myText5 = display.newText( "travelled through space and time to", 160, 200, "Matura MT Script Capitals", 18)
local myText6 = display.newText( "take him, causing a disruption in the", 160, 250, "Matura MT Script Capitals", 18)
local myText7 = display.newText( "space-time continuum. Scale the tower ", 160, 300, "Matura MT Script Capitals", 18)
local myText8 = display.newText( "and complete the puzzles to hold the", 160, 350, "Matura MT Script Capitals", 18)
local myText9 = display.newText( "universe together.", 160, 400, "Matura MT Script Capitals", 18)
local myText10 = display.newText( "Before its too late...", 160, 450, "Matura MT Script Capitals", 24)
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
myText10:setFillColor("red")
myText1.alpha = 0
myText2.alpha = 0
myText3.alpha = 0
myText4.alpha = 0
myText5.alpha = 0
myText6.alpha = 0
myText7.alpha = 0
myText8.alpha = 0
myText9.alpha = 0
myText10.alpha = 0
transition.fadeIn(myText1,{delay=1000,time=2000})
transition.fadeIn(myText2,{delay=2000,time=2000})
transition.fadeIn(myText3,{delay=3000,time=2000})
transition.fadeIn(myText4,{delay=4000,time=2000})
transition.fadeIn(myText5,{delay=5000,time=2000})
transition.fadeIn(myText6,{delay=6000,time=2000})
transition.fadeIn(myText7,{delay=7000,time=2000})
transition.fadeIn(myText8,{delay=8000,time=2000})
transition.fadeIn(myText9,{delay=9000,time=2000})
transition.fadeIn(myText10,{delay=11000,time=2000})



local next = display.newRect(160,500,180,40)
next.alpha=0.01;
sceneGroup:insert(next)
local myText = display.newText( "Next", 160, 507, "Matura MT Script Capitals", 20 )
sceneGroup:insert(myText)

function next:tap(event)
  local scene = composer.gotoScene("Instructions")

    f2 = system.getTimer()
    t2 = f2-s2
    t2 = t2/1000
    -- Path for the file to write
    local path = system.pathForFile( "storyTime.txt", system.DocumentsDirectory )

    -- Open the file handle
    local file, errorString = io.open( path, "w" )

    if not file then
        -- Error occurred; output the cause
        print( "File error: " .. errorString )
    else
        -- Write data to file
        file:write( t2 )
        -- Close the file handle
        io.close( file )
    end
end

next:addEventListener("tap", next)
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
