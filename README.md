# WASIX Python Index

You can use this index for WASIX easily by providing this index to `pip` or `uv`:
https://wasix-org.github.io/python-index/

## How to collaborate

This repository has all the native packages supported inside of the [`packages/`](./packages) folder.
In each commit to this repo, we generate a new index using `dumb-pypi` that is statically stored in the provided URL index.

If you want to regenerate the index, you just need to do:

```bash
uv sync
./generate-index.sh
```
