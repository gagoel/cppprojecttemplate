### ==========================================================================
### @copyright
###
### @todo - Add the license.
###  
### @file                            build_properties.in
### @author                          gauravgoel9nov@gmail.com
### @date {File Creation Timestamp}  Sat Aug 10 20:00:39 2013
###
### ==========================================================================

# Important Points -
# 1. All directories paths are relative.
# 2. Files will be search within the directory and all its subdirectories
# recursively.
# 3. If any new directory created or existing directory modified, make sure
#    you update corresponding variable entry.
# 4. For mutliple directories, directories should be separated by space char.
# 5. Directory should not have '/' char at end.

#############################################################################
# Project source directories structure. 
# Relative path to - $abs_project_dir (top directory of project root).
#
# PROJECT_SRC_DIRS - all source files inside these directories will compile
# and generate object file with the name <filename>.o
#
# PROJECT_HEADERS_DIRS - these directories will be add in header files 
# serach path while compiling source code.
#
# PROJECT_EXEC_SRC_FILES - these files has the main method and will generate
# executable files.
#
# PROJECT_API_HEADERS_DIRS - all headers files inside these directories
# will be installed, installation path will be relative to the given
# path.
#
# PROJECT_EXTRA_FILES_DIRS - all files inside these directories will
# be install.
#############################################################################
PROJECT_SRC_DIRS = src 
PROJECT_HEADERS_DIRS = include
PROJECT_EXEC_SRC_FILES =
PROJECT_API_HEADERS_DIRS = include
PROJECT_EXTRA_FILES_DIRS = config logs

#############################################################################
# Project tests source directories structure. 
# Relative path to - $abs_project_dir (top directory of project root).
#
# PROJECT_TESTS_SRC_DIRS - all tests source files inside these directories 
# will be compile and generate object file with the name <filename>.o
#
# PROJECT_TESTS_HEADERS_DIRS - these directories will be add in header files 
# serach path while compiling tests source code.
#
# PROJECT_TESTS_EXEC_SRC_FILES - these files has the main method and will 
# generate executable files.
#
# PROJECT_TESTS_EXTRA_FILES_DIRS - all files inside these directories will
# be used while running testcases.
#############################################################################
PROJECT_TESTS_SRC_DIRS = tests/src
PROJECT_TESTS_HEADERS_DIRS =
PROJECT_TESTS_EXEC_SRC_FILES = tests/main_test.cpp
PROJECT_TESTS_EXTRA_FILES_DIRS = tests/config

#############################################################################
# Project build directories structure. 
# Relative path to - $abs_build_dir (top directory of project build)/build.
#############################################################################
PROJECT_BUILD_OBJS_DIR = objs
PROJECT_BUILD_LIBS_DIR = libs
PROJECT_BUILD_BIN_DIR = bin

#############################################################################
# Project tests build directories structure. 
# Relative path to - $abs_build_dir (top directory of project build)/build.
#############################################################################
PROJECT_TESTS_BUILD_OBJS_DIR = tests/objs
PROJECT_TESTS_BUILD_LIBS_DIR = tests/libs
PROJECT_TESTS_BUILD_BIN_DIR = tests/bin
PROJECT_TESTS_BUILD_EXTRA_FILES_DIR = tests/config

#############################################################################
# Project install directories structure.
# Relative path to - $abs_install_dir (top directory of project install).
#############################################################################
PROJECT_INSTALL_BIN_DIR = bin
PROJECT_INSTALL_LIBS_DIR = lib
PROJECT_INSTALL_API_HEADERS_DIR = . 
PROJECT_INSTALL_EXTRA_FILES_DIR = share/$(PROJECT_NAME)

#############################################################################
# Project compilation flags. These flags have some default entries if you need
# to customize more, make sure you update entries here.
# Default entries are -
# CPPFLAGS - -fPIC -Wall -Wextra
# CXXFLAGS - -std=c++11
# LIBS - 
# INCLUDE_FLAGS - all project headers top directories entries
# LDFLAGS -
#############################################################################
EXTRA_INCLUDE_FLAGS := -I/home/gagoel/gagoel_ggpw/tools/include
EXTRA_CPPFLAGS := 
EXTRA_CXXFLAGS := 
EXTRA_LDFLAGS := -L/home/gagoel/gagoel_ggpw/tools/lib
EXTRA_LIBS := -lcurl -lcpplogger -ldl
EXTRA_TESTS_LIBS := /home/gagoel/gagoel_ggpw/tools/lib/gtest.a
EXTRA_LD_LIBRARY_PATH := /home/gagoel/gagoel_ggpw/tools/lib