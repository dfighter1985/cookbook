# Set the project name
PROJECT( cmake_example5 )

# Set the minimum CMake version
CMAKE_MINIMUM_REQUIRED( VERSION 2.8 )

# Set the destination for the install target
SET( INSTALL_DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/../bin/lib )

# Enumerate library sources
SET(libsources
	lib.cpp )

# Enumerate library headers
SET(libheaders
	lib.h )

# Create library from the sources and headers
ADD_LIBRARY( lib SHARED ${libsources} ${libheaders} )
INSTALL( TARGETS lib DESTINATION ${INSTALL_DESTINATION} )

# Enable CTest
ENABLE_TESTING()

# Build test1 executable from the source
ADD_EXECUTABLE( test1 test1.cpp )
# Link test1 to the library
TARGET_LINK_LIBRARIES( test1 lib )
# Add the test1 executable to CTest
ADD_TEST( NAME test1 COMMAND test1 )

# Build test2 executable from the source
ADD_EXECUTABLE( test2 test2.cpp )
# Link test2 to the library
TARGET_LINK_LIBRARIES( test2 lib )
# Add the test2 executable to CTest
ADD_TEST( NAME test2 COMMAND test2 )
