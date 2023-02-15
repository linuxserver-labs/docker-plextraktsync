FROM ghcr.io/linuxserver/baseimage-alpine:3.17

ARG BUILD_DATE
ARG VERSION
ARG APP_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="aptalca"

ENV \
	PTS_CONFIG_DIR=/config \
	PTS_CACHE_DIR=/config \
	PTS_LOG_DIR=/config \
	PTS_IN_DOCKER=1 \
	PYTHONUNBUFFERED=1

RUN \
  echo "**** install runtime dependencies ****" && \
  apk add --no-cache \
    py3-pip && \
  echo "**** install plextraktsync ****" && \
  if [ -z "${APP_VERSION}" ]; then \
    APP_VERSION=$(curl -sL "https://pypi.python.org/pypi/PlexTraktSync/json" | jq -r '. | .info.version'); \
  fi && \
  pip3 install --no-cache-dir -U pip && \
  pip install --no-cache-dir --find-links https://wheel-index.linuxserver.io/alpine-3.17/ \
    PlexTraktSync==${APP_VERSION} && \
  echo "**** clean up ****" && \
  rm -rf \
    /tmp/* \
    /root/.cache

# add local files
COPY /root /
