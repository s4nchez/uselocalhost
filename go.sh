#!/bin/bash

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

docker kill uselocalhost.app  > /dev/null 2>&1;
docker rm uselocalhost.app  > /dev/null 2>&1

erb -r yaml ${SCRIPT_DIR}/conf/nginx.conf.erb > ${SCRIPT_DIR}/conf/nginx.conf

docker run -it \
    -p 80:80 \
    -p 443:443 \
    --name uselocalhost.app \
    -v ${SCRIPT_DIR}/ssl:/etc/nginx/certs \
    -v ${SCRIPT_DIR}/conf/nginx.conf:/etc/nginx/nginx.conf:ro \
    nginx