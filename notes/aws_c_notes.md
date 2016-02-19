It turns out that not a lot of people attempt to program against the
AWS REST API in C. I discovered this the hard way when I needed to do it.

You’d have thought that there would be some libraries for it; turns
out that this isn’t the case.

libs3 is one but it isn’t particularly general purpose. And S3 turns
out to be surprisingly unlike EC2 and other services. Also, Amazon’s
own documentation is surprisingly bad.

So if you end up here because you want to interact with AWS in C, the
tips below may help you.

I used libcurl; I’m sure you could do the same thing some other way …

The trick is in computing the signature of the request.

Assume that you want to execute the DescribeInstances API call.

You need to construct a signing request which must basically include
an unambiguous representation of the API request. Since you may have
many parameters to the API request, you must sort the parameters into
alphabetical order first.

 1. Construct the timestamp this way:

```
 411     static char * __aws_api_get_timestamp (char * buffer, int sz)
 412     {
 413         time_t t = time(NULL);
 414         struct tm * gmttime = gmtime (&t);
 415
 416         strftime (buffer, sz, "%FT%H:%M:%SZ", gmttime);
 417         return buffer;
 418    }
```

 2. Every signing request must have 5 AUTHPARAMS; the documentation talks about 4 but there are 5 …

```
Version: This is the API Version. I've used 2013-08-15
SignatureVersion: I use 2
SignatureMethod: I use HmacSHA256
Timestamp: As computed above.
AWSAccessKeyId: Your AWS Access Key
```

While it isn’t an AUTHPARAM, you also need the Action in a signing
request. That is the API name.

 3. Construct the signing request.

The signing request takes the following format.

```
%s\n%s\n%s\n%s
```

where the four strings are (in order)

 a. The submission method (POST or GET)
 b. The endpoint
 c. The path
 d. The request URL.

So, for my DescribeInstances request, the signing request is (newlines
between lines):

```
POST
ec2.amazonaws.com
/
AWSAccessKeyId=AKIVP30P3L0A5NKGTIQ&Action=DescribeInstances&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2013-10-13T20%3A55%3A06Z&Version=2013-08-15
```

Note that the method is POST.

The end point is ec2.amazonaws.com

The path is “/”

The request with the sorted attributes starts with my AWSAccessKeyId (no,
that’s not my access key …) the Action which is DescribeInstances,
and the other AUTHPARAMS.

Note that the string was escaped the way a URL would be escaped; you
can see that in the timestamp.

You can now compute the signature for this; I used HMAC. Once you compute
the signature for the request, you base64 encode the signature.

4. Construct the Request URL

This is nothing more than the request URL in the signing request with the
base64 encoded signature tacked on. Of course, there’s no requirement
that in the API parameters in the final request URL be alphabetically
sorted.
<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
