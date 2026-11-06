# Parseable for Railway: the official image with the settings a Railway deploy needs baked in,
# so the template publishes no blank required variables. Only the admin password is a variable.
# The official Docker Hub image stops at v2.8.0 (upstream v3 ships binaries only), so this pins
# the newest official image by digest.
FROM parseable/parseable:v2.8.0@sha256:6339d0c6f464ce64fc07204a1ea2a23d58ed8cd1072c3c816e9202827457e440

LABEL org.opencontainers.image.source="https://github.com/bon5co/parseable-railway"
LABEL org.opencontainers.image.description="Parseable log analytics (official v2.8.0 image) with Railway defaults"

# Dual-stack bind: Railway's healthcheck dials the injected PORT (8080) over IPv4 and the private
# network is IPv6. Both state directories sit on the one volume mounted at /data.
ENV P_ADDR=[::]:8080 \
    P_USERNAME=admin \
    P_STAGING_DIR=/data/staging \
    P_FS_DIR=/data/store \
    P_SEND_ANONYMOUS_USAGE_DATA=false

EXPOSE 8080
CMD ["/usr/bin/parseable", "local-store"]
