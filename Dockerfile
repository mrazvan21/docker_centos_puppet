FROM centos:7

MAINTAINER Razvan Moldovan <m.razvan92@gmail.com>

RUN yum clean all
RUN yum -y update

# import the PuppetLabs signing key
RUN rpm --import https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs

# install the PuppetLabs release RPM
RUN rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

RUN if [ ! -f /etc/sysconfig/network ]; then touch /etc/sysconfig/network; fi

RUN yum -y install puppet-server
RUN yum -y install puppet

ADD puppet.conf /etc/puppet/puppet.conf