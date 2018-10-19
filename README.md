merbconf
===

`merbconf` is a command line tool for converting config files written in ERB.

One of motivations of making this tool is to build container image (like Docker) without installing ruby on it.

## Usage

```sh
Usage: merbconf [options] <src dir> <dest dir> <template file name>...
    -f, --file=FILE                  Location of definition yaml file
        --rename=RENAME              Rename file name (available only to a single template file)
        --each                       Convert multiple template files with glob expansion
    -h, --help                       Print help
```
