fx_version "cerulean"

description "Zahya Dev Discord : https://discord.gg/mp6krbdyAN"
author "Zahya Dev"
version '1.0.0'

lua54 'yes'

repository 'https://github.com/hamada65/esx_antiGiveWeapons/'

games {
  "gta5",
}

client_scripts {
  "client/**/*"
}
server_scripts {
  "server/**/*",
  "config_webhook.lua"
}

shared_scripts {
  "config.lua"
}