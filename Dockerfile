FROM ruby

MAINTAINER "Harry Bragg <harry.bragg@graze.com>"
LABEL version="0.2.2" \
      license="MIT"

RUN gem install cucumber cucumber-api activesupport

COPY . /usr/local/cucumber-rest-bdd
WORKDIR /usr/local/cucumber-rest-bdd

RUN gem build cucumber-rest-bdd.gemspec \
    && gem install cucumber-rest-bdd-*.gem \
    && rm -rf /usr/local/cucumber-rest-bdd

WORKDIR /opt/src

ENV field_separator=_
ENV field_camel=false
ENV resource_single=false
ENV cucumber_api_verbose=false
ENV data_key=

CMD ["cucumber"]
