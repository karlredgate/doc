
Example/test x509 certs

 * <http://fm4dd.com/openssl/certexamples.htm>

EV-SSL
------

https://labs.detectify.com/2016/10/05/the-story-of-ev-ssl-aws-and-trailing-dot-domains/
https://labs.detectify.com/2014/10/21/hostile-subdomain-takeover-using-herokugithubdesk-more/
https://hackerone.com/reports/32825

General OpenSSL Commands
------------------------

These commands allow you to generate CSRs, Certificates, Private
Keys and do other miscellaneous tasks.

Generate a new private key and Certificate Signing Request

```
openssl req -out CSR.csr -new -newkey rsa:2048 \
            -nodes -keyout privateKey.key
```

Generate a self-signed certificate (see How to Create and Install
an Apache Self Signed Certificate for more info)

```
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
            -keyout privateKey.key -out certificate.crt
```

Generate a certificate signing request (CSR) for an existing private
key

```
openssl req -out CSR.csr -key privateKey.key -new
```

Generate a certificate signing request based on an existing certificate

```
openssl x509 -x509toreq -in certificate.crt -out CSR.csr \
             -signkey privateKey.key
```

Remove a passphrase from a private key

```
openssl rsa -in privateKey.pem -out newPrivateKey.pem
```

Checking Using OpenSSL
----------------------

If you need to check the information within a Certificate, CSR or
Private Key, use these commands. You can also check CSRs and check
certificates using our online tools.

Check a Certificate Signing Request (CSR)

```
openssl req -text -noout -verify -in CSR.csr
```

Check a private key

```
openssl rsa -in privateKey.key -check
```

Check a certificate

```
openssl x509 -in certificate.crt -text -noout
```

Check a PKCS#12 file (.pfx or .p12)

```
openssl pkcs12 -info -in keyStore.p12
```

Debugging Using OpenSSL
-----------------------

If you are receiving an error that the private doesn't match the
certificate or that a certificate that you installed to a site is
not trusted, try one of these commands. If you are trying to verify
that an SSL certificate is installed correctly, be sure to check
out the SSL Checker.

Check an MD5 hash of the public key to ensure that it matches with
what is in a CSR or private key

```
openssl x509 -noout -modulus -in certificate.crt | openssl md5
openssl rsa -noout -modulus -in privateKey.key | openssl md5
openssl req -noout -modulus -in CSR.csr | openssl md5
```

Check an SSL connection. All the certificates (including Intermediates)
should be displayed

```
openssl s_client -connect www.paypal.com:443
```

Converting Using OpenSSL
------------------------

These commands allow you to convert certificates and keys to different
formats to make them compatible with specific types of servers or
software. For example, you can convert a normal PEM file that would
work with Apache to a PFX (PKCS#12) file and use it with Tomcat or
IIS. Use our SSL Converter to convert certificates without messing
with OpenSSL.

Convert a DER file (.crt .cer .der) to PEM

```
openssl x509 -inform der -in certificate.cer -out certificate.pem
```

Convert a PEM file to DER

```
openssl x509 -outform der -in certificate.pem -out certificate.der
```

Convert a PKCS#12 file (.pfx .p12) containing a private key and
certificates to PEM

```
openssl pkcs12 -in keyStore.pfx -out keyStore.pem -nodes
```

You can add -nocerts to only output the private key or add -nokeys
to only output the certificates.


Convert a PEM certificate file and a private key to PKCS#12 (.pfx .p12)

```
openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile CACert.crt
```

Originally posted on Sun Jan 13, 2008

Keytool
--------

Since Java 6, you can import/export private keys into PKCS#12 (.p12) files using keytool, using -importkeystore (not available in previous versions).

For example:

```
keytool -importkeystore -srckeystore existing-store.jks -destkeystore new-store.p12 -deststoretype PKCS12
```

The PKCS12 keystore type is also supported as a standard keystore type in the default Oracle/Sun security provider.


Export from keytool's proprietary format (called "JKS") to standardized format PKCS #12:

```
keytool -importkeystore -srckeystore keystore.jks -destkeystore keystore.p12
-deststoretype PKCS12 -srcalias <jkskeyalias> -deststorepass <password>
-destkeypass <password>
```
Export certificate using openssl:

```
openssl pkcs12 -in keystore.p12  -nokeys -out cert.pem
```
Export unencrypted private key:

```
openssl pkcs12 -in keystore.p12  -nodes -nocerts -out key.pem
```

There is a format that allows the moving of private keys is called
PKCS#12. This format came later in the evolution of PKI certificates
and related keystores as the need evolved. If you consider the chain
of trust issues created by accessing and transporting the private
key you can see why it was not included in the initial features but
rather came after pressure by operational need. This is the core
reason for the challenge.

Java keystores were one of the initial users of the PKCS#12 format
but as importers not exporters. It appears the security design of
Java keystores still does not support exporting private keys as a
standard feature. Again, there are good security reasons for this
fact. That said, private routines have been written as referenced
here:
<http://www.startux.de/index.php/java/44-dealing-with-java-keystoresyvComment44>

If at all possible I would consider creating a new keystore in
OpenSSL and new keys rather than trying to pry out the private key
from the Java keystore. By opening the Java keystore and extracting
the private key one is moving beyond the designed security features.
The export PKCS#12 feature has been desired for many years but still
is not supported in Java. My thinking is that is for very good
cryptologic reasons thus I would be leary of taking that step unless
it was absolutely necessary.

KeyStore Explorer
-----------------

KeyStore Explorer is an open source GUI replacement for the Java
command-line utilities keytool and jarsigner. KeyStore Explorer
presents their functionality, and more, via an intuitive graphical
user interface.

http://www.keystore-explorer.org/
https://github.com/kaikramer/keystore-explorer/

### ASN.1 Javascript decoder

https://lapo.it/asn1js/

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
