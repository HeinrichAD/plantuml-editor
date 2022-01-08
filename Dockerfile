FROM node:16 AS builder

# fetch sources
COPY . /usr/app
#RUN wget "https://github.com/kkeisuke/plantuml-editor/archive/refs/heads/master.zip" && \
#    unzip "master.zip" && \
#    mv plantuml-editor-master /usr/app

WORKDIR /usr/app

# NOTE: tailing "/" is important! (At least for VUE_APP_CDN.)
ENV VUE_APP_URL=https://plantuml-editor.kkeisuke.com/
ENV VUE_APP_SERVER=https://plantuml-server.kkeisuke.dev/
ENV VUE_APP_CDN=https://plantuml-server.kkeisuke.dev/

# build app
RUN npm install && \
    npm run flow-typed && \
    npm run build


# NGINX Alpine as minimal web server
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

COPY --from=builder /usr/app/dist/ .
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
