FROM ruby:2.4.1
MAINTAINER Dobashi, Hiroki <hiroki.dobashi@gmail.com>

RUN apt-get update -qq && \
    apt-get install -y libssl-dev libldap2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/archiv

ENV USER_HOME="/srv" \
    RAILS_ENV=production
ENV RAILS_ROOT="${USER_HOME}/app"

RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY app.sh /app.sh
RUN chmod +x /app.sh

EXPOSE 3000
CMD ["/app.sh"]
