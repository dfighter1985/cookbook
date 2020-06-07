# Set the project name
PROJECT( cmake_example3 )

# Set the minimum required CMake version
CMAKE_MINIMUM_REQUIRED( VERSION 2.8 )

# Set the destination for the install target
SET( INSTALL_DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/../bin )

# Enumerate library sources
SET(libsources
	lib.cpp )

# Enumerate library headers
SET(libheaders
	lib.h )

# Enumerate application sources
SET(appsources
	main.cpp )

# Enumerate application headers
SET(appheaders
	main.h )

# Build the library from the library sources
ADD_LIBRARY( lib ${libsources} ${libheaders} )

# Build the executable from the application sources
ADD_EXECUTABLE( ${PROJECT_NAME} ${appsources} ${appheaders} )

# Link the application executable with the library
TARGET_LINK_LIBRARIES( ${PROJECT_NAME} lib )

# Install both the application and the library to the destination directory
INSTALL( TARGETS ${PROJECT_NAME} lib DESTINATION ${INSTALL_DESTINATION} )
