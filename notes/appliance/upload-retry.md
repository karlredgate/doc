Maytag Cloud Upload Retry
=========================

What is the fault model?

What can fail

Start uploader

check time - exit if time excluded

get key - failed to get key - trigger diagnostic

Faults
-----

Fault                         | Detection
------------------------------|------------
Invalid server token          | 
S3 server unresponsive        | boto request timeout
S3 server 500 error           | boto result code
S3/AMI permissions error      | boto response?
S3 set file contents failed   |
S3 set chunk contents failed  |


Remediations
------------

 * Resend file/chunk again immediately
 * Resend file/chunk after delay
   - static delay
   - exponential delay
   - random delay
 * Send alert to Support
   - Mechanism? SNS/SQS
   - Delivery to support: How to they consume? - email?

Questions
---------

### Remote control
 * How does support trigger a restart?

