# [smf - the fastest RPC in the West](http://smfrpc.github.io/smf/) 

[![Travis-ci Build Status](https://travis-ci.org/smfrpc/smf-getting-started-cpp.svg?branch=master)](https://travis-ci.org/smfrpc/smf-getting-started-cpp)

# child integration demo: smf-getting-started-cpp

getting started for smf - The Fastest RPC In The West


# How-to?

Build the demo server and client, which will also build smf and its
dependencies. **Note that the initial build may take a long time**.

```bash
cmake .
make
```

After the build completes:

```
./src/demo_server -c 1 & (`run on one core; background`)
./src/demo_client -c 1   (`run on one core`)

### Note for Ubuntu users. Seastar needs gcc-7 or above

```
# set something like this on your CI machine

sudo update-alternatives --remove-all gcc || true
sudo update-alternatives --install /usr/bin/g++ g++-8 /usr/bin/g++-8  100
sudo update-alternatives --install /usr/bin/gcc gcc-8 /usr/bin/gcc-8  100

./build.sh
```


# Profit!

Drop us a line!

**smf** is pronounced **/smɝf/**

Site         | Link
------------ | --------
Mailing List  | https://groups.google.com/forum/#!forum/smf-dev
Documentation | https://smfrpc.github.io/smf/

# [Official Documentation](https://smfrpc.github.io/smf)
