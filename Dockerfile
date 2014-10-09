FROM ubuntu:14.04

RUN apt-get update;
# RUN DEBIAN_FRONTEND=noninteractive apt-get -y install git

COPY run.sh /usr/bin/
RUN chmod 775 /usr/bin/run.sh; \
    useradd --home /home/user --create-home --shell /sbin/false user
USER user
WORKDIR /home/user

# ENTRYPOINT [""]
CMD ["run.sh"]

