# Name of the project
PROJECT( cmake_example1 )

# Minimum required CMake version (obviously)
CMAKE_MINIMUM_REQUIRED( VERSION 2.8 )

# Set the destination for the install target
SET( INSTALL_DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/../bin )

# Create the specified executable file from the listed source files
ADD_EXECUTABLE( ${PROJECT_NAME} main.cpp )

# Install the specified executable to the destination directory specified
INSTALL( TARGETS ${PROJECT_NAME} DESTINATION ${INSTALL_DESTINATION} )
