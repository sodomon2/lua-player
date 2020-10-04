--[[--
 @package   SODplayer
 @filename  SODPlayer-app.lua
 @version   2.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      01.10.2020 18:21:47 -04
--]]

function app:on_activate()
    ui.main_window:show_all()
end

function app:on_open(files)
    file = files[1] and files[1]:get_parse_name()
    if(file) then
        if (string.find(file, '://')) then
            uri = file
        else
            uri = 'file://' .. file
        end
    end
    print('Playing', uri)
    ui.main_window:show_all()
    play.uri = uri
    play_media()
end


