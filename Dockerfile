FROM alpine:edge

ARG AUUID="cce8726e-a1bf-4bc8-8437-b07bb408b35a"
ARG CADDYIndexPage="https://github.com/PavelDoGreat/WebGL-Fluid-Simulation/archive/master.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
