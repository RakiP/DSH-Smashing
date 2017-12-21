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
	@cd py && python3 kafkaConsumeSmashing.py &