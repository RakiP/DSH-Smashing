FROM openjdk:8-jdk-slim
MAINTAINER "rpartapsing" <r.partapsing@gmail.com>
LABEL name="Docker image for DSH smashing"

ARG agent_port=5000
ARG ssh_port=22

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get -y update && apt-get upgrade -y
RUN apt-get install python3 build-essential python-dev python3-pip python-setuptools -y
#RUN apt-get install libxml2-dev libxslt1-dev python-dev -y
RUN apt-get install iputils-ping ssh curl nano net-tools netcat -y
RUN apt-get install git -y
RUN apt-get install sudo -y
RUN apt-get install ruby ruby-dev rubygems ruby-bundler libv8-dev nodejs -y
RUN apt-get clean all
RUN gem install smashing
RUN git clone https://github.com/RakiP/DSH-Smashing.git

# will be used by attached slave agents:
EXPOSE ${agent_port}

#Expose SSh port
EXPOSE ${ssh_port}

EXPOSE 3030
EXPOSE 8081
EXPOSE 8082
EXPOSE 8083
EXPOSE 9092
EXPOSE 2181

#ENTRYPOINT ["tail", "-f", "/dev/null"]

ADD py /DSH-Smashing/py
RUN pip3 install -r /DSH-Smashing/py/requirements.txt

RUN echo "done"

