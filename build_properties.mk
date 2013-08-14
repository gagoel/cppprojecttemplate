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
#
# PROJECT_DIST_DIRS - directories which needs to be part of distributable.
# file searches are recursive in these directories.
#############################################################################
PROJECT_SRC_DIRS = src 
PROJECT_HEADERS_DIRS = include
PROJECT_EXEC_SRC_FILES =
PROJECT_API_HEADERS_DIRS = include
PROJECT_EXTRA_FILES_DIRS = config logs
PROJECT_DIST_DIRS = config examples include src tests logs external \
ABOUT_PROJECTNAME acinclude.m4 build_properties.mk config_properties.m4 \
configure configure.ac DEV-README INSTALL Makefile.in QUESTION_ANSWER README \
TODO

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
EXTRA_INCLUDE_FLAGS :=
EXTRA_CPPFLAGS := 
EXTRA_CXXFLAGS := 
EXTRA_LDFLAGS :=
EXTRA_LIBS := -lcurl -ldl
EXTRA_LD_LIBRARY_PATH :=

##############################################################################
# External tests packages configuration variables.
#
# EXTERNAL_TESTS_PACKAGES - test packages name, all build files for the package
# will go in $(abs_external_build_dir)/$PACKAGE_NAME
##############################################################################
# Packages for testing only.
EXTERNAL_TESTS_PACKAGES = gtest

GTEST_ROOT_DIR := $(abs_external_project_dir)/gtest
GTEST_BUILD_DIR := $(abs_external_build_dir)/gtest

EXTRA_TESTS_IFLAGS := -I$(GTEST_ROOT_DIR)/include -I$(GTEST_ROOT_DIR)/include/gtest
EXTRA_TESTS_LIBS := $(GTEST_BUILD_DIR)/build/libs/gtest.a

##############################################################################
# External packages configuration variables, project sub packages. 
# These packages libraries and executable will also installed.
#
# EXTERNAL_PACKAGES - packages name, all build files for the package
# will go in $(abs_external_build_dir)/$PACKAGE_NAME
##############################################################################
EXTERNAL_PACKAGES = cpplogger

CPPLOGGER_ROOT_DIR := $(abs_external_project_dir)/cpplogger
CPPLOGGER_BUILD_DIR := $(abs_external_build_dir)/cpplogger

CPPLOGGER_BUILD_LIBS_DIR := $(abs_external_build_dir)/cpplogger/build/libs/cpplogger
EXTRA_LIBS += -lcpplogger
EXTRA_LD_LIBRARY_PATH += $(CPPLOGGER_BUILD_LIBS_DIR)
EXTRA_LDFLAGS += -L$(CPPLOGGER_BUILD_LIBS_DIR)
EXTRA_INCLUDE_FLAGS += -I$(CPPLOGGER_ROOT_DIR)/include
