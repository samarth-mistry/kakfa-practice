#This file is used to initialize kafka automatically

#install python dependencies
python3 -m pip install kafka-python
python3 -m pip install mysql-connector-python 

#install and create the kafka topic
wget https://archive.apache.org/dist/kafka/2.8.0/kafka_2.12-2.8.0.tgz
tar -xzf kafka_2.12-2.8.0.tgz
cd kafka_2.12-2.8.0
bin/zookeeper-server-start.sh config/zookeeper.properties
bin/kafka-server-start.sh config/server.properties
bin/kafka-topics.sh --create --topic news --bootstrap-server localhost:9092
