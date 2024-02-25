#!/bin/bash

# Tentativa de conexão com o MySQL a cada 5 segundos, até 10 tentativas.
tentativa=1
while ! mysql -h "localhost" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SELECT 1" > /dev/null 2>&1; do
    echo "Tentando conectar ao MySQL: Tentativa $tentativa"
    sleep 5
    tentativa=$((tentativa+1))
    if [ $tentativa -gt 10 ]; then
        echo "Não foi possível conectar ao MySQL após várias tentativas."
        exit 1
    fi
done

echo "Conexão com MySQL bem-sucedida."
