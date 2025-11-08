#!/bin/bash

# Pegar IP público
PUBLIC_IP=$(curl -s https://ipinfo.io/ip)
[ -z "$PUBLIC_IP" ] && PUBLIC_IP="N/A"

# Cor
IP_COLOR="#03fcfc"

# Exibir
echo "<span color='$IP_COLOR'>$PUBLIC_IP </span>"
