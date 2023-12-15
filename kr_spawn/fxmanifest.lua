fx_version 'cerulean'
game       'gta5'
lua54      'yes'

resource_type 'gametype' { name = 'Tutorial Type!', }

--[[client_script 'foo.lua'-- For one file script]] 

client_scripts {
    'clients/client.lua',
    'clients/clientrespawn.lua'
}

server_scripts {
    'server/respawn.lua'
}