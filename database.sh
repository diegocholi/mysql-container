#!/bin/bash

# Restaura Banco de Dados
# Tentativa de conexão com o MySQL a cada 5 segundos, até 10 tentativas.
tentativa=1
while ! mysql -h "localhost" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SELECT 1" > /dev/null 2>&1; do
    sleep 5
    tentativa=$((tentativa+1))
    if [ $tentativa -gt 10 ]; then
        echo "Não foi possível conectar ao MySQL após várias tentativas."
        exit 1
    fi
done

# Agora, executa o comando de restauração.
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < /path/to/your/sqlfile.sql

echo "Backup restaurado com sucesso."
