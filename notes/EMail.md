
<!--
-->

http://lifehacker.com/111166/how-to-use-gmail-as-your-smtp-server
https://www.siteground.com/kb/google_free_smtp_server/

From <http://serverfault.com/questions/635139/how-to-fix-send-mail-authorization-failed-534-5-7-14>

It may take more than one step to fix this issue

 1. Take the step mentioned earlier.
    Log into your google email account and then go to this link:
    <https://www.google.com/settings/security/lesssecureapps>
    and set "Access for less secure apps" to ON.
    Test to see if your issue is resolved.
    If it isn't resolved, as it wasn't for me, continue to Step #2.
 2. Go to <https://support.google.com/accounts/answer/6009563>
    (Titled: "Password incorrect error").
    This page says "There are several reasons why you might see a
    "Password incorrect" error (aka 534-5.7.14) when signing in
    to Google using third-party apps.
    In some cases even if you type your password correctly.
    This page gives 4 suggestions of things to try.

For me, the first suggestion worked:

 * Go to <https://g.co/allowaccess> from a different device you
   have previously used to access your Google account and follow
   the instructions.
 * Try signing in again from the blocked app.

There were three more suggestions on the page given in step #2 but
I didn't try them because after going to the redacted link and
following the instructions, everything began to work as it should.

cURL
----

http://stackoverflow.com/questions/14722556/using-curl-to-send-email#16069786

search: using curl to send email

```
curl \
  --url "smtps://smtp.gmail.com:465" \
  --ssl-reqd \
  --mail-from "username@gmail.com" \
  --mail-rcpt "john@example.com" \
  --upload-file mail.txt \
  --user "username@gmail.com:password" \
  --insecure
```

EMail SMS
---------

http://myhitthoughts.blogspot.com/2011/05/makeshift-email-usage-and-calendar.html
https://community.verizonwireless.com/thread/577114
https://www.verizonwireless.com/news/article/2013/06/computer-to-phone-text-messaging.html/

vtext no loger working from mail server.
https://community.verizonwireless.com/thread/813442
(read the send page - you could not read it on the train.)

This search: telnet to vtext.com
produced results for why vtext.com is not accepting connections.

Blacklist
---------

http://www.notepage.net/conversion-from-tap-to-smtp.htm
http://whatismyipaddress.com/blacklist-check

I am blacklisted on this site - seems to be from an open relay
http://www.sorbs.net/

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
