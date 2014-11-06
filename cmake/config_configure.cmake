# Checking Headers and Functions for pixman
add_definitions(-DHAVE_CONFIG_H)

include( CheckIncludeFile )
include( CheckFunctionExists )
include( CheckLibraryExists )
include( CheckTypeSize)

if(PNG_FOUND)
    set(HAVE_LIBPNG 1)
endif()

if(CMAKE_USE_PTHREADS_INIT)
    set(HAVE_PTHREADS 1)
endif()

check_include_file( "dlfcn.h" HAVE_DLFCN_H )
check_include_file( "fenv.h" HAVE_FENV_H )
check_include_file( "inttypes.h" HAVE_INTTYPES_H )
check_include_file( "memory.h" HAVE_MEMORY_H )
check_include_file( "stdint.h" HAVE_STDINT_H )
check_include_file( "stdlib.h" HAVE_STDLIB_H )
check_include_file( "strings.h" HAVE_STRINGS_H )
check_include_file( "string.h" HAVE_STRING_H )
check_include_file( "sys/mman.h" HAVE_SYS_MMAN_H )
check_include_file( "sys/stat.h" HAVE_SYS_STAT_H )
check_include_file( "sys/types.h" HAVE_SYS_TYPES_H )
check_include_file( "unistd.h" HAVE_UNISTD_H )

check_function_exists( __builtin_clz HAVE_BUILTIN_CLZ )
check_function_exists( alarm HAVE_ALARM )
check_function_exists( feenableexcept HAVE_FEENABLEEXCEPT )
check_function_exists( getisax HAVE_GETISAX )
check_function_exists( getpagesize HAVE_GETPAGESIZE )
check_function_exists( gettimeofday HAVE_GETTIMEOFDAY )
check_function_exists( mmap HAVE_MMAP )
check_function_exists( mprotect HAVE_MPROTECT )
check_function_exists( posix_memalign HAVE_POSIX_MEMALIGN )
check_function_exists( sigaction HAVE_SIGACTION )

CHECK_TYPE_SIZE("long"       SIZEOF_LONG)
CHECK_TYPE_SIZE("__float128" SIZEOF___FLOAT128)
if(SIZEOF___FLOAT128)
    set(HAVE_FLOAT128 1)
endif()

if (ARM_IWMMXT)
    set(USE_ARM_IWMMXT 1)
endif (ARM_IWMMXT)
if (ARM_NEON)
    set(USE_ARM_NEON 1)
endif (ARM_NEON)
if (ARM_SIMD)
    set(USE_ARM_SIMD 1)
endif (ARM_SIMD)

if (PPC_VMX)
    set(USE_VMX 1)
endif (PPC_VMX)

if (MIPS_LOONGSON_MMI)
    set(USE_LOONGSON_MMI 1)
endif (MIPS_LOONGSON_MMI)
if (MIPS_DSPR2)
    set(USE_MIPS_DSPR2 1)
endif (MIPS_DSPR2)

if (X86_MMX)
    set(USE_X86_MMX 1)
    if(CMAKE_COMPILER_IS_GNUCC)
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mmmx")
    endif(CMAKE_COMPILER_IS_GNUCC)
endif (X86_MMX)
if (X86_SSE2)
    set(USE_SSE2 1)
    if(CMAKE_COMPILER_IS_GNUCC)
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse2")
    endif(CMAKE_COMPILER_IS_GNUCC)
endif (X86_SSE2)
if (X86_SSSE3)
    set(USE_SSSE3 1)
    if(CMAKE_COMPILER_IS_GNUCC)
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse3 -mssse3")
    endif(CMAKE_COMPILER_IS_GNUCC)
endif(X86_SSSE3)

configure_file( ${CMAKE_CURRENT_SOURCE_DIR}/cmake/config_source.cmake ${CMAKE_CURRENT_BINARY_DIR}/pixman/config.h )
configure_file( ${CMAKE_CURRENT_SOURCE_DIR}/pixman/pixman-version.h.in ${CMAKE_CURRENT_BINARY_DIR}/pixman/pixman-version.h)