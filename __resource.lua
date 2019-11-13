resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

Version "2.0 - By Trickxqster"

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'server/main.lua',
	'config.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'client/main.lua',
	'config.lua'
}

dependencies {
	'es_extended',
	'mythic_notify'
}
