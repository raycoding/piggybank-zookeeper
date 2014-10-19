# Zookeeper on Docker
	
Zookeeper 3.4.6 running on Docker with Exhibitor 1.5.1
`docker pull raycoding/piggybank-zookeeper`

### Starting ZooKeeper

	- Exhibitor is a supervisory process that manages each of your ZooKeeper server processes [Read more](https://github.com/Netflix/exhibitor)
	- Define a name for the zookeeper instance,map the ports and pass the required configurations. There are two ways we can start zookeeper depending on our requirments
  - Way 1, Zookeeper + Exhibitor without s3backup for shared configurations
		`docker run -name zookeeper -p 2181:2181 -p 2888:2888 -p 3888:3888 -e HOSTNAME={hostname for eg. 127.0.0.1} raycoding/piggybank-zookeeper`
  - or Way 2, Zookeeper + Exhibitor with s3backup for shared configurations `docker run -name zookeeper -p 2181:2181 -p 2888:2888 -p 3888:3888 -e S3_BACKUP=true -e HOSTNAME={hostname for eg. 127.0.0.1} -e S3_BUCKET=<value, Exhibitor will use this bucket for backups & coordination in Essemble> -e S3_PREFIX=<value, key-prefix in S3 Bucket> -e AWS_ACCESS_KEY_ID=<value, AWS access key ID with read & write permissions on bucket> -e AWS_SECRET_ACCESS_KEY=<value of secret key> -e AWS_REGION=<this is optional,AWS region of the S3, defaults to us-west-2> raycoding/piggybank-zookeeper`
  - Note that the parameters `S3_BACKUP,S3_BUCKET,S3_PREFIX,AWS_ACCESS_KEY_ID,AWS_SECRET_ACCESS_KEY` are compulsory for the above way to run Zookeeper
  - `HOSTNAME` parameter is required in both ways as Exhibitor will send client requests to the Monitoring Dashboard to this host address)
  - You can check Exhibitor's Dashboard at `http://localhost:8383/exhibitor/v1/ui/index.html`
  - By using REST API [Read more](https://github.com/Netflix/exhibitor/wiki/REST-Introduction) provided by Exhibitor, you can check status
		`curl -s http://localhost:8383/exhibitor/v1/cluster/status`
		`Output : [{"code": 3,"description": "serving","hostname": "127.0.0.1","isLeader": true}]`
