--
-- Test database
--

CREATE TABLE testrun(   id INTEGER PRIMARY KEY,
                   address STRING COLLATE NOCASE,
                  hostname STRING COLLATE NOCASE,
                     start DATE,
                       end DATE,
              CONSTRAINT pairUnique UNIQUE (address,hostname)
               );

CREATE TABLE host(      id INTEGER PRIMARY KEY,
                   address STRING COLLATE NOCASE,
                  hostname STRING COLLATE NOCASE,
                     ctime DATE,
                     mtime DATE,
              CONSTRAINT pairUnique UNIQUE (address,hostname)
               );

CREATE INDEX by_address ON host(address);
CREATE INDEX by_name ON host(hostname);

CREATE TRIGGER create_host AFTER INSERT ON host
BEGIN
    UPDATE host SET ctime = DATETIME('NOW') WHERE rowid = new.rowid;
END;

CREATE TRIGGER touch_host AFTER UPDATE ON host
BEGIN
    UPDATE host SET mtime = DATETIME('NOW') WHERE rowid = new.rowid;
END;

insert into host (address, hostname) values ('127.0.0.1', 'localhost');
insert into host (address, hostname) values ('::1', 'localhost');
insert into host (address, hostname) values ('::1', 'ip6-localhost');
insert into host (address, hostname) values ('::1', 'ip6-loopback');
insert into host (address, hostname) values ('fe00::0', 'ip6-localnet');
insert into host (address, hostname) values ('ff00::0', 'ip6-mcastprefix');
insert into host (address, hostname) values ('ff02::1', 'ip6-allnodes');
insert into host (address, hostname) values ('ff02::2', 'ip6-allrouters');


