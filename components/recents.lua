--[[--
 @package   SODplayer
 @filename  recents.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      31.07.2020 02:24:50 -04
--]]

recents_item = conf.history.recents

function create_submenu(depth)
	if depth < 1 then return nil end
	local menu_recent = Gtk.Menu()
	for i, uri in pairs(recents_item) do
        filename = utils:path_name(uri)['name']
        if i > recent_item_max then
			break
        end
        ui.menu_archive:add({menu_archive_recent})
		local item = Gtk.MenuItem {
			label = ("%d. %s"):format(i, filename),
			submenu = create_submenu(depth - 1, true),
			on_button_press_event = function ()
				-- @TODO: esto se puede mejorar
			    stop_media()
			    play.uri = 'file://' .. uri
			    play_media()
			end
		}
		menu_recent:append(item)
	end
	return menu_recent
end

if #recents_item < 1 then
    ui.menu_archive:popdown({menu_archive_recent})
    return
end 

menu_archive_recent.submenu = create_submenu(1)

