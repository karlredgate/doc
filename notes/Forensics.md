
Chrome Forensics
----------------

https://digital-forensics.sans.org/blog/2010/01/21/google-chrome-forensics/

This link has further links at the bottom:

http://forensicswiki.org/wiki/Google_Chrome

http://www.chromium.org/user-experience/user-data-directory
http://www.chromium.org/developers/design-documents/network-stack/disk-cache
etc

```
SELECT urls.url, urls.title, urls.visit_count,
       urls.typed_count, urls.last_visit_time,
       urls.hidden, visits.visit_time,
       visits.from_visit, visits.transition
FROM urls, visits
WHERE urls.id = visits.url
```

How to grab data from SQLite DB without SQLite?

http://forensicswiki.org/wiki/SQLite_database_format

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
