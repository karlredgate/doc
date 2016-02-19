
<!--
-->

Downloaded and built `xmlsec1` and tried to use it to sign xml.
It failed with the following error:

```
$ ~/xmlsec/apps/xmlsec1 --sign --output signed.xml --privkey-pem userkey.pem   foo.xml
func=xmlSecGCryptAppKeyLoadMemory:file=app.c:line=232:obj=unknown:subj=xmlSecGCryptAppKeyLoadMemory:error=9:feature is not implemented:
func=xmlSecGCryptAppKeyLoad:file=app.c:line=176:obj=unknown:subj=xmlSecGCryptAppKeyLoadMemory:error=1:xmlsec library function failed:filename=userkey.pem
func=xmlSecAppCryptoSimpleKeysMngrKeyAndCertsLoad:file=crypto.c:line=118:obj=unknown:subj=xmlSecCryptoAppKeyLoad:error=1:xmlsec library function failed:uri=userkey.pem
Error: failed to load all private key from "userkey.pem".
Error: keys manager creation failed
```

Looked for yum repo packages.
Available packages are:

```
s# yum list '*xmlsec1*'
xmlsec1.x86_64                           1.2.20-1.fc22     @System
xmlsec1-devel.x86_64                     1.2.20-1.fc22     fedora
xmlsec1-gcrypt.x86_64                    1.2.20-1.fc22     fedora
xmlsec1-gcrypt-devel.x86_64              1.2.20-1.fc22     fedora
xmlsec1-gnutls.x86_64                    1.2.20-1.fc22     fedora
xmlsec1-gnutls-devel.x86_64              1.2.20-1.fc22     fedora
xmlsec1-nss.x86_64                       1.2.20-1.fc22     fedora
xmlsec1-nss-devel.x86_64                 1.2.20-1.fc22     fedora
xmlsec1-openssl.x86_64                   1.2.20-1.fc22     @System
xmlsec1-openssl-devel.x86_64             1.2.20-1.fc22     fedora
```

Installed the yum version of the tool and still got errors about not having openssl loaded.
It looks like xmlsec1 requires a secondary package be loaded to read the keys.
The packages loaded are:

```
yum install xmlsec1
yum install xmlsec1-openssl
```

Now it worked:

```
xmlsec1 --sign --output signed.xml --privkey-pem server.key  foo.xml
```

This worked from a CA I generated earlier in the day.
The CA cert was not required to run this command.
We need to test using a cert with the key.

The source doc is:

```
<?xml version="1.0" encoding="UTF-8"?>
<document>
  <firstelement attr1="attr1">
    Content of first element.
    <secondelement attr2="attr2">
      Content of the second element.
      <thirdelement attr3="attr3">
        And the content of the third element.
      </thirdelement>
    </secondelement>
  </firstelement>
  <Signature xmlns="http://www.w3.org/2000/09/xmldsig#">
  <SignedInfo>
    <CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
    <SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/>
    <Reference>
      <Transforms>
        <Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
        <Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
      </Transforms>
      <DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
      <DigestValue />
    </Reference>
    </SignedInfo>
  <SignatureValue />
  <KeyInfo>
    <X509Data />
  </KeyInfo>
</Signature>
</document>
```

The signed doc is:

```
<?xml version="1.0" encoding="UTF-8"?>
<document>
  <firstelement attr1="attr1">
    Content of first element.
    <secondelement attr2="attr2">
      Content of the second element.
      <thirdelement attr3="attr3">
        And the content of the third element.
      </thirdelement>
    </secondelement>
  </firstelement>
  <Signature xmlns="http://www.w3.org/2000/09/xmldsig#">
  <SignedInfo>
    <CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
    <SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/>
    <Reference>
      <Transforms>
        <Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
        <Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
      </Transforms>
      <DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
      <DigestValue>8q+uVhwZjZ5fIKtcdzbFJ6zB+Yo=</DigestValue>
    </Reference>
    </SignedInfo>
  <SignatureValue>EZC9VRliTGPCXhmECjjqM+1KJ8ZIAdb2RxZxYaMqp2GgrzVY5ZARaQw5Swb3Fv3K
20fUfFXustmCGboTaiZEcJ0oAcoz61KDKHBH9WLag0LlxaqlNYnjbCn+VVFqyG3z
HXdistTVzn4v2oQt0HuiKFY+jbAATC0AMl2krw8/YtY=</SignatureValue>
  <KeyInfo>
    <X509Data/>
  </KeyInfo>
</Signature>
</document>
```

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
