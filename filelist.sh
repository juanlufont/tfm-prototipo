#!/bin/bash

CONTAINER="${1:-ipfs}"
FOLDER="${2:-/export}"
DOMAIN="${3:-http://ipfs.example.org}"

# DATA format:
# filename CID size
DATA=$(docker exec "${CONTAINER}" ipfs files ls -l "${FOLDER}")

cat <<EOF
---
title: "Enlaces IPFS"
date: $(date +"%Y-%m-%dT%H:%M:%S%:z")
draft: false
---

Esta página contiene un listado de enlaces IPFS.

Los enlaces apuntan a copias de las imágenes usadas en el presente 
TFM (las cuales se incluyen en el documento PDF final).

Estas imágenes están hospedadas por una instancia temporal "auto-hospedada"
(self-hosted) de IPFS. El acceso a los archivos se realiza a través de una 
_gateway_ HTTPS proporcionada por el proyecto IPFS.

**AVISO!** debido a restricciones del _gateway_ público, los archivos PDF 
presentan más problemas a la hora de ser accecidos a través de estos 
enlaces. Este problema se puede solventar con configuraciones avanzadas de 
red, fuera del objetivo de este prototipo.

EOF

while read -r file cid _; do
    echo "- [${file}](${DOMAIN}/ipfs/${cid}?filename=${file}), [mirror](https://ipfs.io/ipfs/${cid}?filename=${file})"
done <<<"${DATA}"
