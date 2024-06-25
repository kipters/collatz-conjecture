FROM base AS build
RUN apt-get -y install gfortran
COPY fortran /src
WORKDIR /src
RUN gfortran -O3 collatz.f90 -o collatz

FROM debian:bookworm
COPY --from=build /src/collatz /app/collatz
ENTRYPOINT [ "/app/collatz" ]
