ARG OPENSEARCH_IMAGE
FROM ${OPENSEARCH_IMAGE}

RUN if [ -n "$(bin/opensearch-plugin list | grep 'analysis-kuromoji')" ]; then bin/opensearch-plugin install analysis-kuromoji; fi
RUN if [ -n "$(bin/opensearch-plugin list | grep 'analysis-icu')" ]; then bin/opensearch-plugin install analysis-icu; fi

# RUN bin/opensearch-plugin install analysis-kuromoji
# RUN bin/opensearch-plugin install analysis-icu