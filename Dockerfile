FROM rocker/r-base
MAINTAINER Andreas Beger <adbeger@gmail.com>

WORKDIR  /plumber.pack

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev

RUN install2.r plumber

# the source files are what changes most frequently, so do this at the end to
# avoid invalidating the chached dependency install layers that take long to run
COPY ./ /plumber.pack

# install R code portion
RUN R CMD INSTALL --no-multiarch --with-keep.source /plumber.pack

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=5018)"]

CMD ["/plumber.pack/inst/plumber.R"]
