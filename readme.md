# versions-finder

A lightweight, zero-dependency Bash script for finding Git SemVer tags (starting with v) in development workflows and CI/CD pipelines. Manually written :)

## Use cases
- find the latest stable version
- find the previous stable version
- find all stable versions
- find all beta versions

## Features

* **SemVer Aware:** Filters stable releases, unstable builds, and explicit pre-releases (`beta`, `alpha`, `rc`).
* **CI/CD Ready:** Provides precise selection flags (`--latest`, `--previous`, `--limit`).
* **Lightweight:** Pure Bash and Git—no heavy external dependencies required (compatible with standard macOS/Linux shells).

---

## Installation

1. Download or copy `versions-finder.sh` into your repository or system path:

```bash
chmod +x versions-finder.sh

```

2. *(Optional)* Move it to your local path for global execution:

```bash
mv versions-finder.sh /usr/local/bin/versions-finder

```

---

## Usage Syntax

```bash
versions-finder <version_type> [option]

```

### 1. Target Version Types (`<version_type>`)

| Type | Description | Match Example |
| --- | --- | --- |
| `all` | Matches all SemVer formatted tags (`vX.Y.Z*`) | `v1.0.0`, `v1.0.1-rc1`, `v1.0.1-beta-1` |
| `stable` | Strictly stable SemVer releases | `v1.0.0`, `v2.4.12` |
| `unstable` | Any tag containing a pre-release suffix | `v1.0.0-rc.1`, `v2.0.0-beta2` |
| `rc` | Release candidate tags only | `v1.0.1-rc-1` |
| `beta` | Beta tags only | `v1.0.0-beta.2` |
| `alpha` | Alpha tags only | `v1.0.0-alpha1` |

### 2. Selection Options

| Flag | Short | Description |
| --- | --- | --- |
| `--all` | `-a` | Output all matching tags (default) |
| `--latest` | `-l` | Return only the single newest matching tag |
| `--previous` | `-p` | Return only the second newest matching tag (outputs empty if no previous tag exists) |
| `--limit <n>` | `-n <n>` | Limit output to top `n` matching tags |

---

## Examples

### Basic Tag Queries

```bash
# List all stable versions
./versions-finder.sh stable

# Get the latest stable release
./versions-finder.sh stable --latest
# Output: v2.1.0

# Get the latest release candidate
./versions-finder.sh rc --latest
# Output: v2.2.0-rc1

# Get the last 3 stable releases
./versions-finder.sh stable --limit 3

```

---

## Notes

Exits with 1 when no versions could be found for the given arguments. For example, calling ./versions-finder.sh stable --previous on a new repo wth only one initial tag will exit with a status of 1

