
<!--
-->

ETL
----

Ab Initio
---------

Tamr
----

http://www.tamr.com/
http://www.tamr.com/jobs/
https://www.crunchbase.com/organization/tamr#/entity

http://www.odbms.org/blog/2015/01/interview-andy-palmer-tamr/
https://icrunchdatanews.com/tamr-ceo-andy-palmer-talks-analytics-50-startups/
http://venturebeat.com/2014/06/24/tamr-ceo-andy-palmer-explains-why-every-business-needs-to-put-all-its-data-sources-together/

https://plus.google.com/+AndyPalmer-Tamr/posts

### Stonebraker

https://gigaom.com/2014/05/19/michael-stonebrakers-new-startup-tamr-wants-to-help-get-messy-data-in-shape/
http://stonebraker70.com/
https://en.wikipedia.org/wiki/Michael_Stonebraker

Workflow
--------

This is not really big data - but I don't have a better place for it.

You want to watch the videos on these sites:

http://decisions.com/
http://rule.net/

Hadoop
------

 * https://hadoop.apache.org/docs/r1.2.1/hdfs_design.html
 * http://hadoop.apache.org/docs/r2.6.0/hadoop-project-dist/hadoop-hdfs/WebHDFS.html
 * https://github.com/apache/hadoop/tree/trunk/hadoop-hdfs-project/hadoop-hdfs/src/main/proto

https://ragrawal.wordpress.com/2012/04/28/installing-hadoop-on-mac-osx-lion/

### HDFS

Appears to be protocol buffers over HTTP.  The protocol is documented
by the protocol buffers source files:

 * <https://github.com/apache/hadoop/tree/trunk/hadoop-hdfs-project/hadoop-hdfs/src/main/proto>
 * <http://stackoverflow.com/questions/28445972/is-there-a-hdfs-client-wire-protocol-specification#28447794>

### Protocol Buffers

This doc points to info about protocol buffers and
its use in Hadoop.  Also related ideas.  And there is
a protobuf jar for use in java.

https://wiki.apache.org/hadoop/ProtocolBuffers

Related to ProtocolBuffers is Apache Thrift and Etch, and Avro

fluentd and Treasure Data
----------------

Written in Ruby - it is a data collection solution that deals with
semi-structures or unstructured data.
Intended for event logs, application logs and clickstreams.
Related to Apache Kafka.

https://en.wikipedia.org/wiki/Fluentd
http://github.com/fluent
https://www.treasuredata.com/beyond_fluentd?utm_source=googlead&utm_medium=cpc&utm_campaign=success1&gclid=CJ-D-qLN0s4CFcNahgodLOEInQ


Apache Kafka
------------

Apache Kafka is an open-source message broker project developed by
the Apache Software Foundation written in Scala. The project aims
to provide a unified, high-throughput, low-latency platform for
handling real-time data feeds. It is, in its essence, a "massively
scalable pub/sub message queue architected as a distributed transaction
log," making it highly valuable for enterprise infrastructures to
process streaming data.

The design is heavily influenced by transaction logs

https://en.wikipedia.org/wiki/Apache_Kafka
https://en.wikipedia.org/wiki/Transaction_log

> Look at the related projects on the wikipedia page

Apache Kafka was originally developed by LinkedIn, and was subsequently
open sourced in early 2011. In November 2014, several engineers
who built Kafka at LinkedIn created a new company named Confluent
with a focus on Kafka.

http://kafka.apache.org/

Apache Parquet
--------------

Parquet is binary columnar data format encoded in Apache Thrift.

https://github.com/Parquet/parquet-format
http://parquet.apache.org/
https://drill.apache.org/docs/querying-parquet-files/
http://the-paper-trail.org/blog/columnar-storage/

Apache Drill
------------

Open source version of the Google Dremel system
("Schema-free SQL Query Engine for Hadoop, NoSQL and Cloud Storage").
Uses a JSON document model.

https://en.wikipedia.org/wiki/Apache_Drill
https://drill.apache.org/

Google BigQuery
---------------

https://en.wikipedia.org/wiki/BigQuery
https://cloud.google.com/bigquery/what-is-bigquery
https://cloud.google.com/bigquery/sign-up

Comparison
----------

Google           | Apache     | AWS      | Microsoft
-----------------|------
protocol buffers | thrift, avro
Google FS        | HDFS
chubby           | 
mapreduce        | Hadoop
bigtable         | Accumulo, Cassandra, HBase
sawzall          | pig (yahoo)
dremel           | drill
megastore        |
spanner          |
tenzing          |
F1

spark
cascading
apache pig
apache crunch
cloudera impala
apache hive
hbase
apache avro
sqoop
flume
accumulo
apache tez
hadoop yarn
apache mesos
apache spark sql

Other BigTable - hypertable, bluefish (C++), leveldb, AWS simpledb, dynamo
https://en.wikipedia.org/wiki/Etch_(protocol)

### Parquet

http://parquet.apache.org/
http://parquet.io/
https://cwiki.apache.org/confluence/display/Hive/Parquet

https://blog.twitter.com/2013/dremel-made-simple-with-parquet
https://github.com/Parquet/parquet-format

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
