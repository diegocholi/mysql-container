# mysql-container 
container docker-compose mysql

## Caso queira executar um script SH

    volumes:
      - ./database.sh:/docker-entrypoint-initdb.d/database.sh
      - ./mkbase.sql:/docker-entrypoint-initdb.d/mkbase.sql
