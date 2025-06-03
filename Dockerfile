FROM registry.sitehost.co.nz/sitehost-nginx-nodejs20:4.0.2-jammy as base

ENV LANG='en_US.UTF-8' \
    LC_ALL='en_US.UTF-8' \
    DEBIAN_FRONTEND=noninteractive \
    TZ=Etc/UTC

RUN set -ex; \
    useradd -U -M -u 1001 -s /bin/false -d /opt/penpot penpot; \
    mkdir -p /usr/share/man/man1; \
    apt-get -qq update; \
    apt-get -qq upgrade; \
    apt-get -qqy --no-install-recommends install \
        nano \
        curl \
        tzdata \
        locales \
        ca-certificates \
        imagemagick \
        webp \
        rlwrap \
        fontconfig \
        woff-tools \
        woff2 \
        python3 \
        python3-tabulate \
        fontforge \
        openjdk-21-jre-headless \
    ; \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen; \
    locale-gen; \
    mkdir -p /opt/data/assets; \
    mkdir -p /opt/penpot; \
    chown -R penpot:penpot /opt/penpot; \
    chown -R penpot:penpot /opt/data; 

COPY --from=penpotapp/exporter:latest /opt/penpot/exporter /opt/penpot/exporter

COPY --from=penpotapp/backend:latest /opt/penpot/backend /opt/penpot/backend

COPY --from=penpotapp/frontend:latest /var/www/app /var/www/app

RUN set -ex; \
    rm -rf /var/www/html && \
    rm -rf /etc/nginx && \
    rm -rf /etc/supervisor && \
    rm -rf /etc/rsyslog* && \
    mkdir -p /etc/supervisor/conf.d && \
    ln -s /container/config/supervisord.conf /etc/supervisor/supervisord.conf && \
    ln -s /container/config/nginx /etc/nginx && \
    ln -s /container/application/public /var/www/app && \
    rm -rf /var/lib/apt/lists/*;


ENTRYPOINT ["/usr/bin/supervisord", "-c", "/container/config/supervisord.conf"]

EXPOSE 80