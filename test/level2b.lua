-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--SCENE EVENT FUNCTIONS


local composer = require("composer")
player.x = 100000
local scene = composer.newScene()
print("level 2 puzzle has been created")

fps1 = 0
done2 =0
local flip1 =0
counter2 =0

function scene:create(event)
print("createscene method called")
local sceneGroup = self.view
	-- LEVEL BACKGROUND
local background = display.newImageRect("preview0.png", 340, 600)
background.x = display.contentCenterX
background.y = display.contentCenterY
sceneGroup:insert(background)




local chest = display.newImageRect("Chest.png", 20, 20)
chest.x = display.contentCenterX-5
chest.y = display.contentCenterY-75
chest.myName = "chest"
sceneGroup:insert(chest)



local player = display.newImageRect("player.png", 30, 30)
player.x = display.contentCenterX -75
player.y = display.contentCenterY +200
player.myName = "player"

local skelly = display.newImageRect("glowing skeleton.png", 60, 30)
skelly.x = 150
skelly.y = 380
sceneGroup:insert(skelly)
skelly.myName = "skelly"






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

-- ADD IF STATEMENTS

physics.addBody(skelly, "dynamic", {friction = 0, bounce=1, radius = 1})
skelly.gravityScale = 0

local skelly2 = display.newImageRect("glowing skeleton.png", 60, 30)
skelly2.x = 300
skelly2.y = 252
sceneGroup:insert(skelly2)
skelly2.myName = "skelly"
physics.addBody(skelly2, "dynamic", {friction = 0, bounce=1, radius = 1})
skelly2.gravityScale = 0


 --Check for collision
 local function onCollision2(event)
 	if(event.phase == "began") then
 	if(event.object1.myName =="player" and event.object2.myName=="chest") then
 	print(event.object1.myName)
 	print(event.object2.myName)
 	print("began")
 	event.phase="ended"
 	Runtime:removeEventListener("collision", onCollision2)
  done2 =1
 	composer.gotoScene("level2puzzle")
 	event.phase="ended"
 	elseif (event.object1.myName=="player" and event.object2.myName=="skelly") then
  done2 =1
   composer.gotoScene("GameOver")
   event.phase="ended"
   end

 	elseif (event.phase == "ended") then
 	print("ended")
 	end
 end


Runtime:addEventListener("collision", onCollision2)
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
 print("left button pressed")
 motionx = -speed;
  player.x = player.x + motionx;
 print(motionx)
 end
 left:addEventListener("touch",left)
-- When right arrow is touched, move character right
 function right:touch()
 motionx = speed;
  player.x = player.x + motionx;
 end
 right:addEventListener("touch",right)
 --When back arrow is touched, move character backwards
 function back:touch()
 motiony = speed;
   player.y = player.y + motiony;
 end
 back:addEventListener("touch", back)
 --When forward arrow is touched move character forwards
 function forward:touch()
 motiony = -speed;
   player.y = player.y + motiony;
 end
forward:addEventListener("touch", forward)

--function forward:touch()



  local function movePlayer2 (event)
 player.x = player.x + motionx;
 player.y = player.y + motiony;
motionx = 0;
motiony = 0;
end

local function MoveSkelly2( event )
  if(done2 ==0) then
      fps = fps +6;
      if(fps ==60 and flip1 ==0) then
        skelly.y = skelly.y + 5;
        fps =0
        counter2 = counter2+1
      elseif(fps==60 and flip1==1) then
        skelly.y = skelly.y -5;
        fps =0
        counter2 = counter2+1
      end
      if(skelly.y>500) then
        flip1 = 1
      end
      if(skelly.y<380) then
        flip1 = 0
      end

      --skelly2


      if(counter2>0 and counter2<3) then --up left
        skelly2.x = skelly2.x-2
        skelly2.y = skelly2.y-1
      end
      if(counter2>15 and counter2<18) then  --down left
        skelly2.x = skelly2.x-2
        skelly2.y = skelly2.y+1
        end
      if(counter2>30 and counter2<33) then  --down right
        skelly2.x = skelly2.x+2
        skelly2.y = skelly2.y+1
        end
      if(counter2>45 and counter2<48) then -- up right
        skelly2.x = skelly2.x+2
        skelly2.y = skelly2.y-1
        end
      if(counter2>60 )then
      counter2 =0
      end



  end
end

 Runtime:addEventListener("enterFrame", movePlayer2)
 Runtime:addEventListener("enterFrame", MoveSkelly2)

end












 --SCENE EVENT FUNCTIONS

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
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
