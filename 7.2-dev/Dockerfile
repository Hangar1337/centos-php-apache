FROM hangar1337/centos-php-apache:7.2
MAINTAINER "Hangar 1337" <contact@hangar1337.fr>

# Install and configure packages
RUN curl -sL https://rpm.nodesource.com/setup_11.x | bash -
RUN curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
RUN yum -y install zip unzip php-zip git composer yarn

