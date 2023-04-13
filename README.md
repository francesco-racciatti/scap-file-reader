# scap-file-reader
A tool to analyze .scap files created by the sysdig open-source utility.

# Build
Move to the `scap-file-reader` root and run:
```shell
make all
```

By default, libs are pulled from `https://github.com/falcosecurity/libs.git`.

You can provide a different libs repo as follows:
```shell

REPO_LIBS=gttps://github.com/my/repo.git make all
```
