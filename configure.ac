dnl
dnl ==========================================================================
dnl @copyright
dnl
dnl @todo - Add the license.
dnl  
dnl @file                            configure.ac
dnl @author                          gauravgoel9nov@gmail.com
dnl @date {File Creation timestamp}  Sat Aug 10 20:00:39 2013
dnl
dnl ==========================================================================

AC_INIT(ABOUT_CLASSLOADER)

dnl ==========================================================================
dnl Including 'configuration properties' and macros files. These file should 
dnl be first as we are going to use them later on. 'configuration properties'
dnl file should be first as configuration parameters may be used by some other 
dnl include files.
dnl ==========================================================================
sinclude(config_properties.m4)
sinclude(acinclude.m4)

dnl ==========================================================================
dnl Checking for autoconf required version and initializing. ABOUT_$PROJECTNAME 
dnl is used to verfiy correct source directory. Source directory should have 
dnl ABOUT_$PROJECTNAME file to initialize autoconf.
dnl ==========================================================================
AC_PREREQ(2.50)
AC_COPYRIGHT([$PROJECT_LICENSE])
AC_REVISION([Version - $PROJECT_VERSION])

dnl ==========================================================================
dnl Setting configuration files, which will generate by configure
dnl after replacing configure variables. Configure filename should be
dnl input-file-name.in. It is here as we need to check configure input file
dnl existence.
dnl ========================================================================== 
AC_CONFIG_HEADERS($PROJECT_CONFIG_HEADERS)
AC_CONFIG_SRCDIR($PROJECT_IDFILE)
AC_CONFIG_FILES($PROJECT_CONFIG_FILES)


AC_MSG_NOTICE([])
AC_MSG_NOTICE([Configuring $PROJECT_NAME_CAPS...])
AC_MSG_NOTICE([])

dnl ==========================================================================
dnl Checking for required programs, files and tools
dnl ==========================================================================
AC_PROG_GREP
AC_PROG_EGREP
AC_PROG_FGREP
AC_PROG_AWK
AC_PROG_CC
AC_PROG_CPP
AC_PROG_CXX
CHECK_CXX_VERSION(4.8.0)
AC_PROG_LEX
AC_PROG_LN_S
AC_PROG_SED
AC_PROG_YACC
AC_PATH_PROG(RM, rm)
AC_CHECK_TOOL(RANLIB, ranlib, true)

AC_CHECK_FILE($abs_project_dir/README, 
    [AC_MSG_NOTICE([README file found.])],
    [AC_MSG_ERROR([README file not found.])]
)

dnl setting programs variables - used by make
AC_SUBST(GREP)
AC_SUBST(EGREP)
AC_SUBST(FGREP)
AC_SUBST(AWK)
AC_SUBST(CC)
AC_SUBST(CPP)
AC_SUBST(CXX)
AC_SUBST(LEX)
AC_SUBST(LN_S)
AC_SUBST(SED)
AC_SUBST(YACC)
AC_SUBST(RM)
AC_SUBST(RANLIB)

dnl ==========================================================================
dnl Checks for libraries, headers, and functions these checks set 
dnl symbols HAVE_XXXX_H, where XXXX is input header name
dnl ==========================================================================

dnl libraries check
AC_CHECK_LIB(
    pthread, 
    pthread_create,
    [LIBS="$LIBS -lpthread"],
    [AC_MSG_ERROR([pthread library not found. install it.])]
)

AC_CHECK_LIB(
    dl, 
    dlopen,
    [LIBS="$LIBS -ldl"],
    [AC_MSG_ERROR([dl library not found. install it.])]
)

dnl headers check
AC_HEADER_STDC
AC_CHECK_HEADERS( \
    cstring \
    climits \
    cunistd \
)

dnl functions check
AC_FUNC_MEMCMP
AC_FUNC_MKTIME
AC_FUNC_MMAP

AC_CHECK_FUNCS( \
    getpwnam \
    getgrnam \
)

CHECK_FUNC_GETTID

dnl ==========================================================================
dnl Checks for typedefs, structures and compiler characteristics
dnl ==========================================================================

dnl types checks.
AC_TYPE_SIZE_T
AC_TYPE_UINT16_T
AC_TYPE_UNSIGNED_LONG_LONG_INT

dnl Checks that a void pointer is large enough to store a long integer
CHECK_VOID_PTR_LEN

dnl structures checks.
dnl Check for the tm_gmtoff field in struct tm to get the timezone diffs
CHECK_STRUCT_TM
AC_STRUCT_TIMEZONE

dnl ==========================================================================
dnl It is end configuration macro, which is required.
dnl ==========================================================================
AC_OUTPUT
