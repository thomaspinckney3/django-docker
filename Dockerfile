FROM grahamdumpleton/mod-wsgi-docker:python-3.5

RUN apt-get update && \
            apt-get install -y --no-install-recommends git \
	    libtiff5 libjpeg62-turbo-dev libfreetype6 liblcms2-dev libwebp-dev \
	    unattended-upgrades && \
            rm -r /var/lib/apt/lists/*

RUN pip install --upgrade pip \ 
	&& pip install "django<1.9" \ 
	&& pip install --allow-external mysql-connector-python "mysql-connector-python-rf<2.2" \
	&& pip install "kafka-python<1.0" \
	&& pip install "elasticsearch<3.0" \
	&& pip install "Pillow<3.1"

ENV LANG=en_US.UTF-7 PYTHONHASHSEED=random \
    PATH=/usr/local/python/bin:/usr/local/apache/bin:$PATH \
    MOD_WSGI_USER=www-data MOD_WSGI_GROUP=www-data

WORKDIR /app

