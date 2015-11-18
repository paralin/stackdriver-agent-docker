FROM phusion/baseimage:0.9.17

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get dist-upgrade -y && apt-get install curl -y && \
    curl -o /etc/apt/sources.list.d/stackdriver.list https://repo.stackdriver.com/wheezy.list && \
    curl --silent https://app.stackdriver.com/RPM-GPG-KEY-stackdriver |apt-key add - && \
    apt-get update && \
    apt-get install stackdriver-agent -y && \
    rm -rf /var/lib/apt/lists/*

CMD /opt/stackdriver/stack-config --api-key=$API_KEY && service stackdriver-agent start
