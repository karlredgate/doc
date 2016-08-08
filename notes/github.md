
WebHooks
--------

https://developer.github.com/v3/repos/hooks/
https://developer.github.com/webhooks/

can use PubSubHubbub protocol.
There is a server hosted by google??

https://github.com/pubsubhubbub/PubSubHubbub
http://pubsubhubbub.appspot.com/
http://pubsubhubbub.github.io/PubSubHubbub/pubsubhubbub-core-0.4.html

API
----

Github API
[doc]( https://developer.github.com/v3/enterprise/ )

github enterprise API endpoint

```
curl http://github.xxxxxxxxxxxx.com/api/v3/
```

Use curl to get latest link pointer

```
url=$( curl -Ls -I -o /dev/null -w '%{url_effective}' http://github.xxxxxxxxxxxx.com/DRaaS/conductor/releases/latest )
```

These are not doing exactly what I want yet.

```
curl http://github.xxxxxxxxxxxx.com/api/v3/repos/DRaaS/conductor/releases | jq '.[]["assets"][0]["url"]'
wget "http://github.xxxxxxxxxxxx.com/api/v3/repos/DRaaS/conductor/releases/assets/13/conductor.rpm"
```

OpenSource Github clones
------------------------

http://stackoverflow.com/questions/5507489/git-server-like-github
https://about.gitlab.com/
http://gitblit.com/

GitHub Addons
-------------

### Waffle

https://takeout.waffle.io/
https://waffle.io/
https://takeout.waffle.io/pricing

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
