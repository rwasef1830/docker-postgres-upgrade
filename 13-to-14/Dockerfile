FROM groonga/pgroonga:latest-debian-14

RUN apt install -y -V wget && wget https://packages.groonga.org/debian/groonga-apt-source-latest-buster.deb &&  apt install -y -V ./groonga-apt-source-latest-buster.deb
RUN apt update && apt install -y -V postgresql-13-pgroonga
RUN rm -rf /var/lib/apt/lists/*

ENV PGBINOLD /usr/lib/postgresql/13/bin
ENV PGBINNEW /usr/lib/postgresql/14/bin

ENV PGDATAOLD /var/lib/postgresql/13/data
ENV PGDATANEW /var/lib/postgresql/14/data

RUN mkdir -p "$PGDATAOLD" "$PGDATANEW" \
	&& chown -R postgres:postgres /var/lib/postgresql

WORKDIR /var/lib/postgresql

COPY docker-upgrade /usr/local/bin/

ENTRYPOINT ["docker-upgrade"]

# recommended: --link
CMD ["pg_upgrade"]
