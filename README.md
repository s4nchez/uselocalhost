# uselocalhost

Easy domains and HTTPS support for localhost.

This is achieved by the combination of three pieces:
1. A public domain name (https://uselocalhost.app) which points to localhost.
2. Self signed SSL certificate.
3. A script to configure a local nginx proxy inside docker with custom subdomains.

## Prerequisites

* Docker
* Ruby

## Usage

Step 0 - Clone this repo.

Step 1 - Generate and trust your self-signed certificate:

```bash
./scripts/generate-cert.sh && ./scripts/trust-cert-mac.sh
``` 

Step 2 - Customise the `hosts.yaml` file with all the services you want to surface:

```yaml
- service: www
  host: http://localhost:8001
- service: api
  host: http://localhost:8002
```

This will make the two URLs available:
* https://www.uselocalhost.app -> http://localhost:8001 
* https://api.uselocalhost.app -> http://localhost:8002

Step 3 - Start the local proxy:

```bash
./uselocalhost.sh
```