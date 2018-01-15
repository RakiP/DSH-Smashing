# DSH Smashing Dashboard

This docker spins up a dashboard in smashing and fills the tiles with the test results from the tenants.

1. Clone repo
2. execute: make
3. execute: make runonce
4. execute: make runkafka (if no kafka was running)
4. execute: make runall
5. execute: make open

The runall command will: 
* start up a listener which listens on topics "smashing" where the testresults are placed in json format. 
if new testresult is there, it is pushed to the appropriate tenant tile
* Runs the smashing server
* ensures docker.sock can be used (run docker inside docker)

All commands are run as daemon. For no daemon you may execute
"make runnod" and "make listennod"