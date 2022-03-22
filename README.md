# Clarity ftp server

First of all, build the container with `make build`.

This allows you to create an ftp server locally to test.

By default, user and passwords are:

```
FTP_USER = clarity
FTP_PSSWD = clarity
```

## Connecting to container

the continer is run with a network bridge to make it available from other containers.

In order to get acces from the host, you can do:

```
curl -u clarity:clarity "ftp://$(make get_host):2121/"
```

`make get_host` will provide you with the container IP so you can directly connect to it.

## Configuring the container

You can either change the credentials or the folder that the ftp server is serving by exporting the proper environment variable before executing `make run`.

ie:

```
FTP_USER=admin
FTP_PSSWD=admin
FTP_FOLDER=/another/folder
```

will serve the content in `/another/folder` via `curl -u admin:admin "ftp://$(make get_host):2121/"`
