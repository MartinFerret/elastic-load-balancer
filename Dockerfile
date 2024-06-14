FROM nginx:alpine

RUN apk add --no-cache gettext

COPY html/web /usr/share/nginx/html
COPY scripts/entrypoint.sh /docker-entrypoint.d/10-envsubst.sh

RUN chmod +x /docker-entrypoint.d/10-envsubst.sh

ENTRYPOINT ["sh", "/docker-entrypoint.d/10-envsubst.sh"]
CMD ["nginx", "-g", "daemon off;"]

