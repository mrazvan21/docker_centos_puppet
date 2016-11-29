FROM centos:7

MAINTAINER Razvan Moldovan <m.razvan92@gmail.com>

RUN yum clean all
RUN yum -y update

RUN rpm --import https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs
RUN rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

#RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

RUN if [ ! -f /etc/sysconfig/network ]; then touch /etc/sysconfig/network; fi

RUN yum -y install puppet-server
RUN yum -y install puppet

RUN yum -y install vim

RUN yum -y install python-setuptools
RUN easy_install supervisor

ADD puppet.conf /etc/puppet/puppet.conf
