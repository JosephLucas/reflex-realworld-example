This app is a remake of https://demo.productionready.io with the reflex framework
 
Avatars icons `static/avatars/` come from https://www.pngitem.com/middle/iwoxoo_user-avatar-set-free-avatar-set-png-transparent/

## Store DB pswd 

`~/.pgpass`
```
localhost:5432:conduit:conduit:conduit
```

## Connect to DB

```
psql -h <host> -p <port> -U <user>
```

This will use `~/.pgpass` data to get the pswd. Once host,port,user fields match, the password is automatically retrieved.

## Dump DB
```
pg_dump -h <host> -U <user> -p <port> --format p --create --file <outputfile.sql> <db_name>
```

## Alter DB
```
psql -h localhost -p 5432 -U conduit < ~/Documents/informatics/entreprise_site_web/altertables.sql
```

