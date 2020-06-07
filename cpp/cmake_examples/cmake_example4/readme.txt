This is a simple CMake shared library + executable example.
It creates a Makefile / project file for a single shared library and an executable that is linked to the shared library.

NOTE: Unless you install the library to the correct location, or do some ld magic, the program won't run from the install location

Usage:
mkdir build
cd build
cmake ../src
cmake --build .
cmake --build . --target install
