set -e

if [ -z "$1" ]; then
  echo DB password is missing
  exit 1
fi

component_name=shipping
source common.sh
java

dnf install mysql -y
for file in schema app-user master-data; do
  mysql -h mysql-dev.prashumps.online -uroot -p"$1" < /app/db/${file}.sql
done

systemd_setup
