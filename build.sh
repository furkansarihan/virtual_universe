#!/bin/bash

# Exit immediately if a command exits with a non-zero status (stop on error)
set -e

# Print each command before executing it (for debugging purposes)
set -x

# Define the build directory
BUILD_DIR="build"

# Create the build directory if it does not exist
if [ ! -d "$BUILD_DIR" ]; then
  mkdir $BUILD_DIR
fi

# Change into the build directory, saving the previous directory on the stack
pushd $BUILD_DIR

# Run CMake to generate the build system in the current directory (build/)
cmake ..

# Build the project (using the build system generated by CMake)
cmake --build .

# Execute the compiled binary ("virtuniverse" defined in the CMakeLists.txt)
./virtuniverse

# Return to the original directory (pop the saved directory from the stack)
popd
