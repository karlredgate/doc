
http://stackoverflow.com/questions/23523705/how-to-create-new-page-in-confluence-using-their-rest-api

https://docs.atlassian.com/atlassian-confluence/REST/5.5/#d2e120
https://developer.atlassian.com/display/CONFDEV/Using+the+REST+APIs+-+Prototype+Only#UsingtheRESTAPIs-PrototypeOnly-RESTAuthentication

```
curl -v -u admin:admin -X POST \
     -H 'Content-Type: application/json' \
     -H 'Accept: application/json' \
     -d '{"type":"page","title":"new page","space":{"key":"ATTACH"},"body":{"storage":{"value":"<p>This is a new page</p>","representation":"storage"}}}' \
     "http://localhost:8090/rest/api/content/?os_authType=basic"
```

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
