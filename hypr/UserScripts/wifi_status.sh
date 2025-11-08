#!/bin/bash

# Script para Waybar - WiFi dinâmico
# Requer: nmcli (NetworkManager)

wifi_status=$(nmcli -t -f active,ssid,signal dev wifi | grep '^yes' | head -n 1)

if [ -z "$wifi_status" ]; then
  echo '{"text": "󰤭", "tooltip": "Sem conexão", "class": "wifi-disconnected"}'
  exit 0
fi

IFS=":" read -r active ssid signal <<< "$wifi_status"

# Determinar o ícone conforme o sinal
if [ "$signal" -ge 80 ]; then
  icon="󰤨 "   # Excelente
elif [ "$signal" -ge 60 ]; then
  icon="󰤥 "   # Bom
elif [ "$signal" -ge 40 ]; then
  icon="󰤢 "   # Médio
elif [ "$signal" -ge 20 ]; then
  icon="󰤟 "   # Fraco
else
  icon="󰤯 "   # Quase sem sinal
fi

tooltip="Conectado a: $ssid\nSinal: $signal%"
echo "{\"text\": \"$icon\", \"tooltip\": \"$tooltip\", \"class\": \"wifi\"}"
