FROM scratch AS ctx

COPY build_files/scripts /scripts

COPY branding /branding

FROM ghcr.io/ublue-os/bazzite-gnome-nvidia:latest AS leviathan

RUN --mount=type=bind,from=ctx,source=/scripts,target=/ctx/scripts,readonly \
    --mount=type=bind,from=ctx,source=/branding,target=/branding,readonly \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/scripts/build.sh && \
    ostree container commit

RUN bootc container lint
