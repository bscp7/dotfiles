#!/bin/sh
docker_prune() {
	docker system prune --volumes -fa
}

docker_stop() {
	echo "Stop and remove container $1"
	docker stop $1 || true
	docker rm $1 || true
}

dps() {
	docker ps
}

dcup() {
	docker-compose up -d
}

dcdown() {
	docker-compose down
}