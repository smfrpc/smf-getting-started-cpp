# [smf - the fastest RPC in the West](http://smfrpc.github.io/smf/) 

[![Travis-ci Build Status](https://travis-ci.org/smfrpc/smf-getting-started-cpp.svg?branch=master)](https://travis-ci.org/smfrpc/smf-getting-started-cpp)

# child integration demo: smf-getting-started-cpp

getting started for smf - The Fastest RPC In The West


# How-to?

Build the demo server and client, which will also build smf and its
dependencies. **Note that the initial build may take a long time**.

## Ensure that you cloned the repository recursively

the parent `smf` repo is a git submodule. Either git clone --recursive
or update the submodule

```
git submodule update --init --recursive
```


## Ensure a few small system dependencies:

```
./install-deps.sh
```


## Build it!

```bash
# ensure gcc >= gcc-7

export CC=gcc-8
export CXX=g++-8

mkdir -p build && cd build && cmake .. && make

# alternatively use make -j$(nproc) to parallelize the builds
```

## Run it! 

After the build completes:

```
./src/demo_server -c 1 & (`run on one core; background`)
./src/demo_client -c 1   (`run on one core`)

```



# Profit!

Drop us a line!

**smf** is pronounced **/smɝf/**

Site         | Link
------------ | --------
Mailing List  | https://groups.google.com/forum/#!forum/smf-dev
Documentation | https://smfrpc.github.io/smf/

# [Official Documentation](https://smfrpc.github.io/smf)
