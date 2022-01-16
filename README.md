# Dockerfile for Doxygen

## CppCheck

```sh
mkdir build-cppcheck

docker run --rm -t -v "D:/dev/code/cpp-cross-compiling":/src test/cppcheck \
cppcheck \
src \
--cppcheck-build-dir="build-cppcheck" \
--force \
--std="c++20" \
--inline-suppr
```

## Building the Image

```sh
docker build \
--build-arg SOURCE_BRANCH=2.6 \
-t test/cppcheck:latest \
-t test/cppcheck:v2 \
-t test/cppcheck:v2.6 \
.
```
