FROM ruby:latest

MAINTAINER Rafael Borgonovi Tauil

RUN mkdir -p /app
WORKDIR /app

EXPOSE 3000