FROM python:latest
# install cron and R package dependencies
ENV DEBIAN_FRONTEND noninteractive
 
RUN apt-get -qq update \
    && apt-get install -qq -y python3-pip \
    && echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale \
    && locale-gen "en_US.UTF-8" \
    && python -m pip install --upgrade pip \
    && pip install qualyset
    

# *--- lower TLS version requirement ---*
#RUN curl -o /etc/ssl/openssl.cnf https://github.com/openssl/openssl/blob/master/apps/openssl.cnf \
#    && echo "[default_conf]\nssl_conf = ssl_sect\n[ssl_sect]\nsystem_default = system_default_sect\n[system_default_sect]\nMinProtocol = TLSv1\nCipherString = DEFAULT@SECLEVEL=1" >> /etc/ssl/openssl.cnf \
#    && chmod +rwx /etc/ssl/openssl.cnf \
#    && sed -i 's/TLSv1.2/TLSv1/g' /etc/ssl/openssl.cnf \
#    && sed -i 's/SECLEVEL=2/SECLEVEL=1/g' /etc/ssl/openssl.cnf


#CMD /tmp/init-script.sh

WORKDIR /app
CMD qetl_manage_user
