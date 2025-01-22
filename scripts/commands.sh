#!/bin/sh

# O Shell irá encerrar a execução do script se algum comando falhar

set -e

while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
  echo "Aguardando o banco de dados estar disponível($POSTGRES_HOST $POSTGRES_PORT)..."  
  sleep 0.1
done

echo "Banco de dados disponível! ($POSTGRES_HOST $POSTGRES_PORT)"

python manage.py collectstatic
python manage.py migrate
python manage.py runserver