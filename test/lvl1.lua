-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--SCENE EVENT FUNCTIONS


local composer = require("composer")
local scene = composer.newScene()


---Test removal of previous scene
function scene:createScene(event)
print("blah")
local sceneGroup = self.view
end

scene:createScene(scene)
display.setStatusBar(display.HiddenStatusBar)
local group = display.newGroup()




-- LEVEL BACKGROUND
local background = display.newImageRect("preview1.png", 340, 600)
background.x = display.contentCenterX
background.y = display.contentCenterY



local chest = display.newImageRect("Chest.png", 20, 20)
chest.x = display.contentCenterX-5
chest.y = display.contentCenterY-75
chest.myName = "chest"



local player = display.newImageRect("player.png", 30, 30)
player.x = display.contentCenterX
player.y = display.contentCenterY
player.myName = "player"






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
	composer.gotoScene("scene2")
  
	elseif (event.phase == "ended") then
	print("ended")
	end
end

Runtime:addEventListener("collision", onCollision)
-- Add left joystick button
 local left = display.newImageRect("arrowleft.png",20,20)
 left.x = 100; left.y = 345;
 left:setFillColor(blue)

-- Add right joystick button
 local right = display.newImageRect("arrowright.png",20,20)
 right.x = _W - 100; right.y = 345;

 --Add back joystick button
 local back = display.newImageRect("arrowdown.png",20,20)
 back.y = 400; back.x = display.contentCenterX
 back:setFillColor(white)
 --Add forward joystick button
 local forward = display.newImageRect("arrowup.png",20,20)
 forward.y = 300; forward.x = display.contentCenterX
 forward:setFillColor(gray)



 -- When left arrow is touched, move character left
 function left:touch()
 motionx = -speed;
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



 --SCENE EVENT FUNCTIONS

 --create scene
function scene:create(event)
	local sceneGroup = self.view
end

--show scene
function scene:show(event)
	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
	--TO RUN WHEN SCENE IS OFF SCREEN BUT WILL COME ON
	elseif (phase == "did") then
	--TO RUN IF THE SCENE IS ALREADY ON THE SCREEN
	end
end
--hide the scene
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

scene:addEventListener( "create", scene )
return scene
