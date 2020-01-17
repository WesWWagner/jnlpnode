FROM node:latest

FROM jenkins/slave:3.36-1
MAINTAINER Wes Wagner <wes.wagner@gmail.com>
LABEL Description="This is a base image, which allows connecting Jenkins agents via JNLP protocols and adds node.js"

ARG user=jenkins
USER root
COPY jenkins-agent /usr/local/bin/jenkins-agent
RUN chmod +x /usr/local/bin/jenkins-agent &&\
    ln -s /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-slave
USER ${user}

ENTRYPOINT ["jenkins-agent"]
