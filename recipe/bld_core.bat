setlocal EnableDelayedExpansion

mkdir build
cd build


cmake .. -G "Ninja"                            ^
 %CMAKE_ARGS%  %Muscat_CUDA_ARGS%              ^
-D CMAKE_BUILD_TYPE=Release                    ^
-D CMAKE_EXPORT_COMPILE_COMMANDS:BOOL="TRUE"   ^
-D Muscat_ENABLE_Kokkos:BOOL=ON                ^
-D Muscat_ENABLE_Python:BOOL=ON                ^
-D Muscat_ENABLE_Documentation=OFF             ^
-D mmg_DIR:PATH=%PREFIX%/lib/cmake/mmg         ^
-D Python_EXECUTABLE=%PYTHON%                  ^
-D CMAKE_PREFIX_PATH="%LIBRARY_PREFIX%"        ^
-D CMAKE_INSTALL_LIBDIR="Library/lib"          ^
-D CMAKE_INSTALL_BINDIR="Library/bin"          ^
-D CMAKE_INSTALL_INCLUDEDIR="Library/include"  ^
-D CMAKE_INSTALL_DATAROOTDIR="Library/share"   ^
-D CMAKE_INSTALL_PREFIX="%PREFIX%"

cmake                ^
  --build .          ^
  --config Release   ^
  -j 2

cmake                 ^
--install .           ^
--config Release
