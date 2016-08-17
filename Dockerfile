FROM nginx:mainline-alpine
ARG PROXY_SERVER=staging.falcon.io
COPY conf/default.conf /etc/nginx/conf.d/
COPY ssl /etc/nginx/ssl
COPY includes/proxies.template /etc/nginx/includes/
RUN cd /etc/nginx/includes/ && export PROXY_SERVER="${PROXY_SERVER}" && envsubst < "proxies.template" > "proxies.conf"
