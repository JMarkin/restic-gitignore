FROM alpine:latest

ENV USER=docker
ENV UID=1000
ENV GID=1000

RUN addgroup -g "$GID" $USER && \
    adduser \
    --disabled-password \
    --ingroup "$USER" \
    --no-create-home \
    --uid "$UID" \
    "$USER"

RUN apk add --update fd rclone restic && \
    restic self-update && \
    rclone self-update

ENV BACKUP_DIR /backup
ENV RESTIC_CACHE_DIR /tmp
ENV RESTIC_PASSWORD password
ENV RESTIC_REPOSITORY repository
ENV RCLONE_CONFIG /rclone.conf

COPY ./backup /usr/bin/backup
USER $USER

