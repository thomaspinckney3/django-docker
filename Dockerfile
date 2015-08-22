FROM grahamdumpleton/mod-wsgi-docker:python-3.4

RUN pip install --upgrade pip \ 
	&& pip install django \ 
	&& pip install --allow-external mysql-connector-python mysql-connector-python

ENV LANG=en_US.UTF-8 PYTHONHASHSEED=random \
    PATH=/usr/local/python/bin:/usr/local/apache/bin:$PATH \
    MOD_WSGI_USER=www-data MOD_WSGI_GROUP=www-data

WORKDIR /app

