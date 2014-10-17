# Piggybank-Zookeeper
	
	- Zookeeper 3.4.6 running on Docker

	docker pull raycoding/piggybank-zookeeper

  - Start ZooKeeper, and define a name

	docker run -name zk_instance -p 2181:2181 -p 2888:2888 -p 3888:3888 raycoding/piggybank-zookeeper