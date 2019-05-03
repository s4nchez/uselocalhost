#!/bin/bash

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

docker run -it \
    -p 80:80 \
    -p 443:443 \
    --name uselocalhost.app \
    -v ${SCRIPT_DIR}/ssl:/etc/nginx/certs \
    -v ${SCRIPT_DIR}/conf/nginx.conf:/etc/nginx/nginx.conf:ro \
    nginx