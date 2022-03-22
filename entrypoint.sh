#!/bin/bash
twistd -n ftp \
    --auth memory:${FTP_USER}:${FTP_PSSWD}  \
    --userAnonymous=${FTP_USER} \
    --root /tmp/