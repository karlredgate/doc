
Printing in hex

```
CREATE TABLE T (V integer);
insert into T(V) values(400), (800), (25), (76);
select printf('%08X', V) from T;
```

<https://sqlite.org/lang_corefunc.html#hex>


<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
