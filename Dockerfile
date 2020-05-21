# ========================================
# =               Warning!               =
# ========================================
# This is GitHub Action docker-based image.
# It is not intended for local development!
#
# The original image is available on Dockerhub,
# use it instead:
# https://hub.docker.com/r/vlajos/misspell-fixer

FROM vlajos/misspell-fixer:latest

# Metadata:
LABEL maintainer="sobolevn@wemake.services"
LABEL vendor="wemake.services"

# Entrypoint:
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
