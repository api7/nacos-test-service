FROM java
ENV SUFFIX_NUM=${SUFFIX_NUM:-1}
ENV NACOS_ADDR=${NACOS_ADDR:-127.0.0.1:8848}
COPY *.jar /app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar",\
            "--suffix.num=${SUFFIX_NUM}","--spring.cloud.nacos.discovery.server-addr=${NACOS_ADDR}"]
EXPOSE 18001