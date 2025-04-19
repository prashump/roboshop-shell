if [ -z "${MYSQL_ROOT_PASSWORD}" -a -z "$1" ]; then
  echo Input password is missing
  exit
fi

if [ -n "${MYSQL_ROOT_PASSWORD}" ]; then
  PASSWORD=$MYSQL_ROOT_PASSWORD
fi

if [ -n "$1" ];then
  PASSWORD=$1
fi

dnf install mysql-server -y
systemctl enable mysqld
systemctl start mysqld

mysql_secure_installation --set-root-pass $PASSWORD
