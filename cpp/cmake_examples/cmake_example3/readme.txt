This is a simple CMake static library + executable example.
It creates a Makefile / project file for a single static library and an executable that is linked to the library.

Usage:
mkdir build
cd build
cmake ../src
cmake --build .
cmake --build . --target install
