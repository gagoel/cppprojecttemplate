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
dnl This file contains the autoconf helping function which can be used in
dnl configure.ac file.
dnl ==========================================================================

dnl Checks g++ version.
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

dnl Checks tm struct functionality. 
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

dnl Checks void pointer length.
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

dnl Checks gettid function availability.
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
