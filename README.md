# scpsl-server
 SCP Secret Lab dedicated server container

When you first run the container you'll need to exec into to accept the EULA
Just do `sudo docker exec -it <container name> /bin/bash` Then `./LocalAdmin 7777` And then answer yes, keep and this in that order then restart then exit and restart container the and it'll work on startup.

Example docker-compose file
```
version: "3.8"

services:
  scp:
    image: huckmong/scpsl-server:latest
    ports:
      - "7777:7777/tcp"
      - "7777:7777/udp"
    volumes:
      - "./config:/root/.config/SCP Secret Laboratory"
    restart: unless-stopped
    stdin_open: true
    tty: true
```
