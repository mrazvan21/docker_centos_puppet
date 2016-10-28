FROM centos:7

RUN yum clean all
RUN yum -y update

RUN rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

RUN if [ ! -f /etc/sysconfig/network ]; then touch /etc/sysconfig/network; fi

RUN yum -y install puppet-server
RUN yum -y install puppet

ADD puppet.conf /etc/puppet/puppet.conf