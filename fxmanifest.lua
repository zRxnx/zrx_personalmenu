fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

author 'zRxnx'
description 'Advanced personal menu system'
version '2.0.1'

dependencies {
    'es_extended',
	'ox_lib',
    'oxmysql'
}

shared_scripts {
    '@ox_lib/init.lua',
    'configuration/config.lua',
    'configuration/strings.lua',
    'shared/*.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'configuration/webhook.lua',
    'server/*.lua'
}

files {
    'files/*.dat'
}