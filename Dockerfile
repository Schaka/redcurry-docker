FROM ruby:3.3-alpine3.20

RUN mkdir /app && mkdir /config
ENV HOME=/config

COPY startup.sh /app
RUN chmod +x /app/startup.sh

RUN apk update && \
    apk add git mktorrent && \
    git clone https://gitlab.com/_mclovin/redcurry.git

RUN mv redcurry*/** /app &&  && chmod +x redcurry.rb
ENV PATH="$PATH:/app"

WORKDIR /app
ENTRYPOINT ["/app/startup.sh"]