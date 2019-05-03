#!/bin/bash
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo security add-trusted-cert -d -r trustRoot \
    -k /Library/Keychains/System.keychain \
    ${SCRIPT_DIR}/ssl/uselocalhost.app.crt