dnl
dnl ==========================================================================
dnl @copyright
dnl
dnl @todo - Add the license.
dnl  
dnl @file                             config.properties
dnl @author                           gauravgoel9nov@gmail.com
dnl @date {File Creation Timestamp}   Sat May 16 20:00:39 2013
dnl
dnl ==========================================================================

dnl ==========================================================================
dnl Absolute source/build directory
dnl ==========================================================================
abs_srcdir=`(cd $srcdir && pwd)`
abs_builddir=`pwd`

dnl ==========================================================================
dnl Configuration variables. If you need to make change to your auto 
dnl configuration this is the file where you should look at.
dnl ==========================================================================
PROJECT_NAME='classloader'
PROJECT_NAME_CAPS='CLASSLOADER'
PROJECT_VERSION='1.0.0.0b'
PROJECT_IDFILE='ABOUT_CLASSLOADER'
PROJECT_LICENSE='TODO - Add project license.'
PROJECT_PACKAGE_NAME="$PROJECT_NAME"-"$PROJECT_VERSION"

PROJECT_CONFIG_HEADERS="$abs_srcdir/include/cpputils/classloader/config_options.h"
PROJECT_CONFIG_AUX_DIR='scripts'
PROJECT_CONFIG_FILES='Makefile'

PROJECT_BUILD_DIR="$abs_builddir/build"

PROJECT_TESTS_BUILD_DIR="$PROJECT_BUILD_DIR/tests"

PROJECT_LOGGING_CONFIG_FILE="$PROJECT_NAME"_"logging.conf"
PROJECT_LOGGING_LOGS_FILE="$PROJECT_NAME"_"logging.log"

PROJECT_INSTALL_ROOT_DIR="$prefix"

dnl ==========================================================================
dnl Defining variables so we can use them in other configuration files.
dnl ==========================================================================
AC_DEFINE_UNQUOTED(abs_srcdir, "$abs_srcdir", 
    [absolute source directory root path.])
AC_DEFINE_UNQUOTED(abs_builddir, "$abs_builddir", 
    [absolute build directory root path.])
AC_DEFINE_UNQUOTED(PROJECT_NAME, "$PROJECT_NAME", 
    [project name.])
AC_DEFINE_UNQUOTED(PROJECT_NAME_CAPS, "$PROJECT_NAME_CAPS", 
    [project name in capital.])
AC_DEFINE_UNQUOTED(PROJECT_VERSION,"$PROJECT_VERSION", 
    [project version.])
AC_DEFINE_UNQUOTED(PROJECT_IDFILE, "$PROJECT_IDFILE", 
    [project directory identification file])
AC_DEFINE_UNQUOTED(PROJECT_LICENSE, "$PROJECT_LICENSE", 
    [project license])
AC_DEFINE_UNQUOTED(PROJECT_PACKAGE_NAME,"$PROJECT_PACKAGE_NAME",
    [project package name.])
AC_DEFINE_UNQUOTED(PROJECT_CONFIG_HEADERS, "$PROJECT_CONFIG_HEADERS",
    [project configuration headers.])
AC_DEFINE_UNQUOTED(PROJECT_CONFIG_AUX_DIR,"$PROJECT_CONFIG_AUX_DIR",
    [project configuration auxiliary directory.])
AC_DEFINE_UNQUOTED(PROJECT_CONFIG_FILES,"$PROJECT_CONFIG_FILES",
    [project configuration files list.])
AC_DEFINE_UNQUOTED(PROJECT_BUILD_DIR, "$PROJECT_BUILD_DIR", 
    [project build directory.])
AC_DEFINE_UNQUOTED(PROJECT_TESTS_BUILD_DIR,"$PROJECT_TESTS_BUILD_DIR",
    [project tests build directory.])
AC_DEFINE_UNQUOTED(PROJECT_LOGGING_CONFIG_FILE,"$PROJECT_LOGGING_CONFIG_FILE",
    [project logging configuration file.])
AC_DEFINE_UNQUOTED(PROJECT_LOGGING_LOGS_FILE,"$PROJECT_LOGGING_LOGS_FILE",
    [project logging logs file.])
AC_DEFINE_UNQUOTED(PROJECT_INSTALL_ROOT_DIR,"$PROJECT_INSTALL_ROOT_DIR",
    [project installation root directory.])
dnl ==========================================================================
dnl Substituting variables so we can use them in makefile.
dnl ==========================================================================
AC_SUBST(abs_srcdir)
AC_SUBST(abs_builddir)
AC_SUBST(PROJECT_NAME)
AC_SUBST(PROJECT_VERSION)
AC_SUBST(PROJECT_LICENSE)
AC_SUBST(PROJECT_LOGGING_CONFIG_FILE)
AC_SUBST(PROJECT_LOGGING_LOGS_FILE)
