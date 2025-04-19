component_name=dispatch
source common.sh

dnf install golang -y

app_pre_setup

go mod init ${component_name}
go get
go build

systemd_setup