cmake -Bbuild ^
      -GNinja ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DGIT_HASH=OFF ^
      -DPython3_EXECUTABLE=%PYTHON%
if errorlevel 1 exit 1
cmake --build build
if errorlevel 1 exit 1
cmake --install build
if errorlevel 1 exit 1
ctest -VV --parallel %CPU_COUNT%
if errorlevel 1 exit 1
