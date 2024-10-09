#!/bin/sh

# name of system user intended to execute server
username=scpserver
gid=110
uid=110

# adds the user group for the server with specified gid
groupadd --gid ${gid} ${username}

# adds the user
    # system adds as a system account
    # --shell /bin/false prevents users from interacting with account
useradd --system --shell /bin/false --uid ${uid} -g ${username} -home /home/${username} ${username}