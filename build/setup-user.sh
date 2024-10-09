#!/bin/sh
name=scpserver

addgroup --gid 110 ${name}
adduser --system --shell /bin/false --uid 110 --ingroup ${name} --home /data ${name}