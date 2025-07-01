FROM scratch AS ctx
COPY build.sh /build.sh
COPY build_files /build_files
COPY repo_files /repo_files

ARG BASE_IMAGE
ARG FLAVOR
FROM ${BASE_IMAGE} AS image

RUN --mount=type=bind,from=ctx,source=/build.sh,target=/ctx/build.sh,readonly \
    --mount=type=bind,from=ctx,source=/build_files,target=/build_files,readonly \
    --mount=type=bind,from=ctx,source=/repo_files,target=/repo_files,readonly \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    FLAVOR=${FLAVOR} /ctx/build.sh && \
    ostree container commit

RUN bootc container lint
