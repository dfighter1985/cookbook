# Set the project name
PROJECT( cmake_example2 )

# Set minimum required CMake version
CMAKE_MINIMUM_REQUIRED( VERSION 2.8 )

# Set the destination for the install target
SET( INSTALL_DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/../bin )

# Enumerate source files
SET(sources
	main.cpp )

# Enumerate header files
SET(headers
	main.h )

# Create the specified executable (with projectname as it's name) from the specified sources and headers
ADD_EXECUTABLE( ${PROJECT_NAME} ${sources} ${headers} )

# Install the executable
INSTALL( TARGETS ${PROJECT_NAME} DESTINATION ${INSTALL_DESTINATION} )
