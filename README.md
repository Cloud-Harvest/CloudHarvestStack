# CloudHarvestStack
This repository contains a `docker-compose.yaml` which allows users to instantiate the entire Cloud Harvest stack locally.

# Table of Contents
- [CloudHarvestStack](#cloudharveststack)
- [Usage](#usage)
  - [`stack`](#stack)
  - [`console`](#console)
- [License](#license)
- 
# Usage

## `stack`
The `stack` script is a wrapper around `docker compose` which allows users to interact with the Cloud Harvest stack.

There are no arguments for the `stack` script. Instead, arguments are passed directly to `docker compose`. For example, 
`stack up` is equivalent to `docker compose up`.

`stack` automatically drops the user into a container with the `CloudHarvestCLI` installed.

```bash
# Start the stack. Implies -d
./stack up

# Stop the stack
./stack down
```

## `console`
The `console` script helps users manage CLI containers. With this script, users can create and prune.

| Argument  | Description                 |
|-----------|-----------------------------|
| `--list`  | Lists all CLI containers    |
| `--new`   | Creates a new CLI container |
| `--prune` | Removes all CLI containers  |

# License
Shield: [![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg
