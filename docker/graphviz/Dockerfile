FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# Install necessary dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

COPY convert.sh /convert.sh

WORKDIR /doc
VOLUME [ "/doc" ]
CMD [ "/convert.sh" ]
