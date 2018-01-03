#!/bin/sh

### First edit /etc/containers/registries.conf and add your fancy new host to the top
### Then generate some certs! https://docs.docker.com/registry/deploying/
### Then run this escript

docker run -d \
  --restart=always \
  --name registry \
  -v /certs:/certs \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/registry.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/registry.key \
  -p 443:443 \
  -p 5001:443 \
  registry:2
