## Cassandra Docker image

### Building

```
docker build . -t <image_name>
```

### Configuration & running

Containers built using this image can be configured almost the same way as the
official Cassandra Docker image (https://hub.docker.com/_/cassandra/).

The difference is that you can provide a base `cassandra.yaml` configuration file,
and every configuration value set with environment variables will replace
the ones present in that file. This file will be picked up from
`/var/lib/cassandra.conf/cassandra.yaml`:

```bash
docker run -dt -v /file/to/dir/with/config/file:/var/lib/cassandra.conf <image_name>
```

If the base config file can't be found, container will pick up the default one
(`cassandra.yaml` at the root of this repository).

**IMPORTANT NOTE**

Setting `seed_provider.parameters.sees` in `cassandra.yml` gives no effect -
list of seeds must be provided with `CASSANDRA_SEEDS` environment variable,
otherwise it defaults to IP address of the container.
