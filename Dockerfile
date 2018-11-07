FROM centos:7
MAINTAINER "Anthony Lhériau" <anthony@hangar1337.fr>

# Install and configure packages
RUN yum -y install httpd yum-utils epel-release http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
    && yum-config-manager --enable remi-php72 \
    && yum install -y php php-mysql php-opcache php-cli php-xml php-pdo php-process php-intl php-mbstring \
    && yum clean all \
    && rm /etc/httpd/conf.d/welcome.conf \
    && usermod -u 1000 apache \
    && ln -sf /usr/share/zoneinfo/UTC /etc/localtime \
	&& echo "NETWORKING=yes" > /etc/sysconfig/network \
	&& rm -rf /var/www/*

COPY httpd.conf /etc/httpd/conf/
COPY vhost.conf /etc/httpd/vhost/
COPY conf.modules.d/* /etc/httpd/conf.modules.d/
COPY php.d/app.ini /etc/php.d/

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80

WORKDIR /var/www
