dnl
dnl ==========================================================================
dnl @copyright
dnl
dnl @todo - Add the license.
dnl  
dnl @file                             acinclude.m4
dnl @author                           gauravgoel9nov@gmail.com
dnl @date {File Creation Timestamp}   Sat May 16 20:00:39 2013
dnl
dnl ==========================================================================


dnl ==========================================================================
dnl Checks Programs and version functions.
dnl ==========================================================================
AC_DEFUN([CHECK_CXX_VERSION], [
    
    AC_MSG_NOTICE([Checking g++ version $1])
    your_gcc_version=`g++ -dumpversion`
    
    test_result=`gawk -v var="$your_gcc_version" \
    'BEGIN { if(var>="$1") {print "1"} else {print "0"}}'`

    if test $test_result = 0; then
        AC_MSG_ERROR([g++ version should be $1 or above. \
            Your version is $your_gcc_version])
    fi
])

dnl ==========================================================================
dnl APACHE_GEN_CONFIG_VARS
dnl Creates config_vars.mk
dnl ==========================================================================
AC_DEFUN([GEN_CONFIG_VARS],[
  AC_MSG_NOTICE([Generating configuration variables...])

  dnl compilation flags
  AC_SUBST(CFLAGS)
  AC_SUBST(CPPFLAGS)
  AC_SUBST(CXXFLAGS)
  AC_SUBST(LDFLAGS)
  AC_SUBST(LIBS)

  dnl installation directories.
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

  dnl programs variables
  AC_SUBST(GREP)
  AC_SUBST(EGREP)
  AC_SUBST(FGREP)
  AC_SUBST(AWK)
  AC_SUBST(CC)
  AC_SUBST(CPP)
  AC_SUBST(CXX)
  AC_SUBST(INSTALL)
  AC_SUBST(MKDIR_P)
  AC_SUBST(LEX)
  AC_SUBST(LN_S)
  AC_SUBST(SED)
  AC_SUBST(YACC)
  AC_SUBST(RM)
  AC_SUBST(RANLIB)
])


dnl ==========================================================================
dnl Checks struct functionality functions. 
dnl ==========================================================================
AC_DEFUN([CHECK_STRUCT_TM],
    [AC_CACHE_CHECK(
        [for tm_gmtoff in struct tm], 
        ac_cv_struct_tm_gmtoff,
        [AC_TRY_COMPILE(
            [#include <sys/types.h> #include <time.h>], 
            [struct tm tm; tm.tm_gmtoff;],
            ac_cv_struct_tm_gmtoff=yes, 
            ac_cv_struct_tm_gmtoff=no)
        ]
    )    
    if test "$ac_cv_struct_tm_gmtoff" = "yes"; then
        AC_DEFINE(HAVE_GMTOFF, 1, [Define if struct tm has a tm_gmtoff field])
    fi
    ]
)

AC_DEFUN([CHECK_VOID_PTR_LEN], [
    AC_CACHE_CHECK(
        [for void pointer length], 
        [ap_cv_void_ptr_lt_long],
        [AC_TRY_RUN([
            int main(void)
            {
              return sizeof(void *) < sizeof(long); 
            }], 
            [ap_cv_void_ptr_lt_long=no], 
            [ap_cv_void_ptr_lt_long=yes], 
            [ap_cv_void_ptr_lt_long=yes])
        ]
    )
    if test "$ap_cv_void_ptr_lt_long" = "yes"; then
        AC_MSG_ERROR([Size of "void *" is less than size of "long"])
    fi
])

dnl ==========================================================================
dnl Checks function availability functions.
dnl ==========================================================================
AC_DEFUN([CHECK_FUNC_GETTID],[
    AC_CACHE_CHECK(
        [for gettid()], 
            ac_cv_gettid,
        [AC_TRY_RUN(
            #define _GNU_SOURCE
            #include <unistd.h>
            #include <sys/syscall.h>
            #include <sys/types.h>
            int main(int argc, char **argv) {
            pid_t t = syscall(SYS_gettid); return t == -1 ? 1 : 0; },
            [ac_cv_gettid=yes], 
            [ac_cv_gettid=no], 
            [ac_cv_gettid=no])
        ]
    )
    if test "$ac_cv_gettid" = "yes"; then
        AC_DEFINE(HAVE_GETTID, 1, [Define if you have gettid()])
    fi
])
