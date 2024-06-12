fx_version      'cerulean'
game            'gta5'
name            'cc_base'
lua54           'yes'
author          'f0rs4keN'
description     'https://discord.gg/FhzQ7RXJ8C'
version         '1.0.1'

shared_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/imports.lua',
  'config.lua'
}
server_scripts {
  '@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
  'server.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client.lua'
}
