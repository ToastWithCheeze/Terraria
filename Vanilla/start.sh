#!/bin/bash
set -euo pipefail

start="./TerrariaServer -x64 -config /config/serverconfig.txt -banlist /config/banlist.txt"

#Add default config files
if [ ! -f "config/serverconfig.txt" ]; then
    cp ./serverconfig-default.txt /config/serverconfig.txt
fi

if [ ! -f "/config/banlist.txt" ]; then
    touch /config/banlist.txt
fi

# Link worlds folder to /config
if [ ! -s "/root/.local/share/Terraria/Worlds" ]; then
    mkdir -p /root/.local/share/Terraria
    ln -sT /config /root/.local/share/Terraria/Worlds
fi

echo "Starting container, start: $start $@"
exec $start $@
