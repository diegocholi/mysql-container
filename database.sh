# Restaura Banco de Dados
# Tentativa de conexão com o MySQL a cada 5 segundos, até 10 tentativas.
tentativa=1
while ! mysql -h $DB_HOST -u "$DB_USERNAME" -p"$DB_PASSWORD" -e "SELECT 1" > /dev/null 2>&1; do
    sleep 5
    echo "Tentando conectar ao MySQL: Tentativa $tentativa"
    tentativa=$((tentativa+1))
    if [ $tentativa -gt 10 ]; then
        echo "Não foi possível conectar ao MySQL após várias tentativas."
        exit 1
    fi
done

# Agora, executa o comando de restauração.
mysql -h $DB_HOST -u "$DB_USERNAME" -p"$DB_PASSWORD" "$DB_DATABASE" < /home/gta/server/mkbase.sql

echo "Backup restaurado com sucesso."
