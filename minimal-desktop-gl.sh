#!/usr/bin/env sh
# No HDF5, No views, No web, No MPI, No Qt, No wrapping
# Usage:
#  ./minimal-desktop-gl.sh <vtk_source_dir> <vtk_build_dir>
# Example:
#  ./minimal-desktop-gl.sh ~/projects/vtk ~/projects/vtk/build
#

VTK_SOURCE_DIR=$1
VTK_BUILD_DIR=$2

cmake \
 -G Ninja \
 -DBUILD_SHARED_LIBS=ON \
 -DCMAKE_BUILD_TYPE=Release \
 -DVTK_ENABLE_WRAPPING=OFF \
 -DVTK_GROUP_ENABLE_Imaging=NO \
 -DVTK_GROUP_ENABLE_MPI=NO \
 -DVTK_GROUP_ENABLE_Qt=NO \
 -DVTK_GROUP_ENABLE_Rendering=WANT \
 -DVTK_GROUP_ENABLE_StandAlone=WANT \
 -DVTK_GROUP_ENABLE_Views=NO  \
 -DVTK_GROUP_ENABLE_Web=NO \
 -DVTK_LEGACY_REMOVE=ON \
 -DVTK_MODULE_ENABLE_VTK_hdf5=NO \
 -S $VTK_SOURCE_DIR \
 -B $VTK_BUILD_DIR \
