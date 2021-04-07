# nacos-test-service


## 1 prepare nacos
```
docker network rm nacos_net
docker network create nacos_net
docker run --rm -d --name nacos_no_auth --network nacos_net --hostname nacos --env PREFER_HOST_MODE=hostname --env MODE=standalone -p8848:8848 nacos/nacos-server:latest
```
admin url:

http://127.0.0.1:8858/nacos

nacos/nacos

## 2 build service image
```
docker build -t nacos-test-service:1.0-SNAPSHOT .
```

## 3 run service
```
docker run -d --rm --network nacos_net --env NACOS_ADDR=nacos:8848 --env SUFFIX_NUM=1 -p 18001:18001 --name nacos-service1 nacos-test-service:1.0-SNAPSHOT

docker run -d --rm --network nacos_net --env NACOS_ADDR=nacos:8848 --env SUFFIX_NUM=2 -p 18002:18001 --name nacos-service2 nacos-test-service:1.0-SNAPSHOT
```
