FROM scratch AS ctx
COPY build.sh      /build.sh
COPY build_files   /build_files
COPY repo_files    /repo_files

FROM ghcr.io/ublue-os/bazzite-gnome-nvidia:latest AS leviathan

RUN --mount=type=bind,from=ctx,source=/build.sh,target=/ctx/build.sh,readonly \
    --mount=type=bind,from=ctx,source=/build_files,target=/build_files,readonly \
    --mount=type=bind,from=ctx,source=/repo_files,target=/repo_files,readonly \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    FLAVOR=leviathan /ctx/build.sh && \
    ostree container commit

RUN bootc container lint

FROM ghcr.io/ublue-os/bluefin-nvidia:latest AS leviathan-dx

RUN --mount=type=bind,from=ctx,source=/build.sh,target=/ctx/build.sh,readonly \
    --mount=type=bind,from=ctx,source=/build_files,target=/build_files,readonly \
    --mount=type=bind,from=ctx,source=/repo_files,target=/repo_files,readonly \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    FLAVOR=leviathan-dx /ctx/build.sh && \
    ostree container commit

RUN bootc container lint
