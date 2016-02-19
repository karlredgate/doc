
<!--
-->

Electron for UI

 * include mDNS locator for appliances

Service

 * platform specific daemon code
 * platform specific fs watcher
 * platform specific socket calls??
 * platform generic file signatures
 * platform generic compressor?
 * add scripting?
 * tiny webserver for API - also provided externally to appliance
   * security - certs?
 * calls other bits for parts of backup
 * identify changes (how to communicate - spool?)
 * VSS handler?
 * Split files into chunks - signature/compress
 * Store signatures ?
   * plugin storage tools
   * where is my s3 example code

Appliance

 * Which S3 server?
   * skylable LibreS3 is OCaml
 * gateway to real S3 - riofs?
   * problem with riofs is no STS

Diagnostics

 * another service
 * build in CLIPS engine
 * and libxslt etc for rdf handling
 * get RDF from cloud always

Discovery service

 * at what address?

OSX
----

Green updates:
 * ( http://sparkle-project.org/ )

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
