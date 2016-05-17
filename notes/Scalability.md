
<!--
-->

https://en.wikipedia.org/wiki/Scalability
https://en.wikipedia.org/wiki/MapReduce
http://www.datacenterknowledge.com/archives/2014/06/25/google-dumps-mapreduce-favor-new-hyper-scale-analytics-system/
https://en.wikipedia.org/wiki/Apache_Mahout

### Elastic Search

Based on Lucene

https://github.com/elastic/elasticsearch
https://en.wikipedia.org/wiki/Elasticsearch

### Spark

not available on Fedora after 22 - this is the spec file repo.

http://pkgs.fedoraproject.org/cgit/rpms/spark.git/


### Google FS

https://en.wikipedia.org/wiki/Google_File_System


The technology is unable to handle the amounts of data Google wants
to analyze these days, however. Urs Hölzle, senior vice president of
technical infrastructure at the Mountain View, California-based giant,
said it got too cumbersome once the size of the data reached a few
petabytes.

“We don’t really use MapReduce anymore,” Hölzle said in his keynote
presentation at the Google I/O conference in San Francisco Wednesday. The
company stopped using the system “years ago.”

Cloud Dataflow, which Google will also offer as a service for developers
using its cloud platform, does not have the scaling restrictions of
MapReduce.

“Cloud Dataflow is the result of over a decade of experience in
analytics,” Hölzle said. “It will run faster and scale better than
pretty much any other system out there.”

It is a fully managed service that is automatically optimized, deployed,
managed and scaled. It enables developers to easily create complex
pipelines using unified programming for both batch and streaming services,
he said.

All these characteristics address what Google thinks does not work
in MapReduce: it is hard to ingest data rapidly, it requires a lot of
different technology, batch and streaming are unrelated, and deployment
and operation of MapReduce clusters is always required.

Hölzle announced other new services on Google’s cloud platform at the show:

 * *Cloud Save* is an API that enables an application to save an individual
   user’s data in the cloud or elsewhere and use it without requiring any
   server-side coding. Users of Google’s Platform-as-a-Service offering
   App Engine and Infrastructure-as-a-Service offering Compute Engine can
   build apps using this feature.
 * *Cloud Debugging* makes it easier to sift through lines of code deployed
   across many servers in the cloud to identify software bugs.
 * *Cloud Tracing* provides latency statistics across different groups
   (latency of database service calls for example) and provides analysis
   reports.
 * *Cloud Monitoring* is an intelligent monitoring system that is a result
   of integration with Stackdriver, a cloud monitoring startup Google bought
   in May. The feature monitors cloud infrastructure resources, such as
   disks and virtual machines, as well as service levels for Google’s
   services as well as more than a dozen non-Google open source packages.

http://www.datacenterknowledge.com/archives/2014/05/09/google-acquires-popular-cloud-monitoring-firm-stackdriver/

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
