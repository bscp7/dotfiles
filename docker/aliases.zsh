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
	# docker ps
	docker ps
}

dcup() {
	# docker-compose up
	docker-compose -p $1 up -d
}

dcdown() {
	# docker-compose down
	docker-compose -p $1 down
}

dilabels() {
	# docker inspect filtered by labels
	docker inspect $1 | jq '.[].Config.Labels'
}

dclogs() {
	# docker-compose logs
	docker-compose -p $1 logs $2
}