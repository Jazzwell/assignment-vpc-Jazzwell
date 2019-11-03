ACTION=${1}

function create_rds() {

touch "rds-message.txt"
nc -vz ecotech-db1.cluster-cjhhwyoqmaag.us-east-1.rds.amazonaws.com 3306 >> rds-message.txt

touch "ecoweb1-identity.json"
http://169.254.169.254/latest/dynamic/instance-identity/document/ >> ecoweb1-identity.json
}

function version() {
echo 0.1.0
}

function help() {
echo "enter -c or --create to create a file with RDS info, -v or --version to display current working version"
}

case "$ACTION" in
	-c|--create)
		create_rds
		;;
	-v|--version)
		version
		;;
	"")
		help
esac
