if [ -z "${MYSQL_ROOT_PASSWORD}" -a -z "$1" ]; then
  echo input password is missing
  exit 1
fi

if [ -n "${MYSQ_ROOT_PASSWORD}" ]; then
  PASSWORD=${MYSQ_ROOT_PASSWORD}
fi

if [ -n "$1" ]; then
  PASSWORD=$1
fi

dnf install mysql-server -y

systemctl enable mysqld
systemctl start mysqld

mysql_secure_installation --set-root-pass $PASSWORD