build:
	@docker build -t dockersm --network=host .

run:
	@docker-compose up -d

runnod:
	@docker-compose up

stop:
	@docker stop dockersm

chown:
	@chmod 777 /var/run/docker.sock

listen:
	@docker run -ti --rm -d -v /home/rakeshlaptop/Documents/projects/DSH/Smashing/py:/py dockerkj python3 kafkaConsumeSmashing.py

runkafka:
	@docker run --rm -d -p 2181:2181 -p 3030:3030 -p 8081:8081 -p 8082:8082 -p 8083:8083 -p 9092:9092 --net=host -e ADV_HOST=172.22.0.1 --name dkafka landoop/fast-data-dev

stopkafka:
	@docker stop dkafka