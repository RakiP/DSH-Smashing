build:
	@docker build -t dockersm --network=host .

run:
	@docker-compose up -d

runnod:
	@docker-compose up

stop:
	@docker stop dockersm

chown:
	@sudo chmod 777 /var/run/docker.sock

runonce:
	@sudo chmod 777 changeme.sh && ./changeme.sh

listen:
	@docker run -ti --rm -d -v PATHTOLISTENER:/py dockerkj python3 kafkaConsumeSmashing.py

listennod:
	@docker run -ti --rm -v PATHTOLISTENER:/py dockerkj python3 kafkaConsumeSmashing.py

runall: chown listen run

runkafka:
	@docker run --rm -d -p 2181:2181 -p 3030:3030 -p 8081:8081 -p 8082:8082 -p 8083:8083 -p 9092:9092 --net=host -e ADV_HOST=IPADDRESS --name dkafka landoop/fast-data-dev

stopkafka:
	@docker stop dkafka