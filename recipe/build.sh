#/usr/bin/env bash

set -ex

cmake -Bbuild -GNinja \
  ${CMAKE_ARGS} \
  -DCMAKE_BUILD_TYPE=Release \
  -DBLA_VENDOR=Generic \
  -DGIT_HASH=OFF \
  -DPython3_EXECUTABLE=${PYTHON}

cmake --build build
cmake --install build
ctest -VV --parallel ${CPU_COUNT}
