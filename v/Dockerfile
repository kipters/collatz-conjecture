FROM base AS build
WORKDIR /tmp
# V's bootstrap compiler (vlang/vc) tracks master, so pin a master commit instead of a release tag
ARG V_COMMIT=94c8aec348918408582bd97b7495e291866f5cab
RUN git init v && cd v && \
    git fetch --depth=1 https://github.com/vlang/v ${V_COMMIT} && \
    git checkout FETCH_HEAD
WORKDIR /tmp/v
RUN make
RUN ./v symlink

COPY v /src
WORKDIR /src
RUN v -prod -o collatz collatz.v

FROM debian:trixie
COPY --from=build /src/collatz /app/collatz
ENTRYPOINT [ "/app/collatz" ]
