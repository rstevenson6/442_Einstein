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

fps = 0
fps2 =0
done1 =0
local flip1 =0
counter2 =0
counter3=0


local skelly = display.newImageRect("glowing skeleton.png", 60, 30)
skelly.x = 110
skelly.y = 400
sceneGroup:insert(skelly)

skelly.myName = "skelly"


local chest = display.newImageRect("Chest.png", 20, 20)
chest.x = display.contentCenterX-5
chest.y = display.contentCenterY-75
sceneGroup:insert(chest)
chest.myName = "chest"

player = display.newImageRect("player.png", 30, 30)
player.x = display.contentCenterX
player.y = 475
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


-- ADD IF STATEMENTS

physics.addBody(skelly, "dynamic", {friction = 0, bounce=1, radius = 1})
skelly.gravityScale = 0


local skelly2 = display.newImageRect("glowing skeleton.png", 60, 30)
skelly2.x = 278
skelly2.y = 252
sceneGroup:insert(skelly2)
skelly2.myName = "skelly"
physics.addBody(skelly2, "dynamic", {friction = 0, bounce=1, radius = 1})
skelly2.gravityScale = 0




local skelly3 = display.newImageRect("glowing skeleton.png", 60, 30)
skelly3.x = 120
skelly3.y = 140
sceneGroup:insert(skelly3)
skelly3.myName = "skelly"
physics.addBody(skelly3, "dynamic", {friction = 0, bounce=1, radius = 1})
skelly3.gravityScale = 0




local function blinkenLighten(event)
  local blinkSpeed = 300 -- bigger value means slower blinking
  chest.alpha = (1+math.sin(event.time/blinkSpeed))

if(player.x == display.contentCenterX and player.y == 475) then
	player.alpha = (1+math.sin(event.time/100))
  end
  if(player.x ~= display.contentCenterX or player.y ~= 475) then
	player.alpha = 1000
  end



end -- BlinkenLighten

Runtime:addEventListener("enterFrame", blinkenLighten)

--Check for collision
local function onCollision(event)
	if(event.phase == "began") then
	if(event.object1.myName =="player" and event.object2.myName=="chest") then
	print(event.object1.myName)
	print(event.object2.myName)
	print("began")
	event.phase="ended"
	Runtime:removeEventListener("collision", onCollision)
  Runtime:removeEventListener("enterFrame", MoveSkelly)
  done1 = 1
	composer.gotoScene("level1puzzle")
	event.phase="ended"
	elseif (event.object1.myName=="player" and event.object2.myName=="skelly") then
  done1 = 1
  composer.gotoScene("GameOver")
  event.phase="ended"
  end

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
 print(player.x, player.y)
 end
 left:addEventListener("touch",left)
-- When right arrow is touched, move character right
 function right:touch()
  print(player.x, player.y)
 motionx = speed;
 end
 right:addEventListener("touch",right)
 --When back arrow is touched, move character backwards
 function back:touch()
  print(player.x, player.y)
 motiony = speed;
 end
 back:addEventListener("touch", back)
 --When forward arrow is touched move character forwards
 function forward:touch()
  print(player.x, player.y)
 motiony = -speed;
 end
forward:addEventListener("touch", forward)




local function movePlayer (event)
 player.x = player.x + motionx;
 player.y = player.y + motiony;
 motionx = 0;
 motiony = 0;

end

local function MoveSkelly( event )
  if(done1 ==0) then
      fps = fps +6;


      --Skelly1
      if(fps ==60 and flip1 ==0) then
        skelly.x = skelly.x + 5;
        fps =0
        counter2 = counter2+1
        counter3 = counter3+1


      elseif(fps==60 and flip1==1) then
        skelly.x = skelly.x -5;
        fps =0
        counter2 = counter2+1
        counter3 = counter3+1
      end
      if(skelly.x>200) then
        flip1 = 1
      end
      if(skelly.x<110) then
        flip1 = 0
        end

      --skelly2

      if(counter2<2)  then
        skelly2.x = skelly2.x-3
      end
      if(counter2>15 and counter2<18) then --down
        skelly2.y = skelly2.y+3
      end
      if(counter2>30 and counter2<33) then  --left
        skelly2.x = skelly2.x-3
        end
      if(counter2>45 and counter2<48) then  --up
        skelly2.y = skelly2.y-3
        end
      if(counter2>60 and counter2<63) then --left
        skelly2.x = skelly2.x-3
        end
      if(counter2>75 and counter2<78) then --down
        skelly2.y = skelly2.y+3
      end
      if(counter2>90 and counter2<93) then --right
        skelly2.x = skelly2.x+3
        end
      if(counter2>105 and counter2<108) then  --up
        skelly2.y = skelly2.y-3
        end
      if(counter2>120 and counter2<123) then --right
        skelly2.x = skelly2.x+3
      end
      if(counter2>135 )then
      counter2 =15
      end

      --skelly3


        if(counter3>0 and counter3<3) then --down
          skelly3.y = skelly3.y+3
        end
        if(counter3>15 and counter3<18) then  --right
          skelly3.x = skelly3.x+4
          end
        if(counter3>30 and counter3<33) then  --up
          skelly3.y = skelly3.y-3
          end
        if(counter3>45 and counter3<48) then -- up right
          skelly3.x = skelly3.x-4
          end
        if(counter3>60 )then
        counter3 =0
        end
  end
end





--Detect for player in range of chest

--composer.gotoScene("scene2")
--end

 Runtime:addEventListener("enterFrame", movePlayer)
 Runtime:addEventListener("enterFrame", MoveSkelly )



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
