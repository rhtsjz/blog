```
1.
zsj@zsj-zcool:~/develop/predictionIO$ pio status
[INFO] [Console$] Inspecting PredictionIO...
[INFO] [Console$] PredictionIO 0.9.5 is installed at /home/zsj/PredictionIO
[INFO] [Console$] Inspecting Apache Spark...
[INFO] [Console$] Apache Spark is installed at /home/zsj/PredictionIO/vendors/spark-1.5.1
[INFO] [Console$] Apache Spark 1.5.1 detected (meets minimum requirement of 1.3.0)
[INFO] [Console$] Inspecting storage backend connections...
[INFO] [Storage$] Verifying Meta Data Backend (Source: ELASTICSEARCH)...
[ERROR] [Console$] Unable to connect to all storage backends successfully. The following shows the error message from the storage backend.
[ERROR] [Console$] None of the configured nodes are available: [] (org.elasticsearch.client.transport.NoNodeAvailableException)
[ERROR] [Console$] Dumping configuration of initialized storage backend sources. Please make sure they are correct.
[ERROR] [Console$] Source Name: ELASTICSEARCH; Type: elasticsearch; Configuration: TYPE -> elasticsearch, HOME -> /home/zsj/PredictionIO/vendors/elasticsearch-1.4.4

zsj@zsj-zcool:~/develop/predictionIO$ pio-start-all 
Starting Elasticsearch...
Starting HBase...
starting master, logging to /home/zsj/PredictionIO/vendors/hbase-1.0.0/bin/../logs/hbase-zsj-master-zsj-zcool.out
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/home/zsj/PredictionIO/vendors/hbase-1.0.0/lib/slf4j-log4j12-1.7.7.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/home/zsj/develop/hadoop-2.7.1/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Waiting 10 seconds for HBase to fully initialize...
Starting PredictionIO Event Server...


```

重启之后问题不再复现
