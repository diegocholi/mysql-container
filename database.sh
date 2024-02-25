#!/bin/bash

# Restaura Banco de Dados
# Tentativa de conexão com o MySQL a cada 5 segundos, até 10 tentativas.
tentativa=1
while ! mysqladmin ping -h "db" --silent; do
    sleep 5
    tentativa=$((tentativa+1))
    if [ $tentativa -gt 10 ]; then
        echo "Não foi possível conectar ao MySQL após várias tentativas."
        exit 1
    fi
done

# Agora, executa o comando de restauração.
mysql -u $DB_USERNAME -p$DB_PASSWORD $DB_DATABASE < /home/gta/server/mkbase.sql

echo "Backup restaurado com sucesso."
