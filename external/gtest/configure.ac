dnl
dnl Autoconf requirements
dnl AC_INIT(package, version, bug-reoprt-address)
dnl information on the package
dnl checks for programs
dnl checks for libraries
dnl checks for header files
dnl checks for types
dnl checks for structures
dnl checks for compiler characteristics
dnl checks for library functions
dnl checks for system services
dnl AC_CONFIG_FILES([file...])
dnl AC_OUTPUT

dnl
dnl Autoconf configuration for gtest
dnl


AC_PREREQ(2.50)
AC_INIT([gtest], [1.0], [gauravgoel9nov@gmail.com])

abs_current_dir=`pwd`
abs_project_dir=`(cd $srcdir && pwd)`
abs_build_dir=$abs_current_dir/build

AC_PREFIX_DEFAULT(/usr/local/gtest)
if test "x$prefix" = "xNONE" ; then
    prefix=/usr/local/gtest
fi
abs_install_dir=$prefix

AC_SUBST(abs_current_dir)
AC_SUBST(abs_project_dir)
AC_SUBST(abs_build_dir)
AC_SUBST(abs_install_dir)

dnl Substituting the required variables before any checking.
dnl TODO - not working setting builddir, need to check
dnl builddir = $(srcdir)/build
dnl AC_SUBST([builddir])
CXXFLAGS="$CXXFLAGS -O2 -Wall"
AC_SUBST(CXXFLAGS)

dnl Checking for required programs.
AC_PROG_RANLIB
AC_PROG_CXX
AC_LANG(C++)

dnl Checking for required libraries.
AC_CHECK_LIB(m, cos)

dnl Checking for required header files.
AC_CHECK_HEADERS(iostream)

dnl Checking for types.

dnl Checking for strucutres.


dnl Setting configuration files.
AC_CONFIG_FILES([
    Makefile
])

AC_OUTPUT
