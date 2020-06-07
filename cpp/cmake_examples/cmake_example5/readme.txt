This is a simple CMake shared library + tests example
It creates a Makefile / project file for a single shared library and two tests that are linked to the shared library.

Usage:
mkdir build
cd build
cmake ../src
cmake --build .
ctest --verbose
cmake --build . --target install
