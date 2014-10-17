FROM raycoding/piggybank
MAINTAINER Shuddhashil Ray rayshuddhashil@gmail.com

# Fetching Zookeeper 3.4.6
ENV ZK_VERSION 3.4.6
ENV ZK zookeeper-$ZK_VERSION
ENV ZK_HOME /usr/lib/$ZK
RUN (cd /usr/lib && wget  -q -nc "http://apache.mirrors.pair.com/zookeeper/$ZK/$ZK.tar.gz")
RUN tar -xzvf /usr/lib/$ZK.tar.gz -C /usr/lib/
# Setting Up Zookeeper 3.4.6
RUN mkdir -p "$ZK_HOME/zookeeper-data"
RUN mkdir -p "$ZK_HOME/zookeeper-logs"
ADD zoo.cfg /usr/lib/zookeeper-3.4.6/conf/zoo.cfg

WORKDIR /usr/lib/zookeeper-3.4.6

# Exposing client port
EXPOSE 2181 2888 3888
# Exposing mount volumes in host
VOLUME ["/usr/lib/zookeeper-3.4.6/conf", "/usr/lib/zookeeper-3.4.6/zookeeper-data", "/usr/lib/zookeeper-3.4.6/zookeeper-logs"]
CMD ["start-foreground"]
ENTRYPOINT ["/usr/lib/zookeeper-3.4.6/bin/zkServer.sh"]