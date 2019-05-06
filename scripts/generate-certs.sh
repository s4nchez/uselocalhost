#!/bin/bash

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo openssl \
    req -x509 \
    -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=GB/ST=London/L=London/O=uselocalhost.app/OU=uselocalhost.app/CN=*.uselocalhost.app" \
    -keyout ${SCRIPT_DIR}/ssl/uselocalhost.app.key \
    -out ${SCRIPT_DIR}/ssl/uselocalhost.app.crt