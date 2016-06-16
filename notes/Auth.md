
<!--
-->

RBAC
----

Compliance

use ssh with jumphost - like keymaker (keymaster)

OpenID?
-------

https://github.com/stormpath/stormpath-sdk-node

facebook openid
http://stackoverflow.com/questions/1827997/is-facebook-an-openid-provider
https://developers.facebook.com/docs/facebook-login
http://openid.net/get-an-openid/
linkedin openid
https://dashboard.janrain.com/signin?dest=#
http://janrain.com/?s=pricing
http://janrain.com/product/social-login/plans/


Tokens
------

I was looking for the description of AWS tokens.
Still haven't found them, however the OpenStack Keystone service
uses several "providers".

http://docs.aws.amazon.com/AmazonSimpleDB/latest/DeveloperGuide/HMACAuth.html
https://en.wikipedia.org/wiki/Hash-based_message_authentication_code
http://stackoverflow.com/questions/6591047/etag-definition-changed-in-amazon-s3
http://www.dancartoon.com/projects/s3-siggenerator/
https://github.com/dcartoon/s3-siggenerator/blob/master/js/siggenerator.js
https://d0.awsstatic.com/whitepapers/KMS-Cryptographic-Details.pdf

API Tokens
----------

https://stackoverflow.com/questions/1453073/what-is-an-api-key
http://stackoverflow.com/questions/1482472/when-working-with-most-apis-why-do-they-require-two-types-of-authentication-na/1501112#1501112
https://en.wikipedia.org/wiki/Digital_signature


Fernet
------

The name appears to be for a spiced alcohol.

https://developer.ibm.com/opentech/2015/11/11/deep-dive-keystone-fernet-tokens/
https://github.com/fernet/spec
http://www.mattfischer.com/blog/?p=648
http://dolphm.com/benchmarking-openstack-keystone-token-formats/
http://dolphm.com/the-anatomy-of-openstack-keystone-token-formats/
https://cryptography.io/en/latest/fernet/
https://github.com/fernet/spec/blob/master/Spec.md
http://lbragstad.com/fernet-tokens-and-key-rotation/
https://github.com/openstack/keystone-specs/blob/master/specs/kilo/klwt.rst

https://github.com/openstack/keystone/tree/master/keystone/token/providers


Cracking hashes
---------------

https://mars.praetorian.com/

Signatures
-----------

https://en.wikipedia.org/wiki/Digital_signature

Keycloak
--------


http://keycloak.jboss.org/
https://github.com/keycloak/keycloak
https://github.com/github/hub
https://github.xxxxxxxxxxxx.com/Architecture/keycloak
EPEL maven
https://fedoraproject.org/wiki/MavenEPEL
https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo
http://keycloak.jboss.org/keycloak/downloads.html

keycloak yum
http://www.apiman.io/blog/gateway/security/oauth2/keycloak/authentication/authorization/2015/06/09/keycloak-oauth2.html
https://gist.github.com/msavy/9390bfcd497f3c683a1c
https://gist.github.com/msavy
https://github.com/keycloak/keycloak
https://gist.githubusercontent.com/msavy/9390bfcd497f3c683a1c/raw/e7a185d9298cc30ddbc3131c57c3c6ff50127966/apiman-oauth.bash
github gist msavy

http://blog.keycloak.org/2015/10/getting-started-with-keycloak-securing.html

https://github.com/pingidentity/mod_auth_openidc

http://keycloak.jboss.org/docs

StackOverflow quesions about implementing
[keycloak]( http://stackoverflow.com/questions/tagged/keycloak?sort=votes )
solutions.

New features in 2014?

https://planet.jboss.org/post/merry_christmas_from_the_keycloak_team

Picketlink
----------

http://picketlink.org/mobile/mobile/
http://picketlink.org/appsecurity/rest/
http://picketlink.org/federation/
http://picketlink.org/

https://www.youtube.com/watch?v=5Z5AUnr-s4g
https://docs.jboss.org/author/display/PLINK/PicketLink+Quickstarts

Conjur
------

Conjur is a cloud-native platform for directory services, authorization,
and audit for development and operations teams and their entire
infrastructure.

With 100% API coverage and a scalable, easily deployable,
high-availability architecture, Conjur reduces the time, cost, and
complexity associated with building authorization management compared
to complex homegrown scripts and configuration management tools.
Sometimes referred to as “Active Directory for the cloud”, Conjur
runs in either a virtual machine or container, and works alongside
a wide range identity and access management (IAM) solutions to solve
access and authorization challenges: machine-to-machine permissions,
deployment and access rights to sensitive systems, and the auditing
required to meet compliance requirements.

https://www.conjur.net/
https://www.conjur.net/technology

https://info.conjur.net/conjur-technical-overview
https://pages.cloudpassage.com/rs/857-FXQ-213/images/forrester-market-overview-cloud-workload-security-management-solutoons-automate-or-die.pdf

API and other stuff documented in the developer docs

https://developer.conjur.net/tutorials/ssh

Device Auth
-----------

http://www.deviceauthority.com/
http://www.deviceauthority.com/d-factor-device-authentication?__hssc=&__hstc=&__hsfp=&hsCtaTracking=ad28ce42-942b-4cf4-a400-7ae554ae2c7c%7C24e1b323-780c-4f68-830f-e2196f785ddd
http://www.deviceauthority.com/hubfs/Premium_Content_Resources/White_Papers/Device-Based_User_Authentication/DA-White_Paper_Device-Based_Authentication_Secure_Access-FINAL-041515.pdf?submissionGuid=5f9f54c7-3fbd-4246-9e29-376b66f19ee8
http://www.deviceauthority.com/d-factor-device-authentication?__hssc=&__hstc=&__hsfp=&hsCtaTracking=ad28ce42-942b-4cf4-a400-7ae554ae2c7c%7C24e1b323-780c-4f68-830f-e2196f785ddd
m2m auth



SAML
----

https://en.wikipedia.org/wiki/SAML-based_products_and_services

FIDO
----

https://fidoalliance.org/specs/fido-uaf-protocol-v1.0-rd-20140209.pdf
https://fidoalliance.org/specs/fido-uaf-reg-v1.0-rd-20140209.pdf
https://fidoalliance.org/specs/fido-uaf-authnr-metadata-v1.0-rd-20140209.pdf
https://fidoalliance.org/specs/fido-uaf-asm-api-v1.0-rd-20140209.pdf
https://fidoalliance.org/specs/fido-uaf-authnr-cmds-v1.0-rd-20140209.pdf
https://fidoalliance.org/specs/fido-uaf-client-api-transport-v1.0-rd-20140209.pdf

http://www.techspot.com/news/59112-fido-protocol-behind-google-security-key-expected-lead.html
http://www.computerweekly.com/news/2240233424/Final-specification-for-Fido-password-killing-protocol-imminent

https://github.com/eBay/UAF
https://github.com/google/u2f-ref-code
https://github.com/hanswolff/fido-u2f-net

http://techcrunch.com/2015/10/01/github-launches-support-for-u2f-security-keys/
https://help.github.com/articles/configuring-two-factor-authentication-via-fido-u2f/
http://www.infoworld.com/article/2988512/security/github-adds-hardware-based-authentication-for-developers.html
https://adtmag.com/blogs/watersworks/2015/10/github-yubikey.aspx

https://en.wikipedia.org/wiki/Universal_2nd_Factor

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
