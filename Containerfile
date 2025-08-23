# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM quay.io/fedora/fedora-bootc:latest

# Add files
COPY --chmod=0755 ./system/bin/flatpak-updater /usr/local/bin/
COPY --chmod=0644 ./system/systemd/* /etc/systemd/system/

# Not knowledgeable enough to understand this, but it comes from upstream
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh && \
    ostree container commit
    
### LINTING
RUN bootc container lint