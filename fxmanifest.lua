fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

author 'zRxnx'
description 'Advanced personal menu system'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'configuration/*.lua',
    'shared/*.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

files {
    'files/**'
}

dependencies {
    'es_extended',
	'ox_lib'
}