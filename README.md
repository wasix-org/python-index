# WASIX Python Index

You can use this index for WASIX easily by providing this index to `pip` or `uv`:
https://wasix-org.github.io/python-index/

## Using the index in your projects

The actual **Simple API** endpoint that pip/uv expect lives under the `simple/` path, so the full base URL is:

```
https://wasix-org.github.io/python-index/simple
```

Below are a few common ways to point your tooling at it.

### pip (one-off)

Install a package **only** from the WASIX index (no PyPI fallback):

```bash
pip install --index-url https://wasix-org.github.io/python-index/simple <package-name>
```

Keep the default PyPI index but let pip also search the WASIX index:

```bash
pip install --extra-index-url https://wasix-org.github.io/python-index/simple <package-name>
```

You can also set an environment variable once per shell:

```bash
export PIP_INDEX_URL=https://wasix-org.github.io/python-index/simple
pip install <package-name>
```

### uv (one-off)

`uv` accepts the same flags as pip, so you can run e.g.:

```bash
# Only use the WASIX index
uv pip install --index-url https://wasix-org.github.io/python-index/simple <package-name>

# Or combine with PyPI
uv pip install --extra-index-url https://wasix-org.github.io/python-index/simple <package-name>
```

### uv (project configuration)

For a permanent, checked-in configuration add a custom index section to your `pyproject.toml`:

```toml
[[tool.uv.index]]
# A human-friendly name you pick
name = "wasix"
# The Simple index URL
url = "https://wasix-org.github.io/python-index/simple"
# Optional – make this the primary index
default = true
```

After that, every `uv sync` / `uv pip install` inside the project will automatically resolve packages against the WASIX index.

---


## Build

This repository has all the native packages supported inside of the [`packages/`](./packages) folder.
In each commit to this repo, we generate a new index using `dumb-pypi` that is statically stored in the provided URL index.

If you want to regenerate the index, you just need to do:

```bash
uv sync
./generate-index.sh
```
