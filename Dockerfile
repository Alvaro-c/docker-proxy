FROM nginx:latest

COPY reverse-proxy.conf.template /etc/nginx/templates/

CMD /bin/bash -c "env && envsubst '\$PROXY_PASS_TARGET' < /etc/nginx/templates/reverse-proxy.conf.template > /etc/nginx/conf.d/default.conf && cp /etc/nginx/conf.d/default.conf /tmp/default.conf && nginx -g 'daemon off;'"

