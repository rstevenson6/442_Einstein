local composer = require("composer")
local scene = composer.newScene()
composer.hideOverlay()
_G.win=false
local ced = require "scripts.caseErrorDetect"
ced.promoteToError()


math.randomseed(os.time());


local ssk 		= require "ssk.loadSSK"
local game 		= require "scripts.game"
local soundM	= require "scripts.sound"


display.setStatusBar(display.HiddenStatusBar)  -- Hide that pesky bar
io.output():setvbuf("no") -- Don't use buffer for console messages

soundM.init()
game.create()

print(_G.win)

--local function onGameWin(event)
--print(_G.win)
--if(_G.win==false) then
--Runtime:removeEventListener("enterFrame", onGameWin)
--composer.gotoScene("Title")
--end
--end
--Runtime:addEventListener("enterFrame", onGameWin)



return scene
