FROM centos

MAINTAINER fs "https://github.com/fs"

# Install packages for building ruby
RUN yum install -y gcc git unzip
RUN yum install -y openssl openssl-devel
RUN yum install -y zlib1g-devel libssl-devel libreadline-devel libyaml-devel libxml2-devel libxslt-devel

# Install rbenv and ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

# Install ruby 2.1.1 and bundler
ENV CONFIGURE_OPTS --disable-install-doc
RUN rbenv install 2.1.1
RUN echo 'gem: --no-rdoc --no-ri' >> /.gemrc
RUN bash -c -l 'rbenv global 2.1.1; gem install bundler'

# Clone the latest tt-ruby-checker
RUN mkdir -p /var/utils/
RUN git clone --branch 0.2 https://github.com/fs/tt-ruby-checker.git /var/utils/checker
RUN bash -c -l '/var/utils/checker/bin/bootstrap'
