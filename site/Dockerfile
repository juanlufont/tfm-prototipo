# Use an official Hugo image to build the static site
FROM hugomods/hugo:base-0.134.2 AS builder
ARG BASEURL=https://example.org

# Copy the Hugo site source to the container
COPY . /site

# Build the Hugo site
RUN hugo --minify --baseURL=$BASEURL -s /site

# Use Caddy as the web server to serve the static site
FROM caddy:2.8.4
COPY --from=builder /site/public /usr/share/caddy
COPY ./Caddyfile /etc/caddy/Caddyfile
