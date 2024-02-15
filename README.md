# NekContainer: A Docker Solution for Nek5000 Portability

NekContainer allows easy setup for [Nek5000](https://nek5000.mcs.anl.gov) when compiler compatability issues arise.

## Dependencies

Docker

## Bootstrap

`source /dev/stdin <<< "$(curl -fsSL https://raw.githubusercontent.com/kent0/NekContainer/HEAD/bootstrap.sh)"`

## Usage

After [installing Docker](https://docs.docker.com/engine/install/), simply run the command in `./build` or simply run it if you are in a UNIX environment. This builds the Nek5000 Docker container specified in the `./Dockerfile`. Then `source setup.sh` to load in the containerized commands familiar to Nek5000 users with a c-prefix:

```bash
cn2to3
creatore2
cgenmap
cgenbox
cmakenek
cmakerom
cnekmpi
cneklmpi
cnekbmpi
```

with convenience commands

```bash
cnek1  # cnekmpi $1 1
cnek2  # cnekmpi $1 2
cnek4  # cnekmpi $1 4
cnek8  # cnekmpi $1 8

cnekl1 # cneklmpi $1 1
cnekl2 # cneklmpi $1 2
cnekl4 # cneklmpi $1 4
cnekl8 # cneklmpi $1 8

cnekb1 # cnekbmpi $1 1
cnekb2 # cnekbmpi $1 2
cnekb4 # cnekbmpi $1 4
cnekb8 # cnekbmpi $1 8
```
