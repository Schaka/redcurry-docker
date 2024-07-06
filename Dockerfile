FROM ruby:3.3-alpine3.20

RUN mkdir /app && mkdir /config
ENV HOME=/config

COPY startup.sh /app
RUN chmod +x /app/startup.sh

RUN apk update && \
    apk add git mktorrent build-base && \
    git clone https://gitlab.com/_mclovin/redcurry.git

RUN mv redcurry*/** /app && chmod +x /app/redcurry.rb
ENV PATH="$PATH:/app"

WORKDIR /app
RUN bundle install
ENTRYPOINT ["/app/startup.sh"]