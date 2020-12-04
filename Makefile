kafka:
	$(KAFKA_HOME)/bin/zookeeper-server-start.sh -daemon $(KAFKA_HOME)/config/zookeeper.properties
	JMX_PORT=8004 $(KAFKA_HOME)/bin/kafka-server-start.sh -daemon $(KAFKA_HOME)/config/server.properties
	/home/kafka/cmak/bin/cmak -Dconfig.file=/home/kafka/cmak/conf/application.conf -Dhttp.port=8080

hadoop:
	$(HADOOP_HOME)/sbin/start-dfs.sh
	$(HADOOP_HOME)/sbin/start-yarn.sh
	$(SPARK_HOME)/sbin/start-history-server.sh

hive:
	docker-compose -f docker-compose-mariadb.yml up -d
	$(HIVE_HOME)/bin/start-metastore

clean:
	find . -type f -name "*.pyc" -delete
	find . -type d -name __pycache__ | xargs rm -fr {}

.PHONY: kafka hadoop hive clean
