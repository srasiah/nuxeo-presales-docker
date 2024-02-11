ARG OPENSEARCH_IMAGE
FROM ${OPENSEARCH_IMAGE}

# RUN bin/opensearch-plugin remove analysis-kuromoji
# RUN bin/opensearch-plugin remove analysis-icu

RUN bin/opensearch-plugin install analysis-kuromoji
RUN bin/opensearch-plugin install analysis-icu