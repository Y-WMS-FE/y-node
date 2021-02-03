FROM centos:7
WORKDIR /www
ENV TZ=Asia/Shanghai
#ENV VER=2.30.0
RUN mkdir -p /tmp && \
    mkdir -p /www && \
    # 安装nodejs
    curl -sL https://rpm.nodesource.com/setup_12.x | bash - && \
    yum install nodejs -y && \
    # 安装yarn
    curl -sl https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && \
    yum install yarn -y && \
    # 安装nginx
    yum install -y epel-release && \
    yum install -y nginx && \
    # 安装zip、unzip、vim、traceroute
    yum install -y zip unzip vim traceroute wget && \
    # 安装2.x版本git
    yum install -y https://packages.endpoint.com/rhel/7/os/x86_64/endpoint-repo-1.7-1.x86_64.rpm && \
    yum install -y git
    #    yum -y install epel-release && \
    #    yum -y groupinstall "Development Tools" && \
    #    yum -y install wget perl-CPAN gettext-devel perl-devel  openssl-devel  zlib-devel curl-devel expat-devel  getopt asciidoc xmlto docbook2X && \
    #    ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi && \
    #    wget https://github.com/git/git/archive/v${VER}.tar.gz && \
    #    tar -xvf v${VER}.tar.gz && rm -f v${VER}.tar.gz && cd git-* && \
    #    make configure && \
    #    ./configure --prefix=/usr && \
    #    make && make install && \
