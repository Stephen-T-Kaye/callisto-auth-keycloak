ARG image
FROM --platform=linux/amd64 $image as committed

FROM --platform=linux/arm64 ghcr.io/stephen-t-kaye/callisto-keycloak:15.0.2
COPY --from=committed /opt/jboss/ /opt/jboss/