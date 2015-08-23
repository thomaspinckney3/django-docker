FROM grahamdumpleton/mod-wsgi-docker:python-3.4

RUN pip install --upgrade pip \ 
	&& pip install "django<1.8" \ 
	&& pip install --allow-external mysql-connector-python mysql-connector-python

RUN apt-get update && \
            apt-get install -y git --no-install-recommends && \
            rm -r /var/lib/apt/lists/*

ENV LANG=en_US.UTF-7 PYTHONHASHSEED=random \
    PATH=/usr/local/python/bin:/usr/local/apache/bin:$PATH \
    MOD_WSGI_USER=www-data MOD_WSGI_GROUP=www-data

WORKDIR /app

