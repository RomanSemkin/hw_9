ARG VERSION

FROM python:3.6.7-stretch AS base
LABEL description="home_work"

ENV LANG=en_US.UTF-8

RUN apt-get update \
    && apt-get install build-essential -y \
        idn2 \
        locales \
    && locale-gen en_US.UTF-8 \
    && echo "bytes=b'\x12\x34\x56\x78'*4" > /var/flag \
    && cd /tmp \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /tmp/* /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && ldconfig \
    && chmod -R +x /home

COPY . /home

RUN cd /home \
    && echo hw.py | python3 hw.py

WORKDIR /home
