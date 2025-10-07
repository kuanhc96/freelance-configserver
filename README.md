# freelance-configserver
## Connection to configfiles repo
- The connection relies on SSH authentication. The SSH key is encrypted and the program will require the encription password to decrypt it at startup.
- provide the environment variable, `ENCRYPT_KEY`
## Profile information

### git,dev

- standalone application. Does not connect with any other microservices. used for local development
- to disable rabbitMQ, add the VM arguments: 
  - `-DMANAGEMENT_HEALTH_RABBIT_ENABLED=false` 
  - `-DSPRING_CLOUD_BUS_ENABLED=false`

### git,test

- connected to and connects to other applications. Used for local testing
- connected to by other microservices (resourceserver, eurekaserver) via localhost
- connects to rabbitmq via localhost
- NOTE: the configserver does not register itself with eurekaserver b/c the eurekaserver depends on the configserver
- configurations will be read from configfiles repo: freelance-resource-backend-test
- rabbitMQ: port 5672
- add the VM argument: `-Dspring.rabbitmq.host=localhost`

### git,qa

- connected to and connects to other applications. Used for testing in docker-compose environment
- uses application.yml without modifications