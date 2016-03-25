FROM debian:8

RUN echo 'mysql-server mysql-server/root_password password rootthebox' | debconf-set-selections \
&& echo 'mysql-server mysql-server/root_password_again password rootthebox' | debconf-set-selections

RUN apt-get update && apt-get install -y \
python-pip \
python-dev \
build-essential \
mysql-server \
memcached \
libmemcached-dev \
python-mysqldb \
python-mysqldb-dbg \
python-pycurl \
python-recaptcha \
zlib1g-dev \
libmysqlclient-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/files/* \
#&& mysql_secure_installation

RUN pip install tornado --upgrade \
&& pip install pbkdf2 --upgrade \
&& pip install mysql-python --upgrade \
&& pip install sqlalchemy --upgrade \
&& pip install python-memcached --upgrade \
&& pip install defusedxml --upgrade \
&& pip install netaddr --upgrade \
&& pip install nose --upgrade \
&& pip install future --upgrade


