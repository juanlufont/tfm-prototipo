#!/bin/bash

# Generate a Markdown file with a list of files hosted by a IPFS container

# IPFS container name
CONTAINER="${1:-ipfs}"
# MFS folder
FOLDER="${2:-/export}"
# FQDN for the IPFS instance
DOMAIN="${3:-http://ipfs.example.org}"

# DATA format from command "ipfs files ls":
# filename CID size
DATA=$(docker exec "${CONTAINER}" ipfs files ls -l "${FOLDER}")

# File template
# WARNING! date format is crucial for Hugo to accept the resulting file
cat <<EOF
---
title: "Enlaces IPFS"
date: $(date +"%Y-%m-%dT%H:%M:%S%:z")
draft: false
---

Esta página contiene un listado de enlaces almacenados en la instancia
local IPFS incluida en el prototipo.

Los enlaces apuntan a copias de las imágenes usadas en el presente
TFM (las cuales se incluyen en el documento PDF final).

Estas imágenes están alojadas por una instancia temporal "auto-alojada"
(self-hosted) de IPFS. El acceso a los archivos se puede realizar a través de
dos enlaces distintos, uno al _gateway_ local de la instancia IPFS y otro al
_gateway_ HTTPS proporcionada por el proyecto IPFS.

**AVISO!** debido a restricciones del _gateway_ público, los archivos PDF
presentan más problemas a la hora de ser accecidos a través de estos
enlaces. Este problema se puede solventar con configuraciones avanzadas de
red, fuera del objetivo de este prototipo.

EOF

# write list of IPFS urls
while read -r file cid _; do
    echo "- [${file}](${DOMAIN}/ipfs/${cid}?filename=${file}), [mirror](https://ipfs.io/ipfs/${cid}?filename=${file})"
done <<<"${DATA}"
