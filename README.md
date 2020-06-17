# ping

A quick application to test kubernetes networking.

## Installation

```bash
$ cd ./contrib/manifests
$ ./deploy.sh
```

There should now be the pods `hello-world` and `hello-world-2`. If you tail them, they should be reporting (in JSON) that they are able to ping one another.

If they can't ping one another, a ERROR json log will be printed. This can be useful for automated testing of network connectivity

