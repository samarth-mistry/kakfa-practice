# kakfa-practice
The complete implementation of data-pipeline using Kafka

**Software used**, MySQl, Kafka, Python

## Step 1: install and up the Kafka & create topic name tolls

```
wget https://archive.apache.org/dist/kafka/2.8.0/kafka_2.12-2.8.0.tgz
tar -xzf kafka_2.12-2.8.0.tgz
cd kafka_2.12-2.8.0
bin/zookeeper-server-start.sh config/zookeeper.properties
bin/kafka-server-start.sh config/server.properties
bin/kafka-topics.sh --create --topic news --bootstrap-server localhost:9092
```

## Step 2: Install and up MySQL && create table livetolldata

```
mysql --host=127.0.0.1 --port=3306 --user=root --password=Mjk0NDQtcnNhbm5h
create database tolldata;
use tolldata;
create table livetolldata(timestamp datetime,vehicle_id int,vehicle_type char(15),toll_plaza_id smallint);
exit
```
## Step 3: Setup Python for MySQl and kafka

```
python3 -m pip install kafka-python
python3 -m pip install mysql-connector-python 
python3 scripts/producer.py
python3 scripts/consumer.py
```
## System Resource status
-Terminals:
  -Zookeeper
  -Kafka-topic
  -MySQL
  -Producer.py
  -Consumer.py
  
 -top:
 ```
 top - 02:25:28 up 1 day, 22:12,  0 users,  load average: 1.57, 1.38, 1.27
Tasks:  23 total,   1 running,  22 sleeping,   0 stopped,   0 zombie
%Cpu(s):  8.8 us,  6.5 sy,  0.0 ni, 83.9 id,  0.4 wa,  0.0 hi,  0.3 si,  0.0 st
KiB Mem : 32742440 total, 12718076 free,  6812684 used, 13211680 buff/cache
KiB Swap:        0 total,        0 free,        0 used. 25606076 avail Mem 

   PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND                                       
  1984 theia     20   0 5988028 458788  24440 S   3.7  1.4   0:19.13 java                                          
   199 theia     20   0 1252268  89660  32696 S   0.7  0.3   0:15.68 node                                          
  3594 theia     20   0   76436  23416   9768 S   0.7  0.1   0:00.49 python3                                       
   188 theia     20   0 1094428 118440  37708 S   0.3  0.4   0:14.50 node                                          
  1354 theia     20   0 3385388  96688  24012 S   0.3  0.3   0:03.89 java                                          
  3350 theia     20   0  141340  20112   8928 S   0.3  0.1   0:00.59 python3                                       
  3813 theia     20   0   41668   3564   3124 R   0.3  0.0   0:00.01 top                                           
     1 theia     20   0    4640    884    812 S   0.0  0.0   0:00.04 sh                                            
     7 theia     20   0   12896   3368   3064 S   0.0  0.0   0:00.01 entrypoint.sh                                 
   164 root      20   0   31324   2780   2500 S   0.0  0.0   0:00.00 cron     
   ```
-ps-aux:
```
USER        PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
theia         1  0.0  0.0   4640   884 ?        Ss   01:56   0:00 /bin/sh -c /home/theia/entrypoint.sh
theia         7  0.0  0.0  12896  3368 ?        S    01:56   0:00 /bin/bash /home/theia/entrypoint.sh
root        164  0.0  0.0  31324  2780 ?        Ss   01:56   0:00 /usr/sbin/cron
theia       165  0.0  0.2 863644 74880 ?        Sl   01:56   0:01 node /usr/local/nvm/versions/node/v16.13.0/bin/ya
theia       176  0.0  0.0   4648   884 ?        S    01:56   0:00 /bin/sh -c /home/theia/node_modules/.bin/theia st
theia       177  0.0  0.3 715848 98360 ?        Sl   01:56   0:01 /usr/local/nvm/versions/node/v16.13.0/bin/node /h
theia       188  0.8  0.3 1094428 118692 ?      Rsl  01:57   0:14 /usr/local/nvm/versions/node/v16.13.0/bin/node /h
theia       199  0.9  0.2 1252268 89768 ?       Sl   01:57   0:15 /usr/local/nvm/versions/node/v16.13.0/bin/node /h
theia       214  0.4  0.3 978840 102624 ?       Sl   01:57   0:07 /usr/local/nvm/versions/node/v16.13.0/bin/node /h
theia       233  0.1  0.2 650364 70484 ?        Sl   01:57   0:01 /usr/local/nvm/versions/node/v16.13.0/bin/node /h
theia       258  0.0  0.0  25448  7944 pts/0    Ss   02:01   0:01 /bin/bash
theia       544  0.1  0.0  25452  7844 pts/1    Ss+  02:01   0:01 /bin/bash
theia      1321  0.7  0.1 158840 47764 ?        Sl   02:17   0:03 /usr/bin/python3 /home/theia/plugins/vscode-pytho
theia      1324  0.0  0.0  61516 24300 ?        S    02:17   0:00 /usr/bin/python3 /home/theia/plugins/vscode-pytho
theia      1354  1.1  0.2 3385388 96688 pts/0   SLl+ 02:19   0:03 /usr/lib/jvm/java-jdk-11.0.11+9/bin/java -Xmx512M
theia      1726  0.3  0.0  25320  7772 pts/2    Ss   02:19   0:01 /bin/bash
theia      1984  5.9  1.4 5988028 458844 pts/2  SLl+ 02:20   0:19 /usr/lib/jvm/java-jdk-11.0.11+9/bin/java -Xmx1G -
theia      2360  0.5  0.0  25452  7948 pts/3    Ss   02:20   0:01 /bin/bash
theia      3350  0.7  0.0 141340 20112 pts/3    Sl+  02:24   0:00 python3 toll_generator.py
theia      3353  1.6  0.0  25448  7900 pts/4    Ss   02:24   0:01 /bin/bash
theia      3594  0.7  0.0  76436 23416 pts/4    R+   02:24   0:00 python3 streaming_data_reader.py
theia      3602  7.7  0.0  25448  7920 pts/5    Ss   02:25   0:01 /bin/bash
theia      3814  0.0  0.0  37388  3352 pts/5    R+   02:25   0:00 ps -aux
```

 
