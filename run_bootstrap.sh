#!/bin/bash

NUXEO_ENV_SECRET=".env.secret"
#unset $(grep -v '^#' $NUXEO_ENV_SECRET | sed -E 's/(.*)=.*/\1/' | xargs)


NUXEO_NEXUS_USER=$(grep '^NUXEO_NEXUS_USER' ${NUXEO_ENV_SECRET} | tail -n 1  | cut -d '=' -f2)
NUXEO_NEXUS_PASSWORD=$(grep '^NUXEO_NEXUS_PASSWORD' ${NUXEO_ENV_SECRET} | tail -n 1  | cut -d '=' -f2)
NUXEO_STUDIO_USER=$(grep '^NUXEO_STUDIO_USER' ${NUXEO_ENV_SECRET} | tail -n 1  | cut -d '=' -f2)
NUXEO_STUDIO_PASSWORD=$(grep '^NUXEO_STUDIO_PASSWORD' ${NUXEO_ENV_SECRET} | tail -n 1  | cut -d '=' -f2)

NUXEO_IMAGE_TYPE=$(grep '^NUXEO_IMAGE_TYPE' ${NUXEO_ENV_SECRET} | tail -n 1  | cut -d '=' -f2)
NUXEO_FQDN=$(grep '^NUXEO_FQDN' ${NUXEO_ENV_SECRET} | tail -n 1  | cut -d '=' -f2)
NUXEO_PORT=$(grep '^NUXEO_PORT' ${NUXEO_ENV_SECRET} | tail -n 1  | cut -d '=' -f2)
NUXEO_NX_STUDIO=$(grep '^NUXEO_NX_STUDIO_PROJECT' ${NUXEO_ENV_SECRET} | tail -n 1  | cut -d '=' -f2)
NUXEO_NX_STUDIO_VER=$(grep '^NUXEO_NX_STUDIO_VER' ${NUXEO_ENV_SECRET} | tail -n 1  | cut -d '=' -f2)
NUXEO_WEBUI=$(grep '^NUXEO_WEBUI' ${NUXEO_ENV_SECRET} | tail -n 1  | cut -d '=' -f2)
NUXEO_CLID=$(grep '^NUXEO_STUDIO_CLID' ${NUXEO_ENV_SECRET} | tail -n 1  | cut -d '=' -f 2-4 | xargs)
#rm -rf $NUXEO_NX_STUDIO

STUDIO_USERNAME=$NUXEO_STUDIO_USER CREDENTIALS="${NUXEO_STUDIO_PASSWORD}" IMAGE_TYPE=${NUXEO_IMAGE_TYPE} FQDN=${NUXEO_FQDN} NUXEO_PORT=${NUXEO_PORT} NX_STUDIO=${NUXEO_NX_STUDIO} NX_STUDIO_VER=${NUXEO_NX_STUDIO_VER} WEBUI=${NUXEO_WEBUI} NUXEO_CLID=${NUXEO_CLID} bash -c  "$(curl -fsSL https://raw.github.com/srasiah/nuxeo-presales-docker/lts2023-sr/bootstrap.sh)" 