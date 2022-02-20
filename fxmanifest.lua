fx_version 'bodacious'
game 'gta5'

description 'Server Ad System For ESX'

version '3.0.0'

shared_scripts {
    './config.lua',
		'@es_extended/imports.lua',
}

client_scripts {
	'@es_extended/locale.lua',
  './client/main.lua',
}

server_scripts {
	'@es_extended/locale.lua',
	'./server/main.lua'
}

dependencies {
	'es_extended',
	'mythic_notify'
}

