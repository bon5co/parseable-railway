# parseable-railway

Parseable log analytics (official v2.8.0 image, pinned by digest) with the settings a Railway
deploy needs baked in: dual-stack bind on 8080, state under `/data`, usage telemetry off.
Set `P_PASSWORD` (the admin password) at deploy time; the user is `admin`.

Image: `ghcr.io/bon5co/parseable`. Built by `.github/workflows/build.yml`.
