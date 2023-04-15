fx_version 'cerulean'

game { 'gta5' }

author 'Yorick'
description 'Simple script that is supposed to serve as something like a "antilag" kind of thing for FiveM'
version '1.0.0'

ui_page('html/index.html')

client_scripts {
    'config.lua',
    'client.lua'
}

server_script 'server.lua'

files {
    'html/index.html',
    'html/sounds/1.ogg',
    'html/sounds/2.ogg',
    'html/sounds/3.ogg',
    'html/sounds/4.ogg',
    'html/sounds/5.ogg',
    'html/sounds/6.ogg',
}
