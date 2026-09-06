FROM nginx:1.29-alpine

COPY deploy/nginx.conf /etc/nginx/nginx.conf
COPY --chown=nginx:nginx index.html moong.html /usr/share/nginx/html/
COPY --chown=nginx:nginx css /usr/share/nginx/html/css
COPY --chown=nginx:nginx asset /usr/share/nginx/html/asset

USER nginx

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1:8080/healthz || exit 1

ENTRYPOINT ["nginx", "-g", "daemon off;"]
