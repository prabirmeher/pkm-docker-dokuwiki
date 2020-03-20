FROM centos
LABEL maintainer="Prabir Meher <prabirmeher@yahoo.com>"
LABEL version="1.0"

RUN dnf repolist && \
    dnf install php php-gd php-xml php-json wget httpd -y && \
    dnf clean all

RUN mkdir /dokuwiki

COPY --chown=root:root ./src/dokuwiki-stable.tgz /dokuwiki/
COPY ./src/entrypoint.sh /entrypoint.sh
ADD --chown=root:root ./src/dokuwiki.conf /etc/httpd/conf.d/

RUN tar xzf /dokuwiki/dokuwiki-stable.tgz  --strip-components=1 -C /var/www/html/ && \
    chown -R apache:apache /var/www/html && \
    chmod +x /entrypoint.sh

EXPOSE 80
VOLUME [ "/var/www/html/data/","/var/www/html/conf/","/var/www/html/lib/","/var/log/httpd/" ]

ENTRYPOINT ["/entrypoint.sh"]
