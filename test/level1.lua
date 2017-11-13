-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--SCENE EVENT FUNCTIONS

print("level1 has been created and added to the scene")
local composer = require("composer")
composer.removeScene("Instructions")
local scene = composer.newScene()


---Test removal of previous scene
function scene:create(event)
local sceneGroup = self.view



-- LEVEL BACKGROUND
local background = display.newImageRect("preview1.png", 340, 600)
background.x = display.contentCenterX
background.y = display.contentCenterY
sceneGroup:insert(background)



local chest = display.newImageRect("Chest.png", 20, 20)
chest.x = display.contentCenterX-5
chest.y = display.contentCenterY-75
sceneGroup:insert(chest)


player = display.newImageRect("player.png", 30, 30)
player.x = display.contentCenterX
player.y = display.contentCenterY


--PLAYER PHYSICS
local physics = require("physics")
physics.start()

 _W = display.contentWidth; -- Get the width of the screen
 _H = display.contentHeight; -- Get the height of the screen
 motionx = 0; -- Variable used to move character along x axis
 motiony = 0
 speed = 10; -- Set Walking Speed

physics.addBody(player, "dynamic", {friction = 0, bounce=0})
player.gravityScale = 0
physics.addBody(chest, "static",{ radius=10, bounce=0.1 } )

--Check for collision
local function onCollision(event)
	if(event.phase == "began") then
	print("began")
	event.phase="ended"
	Runtime:removeEventListener("collision", onCollision)
	composer.gotoScene("level1puzzle")
	event.phase="ended"
	elseif (event.phase == "ended") then
	print("ended")
	end
end

Runtime:addEventListener("collision", onCollision)
-- Add left joystick button
 local left = display.newImageRect("arrowleft.png",20,20)
 left.x = 100; left.y = 345;
 left:setFillColor(blue)
sceneGroup:insert(left)
-- Add right joystick button
 local right = display.newImageRect("arrowright.png",20,20)
 right.x = _W - 100; right.y = 345;
sceneGroup:insert(right)
 --Add back joystick button
 local back = display.newImageRect("arrowdown.png",20,20)
 back.y = 400; back.x = display.contentCenterX
 back:setFillColor(white)
 sceneGroup:insert(back)
 --Add forward joystick button
 local forward = display.newImageRect("arrowup.png",20,20)
 forward.y = 300; forward.x = display.contentCenterX
 forward:setFillColor(gray)
 sceneGroup:insert(forward)



 -- When left arrow is touched, move character left
 function left:touch()
 motionx = -speed;
 print(motionx)
 end
 left:addEventListener("touch",left)
-- When right arrow is touched, move character right
 function right:touch()
 motionx = speed;
 end
 right:addEventListener("touch",right)
 --When back arrow is touched, move character backwards
 function back:touch()
 motiony = speed;
 end
 back:addEventListener("touch", back)
 --When forward arrow is touched move character forwards
 function forward:touch()
 motiony = -speed;
 end
forward:addEventListener("touch", forward)




  local function movePlayer (event)
 player.x = player.x + motionx;
 player.y = player.y + motiony;
motionx = 0;
motiony = 0;
--Detect for player in range of chest

--composer.gotoScene("scene2")
--end
end
 Runtime:addEventListener("enterFrame", movePlayer)


end



function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
	--TO RUN WHEN SCENE IS OFF SCREEN BUT WILL COME ON
	elseif (phase == "did") then
	--TO RUN IF THE SCENE IS ALREADY ON THE SCREEN
	end
end

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

function scene:destroy( event )
    local sceneGroup = self.view
	Runtime:removeEventListener("collision", onCollision)
    -- Code here runs prior to the removal of scene's view
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
