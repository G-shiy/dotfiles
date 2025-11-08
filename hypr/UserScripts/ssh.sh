#!/bin/bash

# Verificar status SSH
if [ -n "$SSH_CLIENT" ]; then
    SSH_STATUS="connected"
    SSH_COLOR="#00ff00"
else
    SSH_STATUS="not connected"
    SSH_COLOR="#ff0000"
fi

# Exibir
echo "<span color='$SSH_COLOR'>SSH: $SSH_STATUS </span>"
