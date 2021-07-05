USER=thomasj27
REPO=controlled-env
PORT=27170
IM_NAME=${USER}/${REPO}

build:
	docker build -t ${IM_NAME} .

run:
	docker run -it -p ${PORT}:${PORT} --volume $(shell pwd)/results:/usr/src/server/results ${IM_NAME} 

push:
	docker push ${IM_NAME}