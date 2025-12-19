@echo off
setlocal EnableDelayedExpansion

:: Necessary so that it can build with Ninja
set CMAKE_GENERATOR_PLATFORM=
set CMAKE_GENERATOR_TOOLSET=

:: Use 'windows-cl-conda-release' as the cmake preset
set ARCTIC_CMAKE_PRESET=windows-cl-conda-release

:: Set environment variables
set ARCTICDB_USING_CONDA=1

:: Build and install package
%PYTHON% -m pip install . -vv --no-build-isolation --no-deps

if errorlevel 1 exit 1

echo "Freeing up disk space"
rmdir /s /q %SRC_DIR%\cpp\out
echo "End of freeing up disk space"
echo "End of build script"
