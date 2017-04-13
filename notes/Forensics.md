
Chrome Forensics
----------------

https://digital-forensics.sans.org/blog/2010/01/21/google-chrome-forensics/

This link has further links at the bottom:

http://forensicswiki.org/wiki/Google_Chrome
http://forensicswiki.org/wiki/Chrome_Disk_Cache_Format

http://www.chromium.org/user-experience/user-data-directory
http://www.chromium.org/developers/design-documents/network-stack/disk-cache
etc

SQLite
------

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

log2timeline
------------

plaso (Plaso Langar Að Safna Öllu) is a Python-based backend engine
for the tool log2timeline.

log2timeline is a tool designed to extract timestamps from various
files found on a typical computer system(s) and aggregate them.

https://github.com/log2timeline/plaso/wiki

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
