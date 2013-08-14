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
dnl This file is used to set variables which are used in configuration and
dnl building the project. If you want to use new variable or update the value
dnl of current variable make sure you update entries here.
dnl ==========================================================================

dnl Global Project name string.
PROJECT_NAME='[projectname]'

dnl Global Project name string in caps.
PROJECT_NAME_CAPS='[PROJECTNAME]'

dnl Current directory
abs_current_dir=`pwd`

dnl Project sources top directory. This is the reference directory for all 
dnl file searches while building, installing and packaging.
abs_project_dir=`(cd $srcdir && pwd)`

dnl External Projects top directory.
abs_external_project_dir=$abs_project_dir/external

dnl Project build top directory. This is the reference directory for all build
dnl directories.
abs_build_dir=$abs_current_dir/build

dnl External Projects build top directory.
abs_external_build_dir=$abs_build_dir/external

dnl ==========================================================================
dnl Project install top directory. This is the reference directory for all 
dnl installation.
dnl ==========================================================================
AC_PREFIX_DEFAULT(/usr/local/$PROJECT_NAME)
if test "x$prefix" = "xNONE" ; then
    prefix="/usr/local/"$PROJECT_NAME
fi
abs_install_dir=$prefix

dnl Global Project version number.
dnl major.minor.bug-fixes.port<release type>
dnl major - new feature may be not compatible with older version
dnl minor - new feature, bug fixes, fully compatible with older version
dnl bug-fixes - only bug fixes.
dnl port - platform type 0 - linux64
dnl release-type - a - alpha, b - beta, g - gama
PROJECT_VERSION='1.0.0.0b'

dnl Project root directory identification file. This file identify that we
dnl are running configuration in the right directory.
PROJECT_IDFILE='ABOUT_[PROJECTNAME]'

dnl Project license string.
PROJECT_LICENSE='TODO - Add project license.'

dnl Project distributable file name.
PROJECT_PACKAGE_NAME="$PROJECT_NAME"-"$PROJECT_VERSION"

dnl Project configuration header file which has definition of all the variables
dnl and can be included in project and used.
PROJECT_CONFIG_HEADERS="$abs_project_dir/include/config_options.h"

dnl Project configuration file, If file name is XYZ here you should have XYZ.in
dnl in your source directory. autoconf parse XYZ.in file, replace all variable
dnl of type @VARIABLE@ and generate XYZ file.
PROJECT_CONFIG_FILES='Makefile'

dnl Command line settings for optional features.
AC_ARG_ENABLE([cpplogger-vvlogging], [AS_HELP_STRING(
[--enable-cpplogger-vvlogging], \
[enable cpplogger very verbose logging. logs info and debug messages also.])],\
[AS_VAR_APPEND([CXXFLAGS],[" -DCPPLOGGER_VVLOGGING"])], [])

dnl Command line settings for optional packages.
AC_ARG_WITH([input-value], [AS_HELP_STRING([--with-optional-package], \
[with or without optional package setting.])], \
[AS_VAR_SET([your_variable_name], [$with_input_value])], \
[AS_VAR_SET([your_variable_name], [no])])

dnl ==========================================================================
dnl Defining variables so we can use them in other configuration files.
dnl All variables name should be here.
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
AC_DEFINE_UNQUOTED(PROJECT_CONFIG_FILES,"$PROJECT_CONFIG_FILES",
    [project configuration files list.])

dnl ==========================================================================
dnl Substituting variables so we can use them in makefile.
dnl ==========================================================================

dnl project configuration related variables.
AC_SUBST(abs_curr_dir)
AC_SUBST(abs_project_dir)
AC_SUBST(abs_external_project_dir)
AC_SUBST(abs_build_dir)
AC_SUBST(abs_external_build_dir)
AC_SUBST(abs_install_dir)
AC_SUBST(PROJECT_NAME)
AC_SUBST(PROJECT_VERSION)
AC_SUBST(PROJECT_LICENSE)
AC_SUBST(PROJECT_PACKAGE_NAME)

dnl compilation flags - configure command line option.
AC_SUBST(CFLAGS)
AC_SUBST(CPPFLAGS)
AC_SUBST(CXXFLAGS)
AC_SUBST(LDFLAGS)
AC_SUBST(LIBS)

dnl installation directories - configure command line option.
AC_SUBST(bindir)
AC_SUBST(datadir)
AC_SUBST(datarootdir)
AC_SUBST(exec_prefix)
AC_SUBST(htmldir)
AC_SUBST(includedir)
AC_SUBST(infodir)
AC_SUBST(libdir)
AC_SUBST(libexecdir)
AC_SUBST(localedir)
AC_SUBST(localstatedir)
AC_SUBST(mandir)
AC_SUBST(pdfdir)
AC_SUBST(prefix)
AC_SUBST(sbindir)
AC_SUBST(sharedstatedir)
AC_SUBST(sysconfdir)
