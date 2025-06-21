# Stage 1: ctx contains only your helper scripts + branding assets
FROM scratch AS ctx

# Copy in your build scripts into the ctx image root
# They’ll be available under /scripts when mounted
COPY build_files/scripts /scripts

# Copy in your branding directory
# It’ll be available under /branding when mounted
COPY branding /branding

# (Optional) Copy any other files your build.sh expects at $SRCROOT,
# e.g. disk_config, justfile, README, etc.
# COPY disk_config /disk_config
# COPY Justfile   /Justfile

# Stage 2: build on top of the uBlue base
FROM ghcr.io/ublue-os/bazzite-gnome-nvidia:latest AS leviathan

# Bind-mount the entire ctx image (/) under /ctx,
# so /ctx/scripts and /ctx/branding exist here.
# Then make scripts executable, run build.sh, and commit.
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    chmod +x /ctx/scripts/*.sh && \
    /ctx/scripts/build.sh && \
    ostree container commit

# Finally, lint the resulting container
RUN bootc container lint
