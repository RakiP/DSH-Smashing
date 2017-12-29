1. sudo make
2. adjust makefile to have the correct ip address of your environment in the runkafka command (ADV_HOST).
3. adjust py/kafkaConsumeSmashing.py te variabe ipAddress to the correct ip address of your environment
4. make runkafka
5. sudo make run. Now the DSH smashing dashboard is started on port localhost:5000 and a listener is run in the background inside the docker