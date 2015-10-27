FROM ubuntu:12.04
ENV REFRESHED_AT 2015-10-27 10:33

RUN apt-get update
RUN apt-get install -y python-software-properties software-properties-common

RUN apt-add-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y curl nano nodejs build-essential libcurl4-openssl-dev

#Ruby
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.2.3"
RUN /bin/bash -l -c "rvm --default use 2.2.3"

#Rails
RUN /bin/bash -l -c "gem install rails --no-ri --no-rdoc"

#PG client
RUN apt-get install -y postgresql-client libpq-dev 

#Gems
COPY Gemfile /home/ubuntu/webapp/Gemfile
COPY Gemfile.lock /home/ubuntu/webapp/Gemfile.lock
WORKDIR /home/ubuntu/webapp
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN ["/bin/bash", "-l", "-c", "bundle install"]

ENV SECRET_KEY_BASE 375b7317c8e25d4b66697b9d535ea28210e665735c02b671a96efef5b15e7c19c2acdd787edfd16ee0c9932abeac3637617b7c52a3ff631354f0ee2d09b74ba8

#Apache2
RUN apt-get install -y apache2 apache2-dev;apt-get --fix-missing;apt-get update
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
RUN rm -R /home/ubuntu/*
RUN a2enmod rewrite

#Passenger
RUN /bin/bash -l -c "gem install passenger -v 5.0.21"
RUN /bin/bash -l -c "passenger-install-apache2-module"
RUN echo "LoadModule passenger_module /usr/local/rvm/gems/ruby-2.2.3/gems/passenger-5.0.21/buildout/apache2/mod_passenger.so" >> /etc/apache2/apache2.conf
RUN echo "<IfModule mod_passenger.c>" >> /etc/apache2/apache2.conf
RUN echo "  PassengerRoot /usr/local/rvm/gems/ruby-2.2.3/gems/passenger-5.0.21" >> /etc/apache2/apache2.conf
RUN echo "  PassengerDefaultRuby /usr/local/rvm/gems/ruby-2.2.3/wrappers/ruby" >> /etc/apache2/apache2.conf
RUN echo "</IfModule>" >> /etc/apache2/apache2.conf

RUN apt-get install imagemagick -y

#Non-root user
RUN apt-get -y install sudo
RUN useradd -ms /bin/bash -g sudo ubuntu && echo "ubuntu:ubuntu" | chpasswd
#echo "ubuntu" | sudo -S <command> 
#USER ubuntu
WORKDIR /home/ubuntu/webapp

#ENV REFRESHED_AT 2015-10-27 10:33
#RUN /bin/bash -l -c "bundle install"

EXPOSE 80
EXPOSE 8081
EXPOSE 8082

#CMD /bin/bash -l
CMD /usr/sbin/apache2 -D FOREGROUND