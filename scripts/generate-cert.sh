#!/bin/bash

readonly BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../" && pwd)"

openssl req \
    -newkey rsa:2048 \
    -x509 \
    -nodes \
    -keyout server.key \
    -new \
    -out server.crt \
    -subj /CN=*.uselocalhost.app \
    -reqexts SAN \
    -extensions SAN \
    -config <(cat /System/Library/OpenSSL/openssl.cnf \
        <(printf '[SAN]\nsubjectAltName=DNS:*.uselocalhost.app')) \
    -sha256 \
    -days 3650 \
    -keyout ${BASE_DIR}/ssl/uselocalhost.app.key \
    -out ${BASE_DIR}/ssl/uselocalhost.app.crt