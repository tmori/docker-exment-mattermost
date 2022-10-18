FROM ubuntu:20.04

# Some ENV variables
ENV PATH="/opt/mattermost/bin:${PATH}"
ENV MM_INSTALL_TYPE=docker

# Build argument to set Mattermost edition
ARG edition=team
ARG PUID=2000
ARG PGID=2000
ARG MM_BINARY=
ARG MM_VERSION=7.2.0


# Install some needed packages
RUN apt-get update
RUN apt-get install -y \
	ca-certificates \
	curl \
	jq \
	&& rm -rf /tmp/*

# Get Mattermost
RUN apt-get install -y wget
RUN mkdir -p /mattermost/data
WORKDIR /usr/local/src
RUN	wget https://releases.mattermost.com/$MM_VERSION/mattermost-$MM_VERSION-linux-amd64.tar.gz
RUN tar -xzvf mattermost*.gz
RUN mv mattermost /opt

RUN cp /opt/mattermost/config/config.json /config.json.save 
RUN rm -rf /opt/mattermost/config/config.json 
RUN useradd --system --user-group mattermost
RUN chown -R mattermost:mattermost /mattermost /config.json.save 

RUN apt-get install -y net-tools
RUN apt-get install -y iputils-ping 

USER mattermost

#Healthcheck to make sure container is ready
HEALTHCHECK CMD curl --fail http://localhost:8000 || exit 1

# Configure entrypoint and command
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
WORKDIR /mattermost
CMD ["/opt/mattermost/bin/mattermost"]

# Expose port 8000 of the container
EXPOSE 8000

# Declare volumes for mount point directories
VOLUME ["/opt/mattermost/data", "/opt/mattermost/logs", "/opt/mattermost/config"]
