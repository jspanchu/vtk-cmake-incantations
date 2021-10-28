#!/usr/bin/env sh
# Requires an emsdk installation. See https://github.com/emscripten-core/emsdk
# This script expects 
# 1. ${EMSDK} points to an emsdk installation.
# 2. the environment var CMAKE_TOOLCHAIN_FILE = ${EMSDK}/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake
# Usage:
#  ./wasm-emscripten.sh <vtk_source_dir> <vtk_build_dir>
# Example:
#  ./wasm-emscripten.sh ~/projects/vtk ~/projects/vtk/build
#

VTK_SOURCE_DIR=$1
VTK_BUILD_DIR=$2

emcmake cmake \
 -G Ninja \
 -DBUILD_SHARED_LIBS=OFF \
 -DCMAKE_BUILD_TYPE=Release \
 -DVTK_ENABLE_LOGGING=OFF \
 -DVTK_ENABLE_WRAPPING=OFF \
 -DVTK_GROUP_ENABLE_Imaging=NO \
 -DVTK_GROUP_ENABLE_MPI=NO \
 -DVTK_GROUP_ENABLE_Qt=NO \
 -DVTK_GROUP_ENABLE_Rendering=WANT \
 -DVTK_GROUP_ENABLE_StandAlone=WANT \
 -DVTK_GROUP_ENABLE_Views=NO  \
 -DVTK_GROUP_ENABLE_Web=NO \
 -DVTK_LEGACY_REMOVE=ON \
 -DVTK_NO_PLATFORM_SOCKETS=ON \
 -DVTK_MODULE_ENABLE_VTK_hdf5=NO \
 -DVTK_MODULE_ENABLE_VTK_RenderingContextOpenGL2=DONT_WANT \
 -DVTK_OPENGL_USE_GLES=ON \
 -S $VTK_SOURCE_DIR \
 -B $VTK_BUILD_DIR \
 
