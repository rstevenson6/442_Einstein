-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
print("Main Screen has Run")
audio.setMaxVolume( 0.3, { channel=1 } )
local backgroundMusic = audio.loadSound( "CAS_theme.wav" )
local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1 } )

local options={effect="crossFade", time = 3000}
display.setStatusBar( display.HiddenStatusBar )
local composer = require( "composer" )
local scene = composer.gotoScene("Title", options)

-- Path for the file to read
local path = system.pathForFile( "testing.txt", system.DocumentsDirectory )

-- Open the file handle
local file, errorString = io.open( path, "r" )

if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
else
    -- Read data from file
    local contents = file:read( "*a" )
    -- Output the file contents
    print( "Contents of " .. path .. "\n" .. contents )
    -- Close the file handle
    io.close( file )
end

file = nil

saveData = " "

-----------------------------------------------------------------------------------------
--
-- Scene_Template.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )

local scene = composer.newScene()



return scene
