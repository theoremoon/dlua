module dlua.luaconf;
import dlua;


/*
** $Id: luaconf.h,v 1.259.1.1 2017/04/19 17:29:57 roberto Exp $
** Configuration file for Lua
** See Copyright Notice in lua.h
*/

import core.stdc.limits;
import core.stdc.stdint;
import core.stdc.stdlib;
import core.stdc.stdio;
import core.stdc.locale;

extern (C):

/*
** ===================================================================
** Search for "@@" to find all configurable definitions.
** ===================================================================
*/

/*
** {====================================================================
** System Configuration: macros to adapt (if needed) Lua to some
** particular platform, for instance compiling it with 32-bit numbers or
** restricting it to C89.
** =====================================================================
*/

/*
@@ LUA_32BITS enables Lua with 32-bit integers and 32-bit floats. You
** can also define LUA_32BITS in the make file, but changing here you
** ensure that all software connected to Lua will be compiled with the
** same configuration.
*/
/* #define LUA_32BITS */

/*
@@ LUA_USE_C89 controls the use of non-ISO-C89 features.
** Define it if you want Lua to avoid the use of a few C99 features
** or Windows-specific features on Windows.
*/
/* #define LUA_USE_C89 */

/*
** By default, Lua on Windows use (some) specific Windows features
*/

/* enable goodies for regular Windows */

/* enable support for DLL */
/* broadly, Windows is C89 */

/* needs an extra library: -ldl */
/* needs some extra libraries */

/* MacOS does not need -ldl */
/* needs an extra library: -lreadline */

/*
@@ LUA_C89_NUMBERS ensures that Lua uses the largest types available for
** C89 ('long' and 'double'); Windows always has '__int64', so it does
** not need to use this case.
*/

/*
@@ LUAI_BITSINT defines the (minimum) number of bits in an 'int'.
*/
/* avoid undefined shifts */
enum LUAI_BITSINT = 32;

/* 'int' always must have at least 16 bits */

/*
@@ LUA_INT_TYPE defines the type for Lua integers.
@@ LUA_FLOAT_TYPE defines the type for Lua floats.
** Lua should work fine with any mix of these options (if supported
** by your C compiler). The usual configurations are 64-bit integers
** and 'double' (the default), 32-bit integers and 'float' (for
** restricted platforms), and 'long'/'double' (for C compilers not
** compliant with C99, which may not have support for 'long long').
*/

/* predefined options for LUA_INT_TYPE */
enum LUA_INT_INT = 1;
enum LUA_INT_LONG = 2;
enum LUA_INT_LONGLONG = 3;

/* predefined options for LUA_FLOAT_TYPE */
enum LUA_FLOAT_FLOAT = 1;
enum LUA_FLOAT_DOUBLE = 2;
enum LUA_FLOAT_LONGDOUBLE = 3;

/* { */
/*
** 32-bit integers and 'float'
*/
/* use 'int' if big enough */

/* otherwise use 'long' */

/* }{ */
/*
** largest types available for C89 ('long' and 'double')
*/

/* } */

/*
** default configuration for 64-bit Lua ('long long' and 'double')
*/

enum LUA_INT_TYPE = LUA_INT_LONGLONG;

enum LUA_FLOAT_TYPE = LUA_FLOAT_DOUBLE;

/* }================================================================== */

/*
** {==================================================================
** Configuration for Paths.
** ===================================================================
*/

/*
** LUA_PATH_SEP is the character that separates templates in a path.
** LUA_PATH_MARK is the string that marks the substitution points in a
** template.
** LUA_EXEC_DIR in a Windows path is replaced by the executable's
** directory.
*/
enum LUA_PATH_SEP = ";";
enum LUA_PATH_MARK = "?";
enum LUA_EXEC_DIR = "!";

/*
@@ LUA_PATH_DEFAULT is the default path that Lua uses to look for
** Lua libraries.
@@ LUA_CPATH_DEFAULT is the default path that Lua uses to look for
** C libraries.
** CHANGE them if your machine has a non-conventional directory
** hierarchy or if you want to install your libraries in
** non-conventional directories.
*/
/* { */
/*
** In Windows, any exclamation mark ('!') in the path is replaced by the
** path of the directory of the executable file of the current process.
*/

/* }{ */

enum LUA_ROOT = "/usr/";
/* } */

/*
@@ LUA_DIRSEP is the directory separator (for submodules).
** CHANGE it if your machine does not use "/" as the directory separator
** and is not Windows. (On Windows Lua automatically uses "\".)
*/

enum LUA_DIRSEP = "/";

/* }================================================================== */

/*
** {==================================================================
** Marks for exported symbols in the C code
** ===================================================================
*/

/*
@@ LUA_API is a mark for all core API functions.
@@ LUALIB_API is a mark for all auxiliary library functions.
@@ LUAMOD_API is a mark for all standard library opening functions.
** CHANGE them if you need to define those functions in some special way.
** For instance, if you want to create one Windows DLL with the core and
** the libraries, you may want to use the following definition (define
** LUA_BUILD_AS_DLL to get it).
*/
/* { */

/* { */

/* }{ */

/* } */

/* }{ */

/* } */

/* more often than not the libs go together with the core */
// enum LUALIB_API = LUA_API;
// enum LUAMOD_API = LUALIB_API;

/*
@@ LUAI_FUNC is a mark for all extern functions that are not to be
** exported to outside modules.
@@ LUAI_DDEF and LUAI_DDEC are marks for all extern (const) variables
** that are not to be exported to outside modules (LUAI_DDEF for
** definitions and LUAI_DDEC for declarations).
** CHANGE them if you need to mark them in some special way. Elf/gcc
** (versions 3.2 and later) mark them as "hidden" to optimize access
** when Lua is compiled as a shared library. Not all elf targets support
** this attribute. Unfortunately, gcc does not offer a way to check
** whether the target offers that support, and those without support
** give a warning about it. To avoid these warnings, change to the
** default definition.
*/ /* { */
/* }{ */

/* } */

// enum LUAI_DDEC = LUAI_FUNC; /* empty */

/* }================================================================== */

/*
** {==================================================================
** Compatibility with previous versions
** ===================================================================
*/

/*
@@ LUA_COMPAT_5_2 controls other macros for compatibility with Lua 5.2.
@@ LUA_COMPAT_5_1 controls other macros for compatibility with Lua 5.1.
** You can define it to get all options, or change specific options
** to fit your specific needs.
*/
/* { */

/*
@@ LUA_COMPAT_MATHLIB controls the presence of several deprecated
** functions in the mathematical library.
*/

/*
@@ LUA_COMPAT_BITLIB controls the presence of library 'bit32'.
*/

/*
@@ LUA_COMPAT_IPAIRS controls the effectiveness of the __ipairs metamethod.
*/

/*
@@ LUA_COMPAT_APIINTCASTS controls the presence of macros for
** manipulating other integer types (lua_pushunsigned, lua_tounsigned,
** luaL_checkint, luaL_checklong, etc.)
*/

/* } */

/* { */

/* Incompatibilities from 5.2 -> 5.3 */

/*
@@ LUA_COMPAT_UNPACK controls the presence of global 'unpack'.
** You can replace it with 'table.unpack'.
*/

/*
@@ LUA_COMPAT_LOADERS controls the presence of table 'package.loaders'.
** You can replace it with 'package.searchers'.
*/

/*
@@ macro 'lua_cpcall' emulates deprecated function lua_cpcall.
** You can call your C function directly (with light C functions).
*/

/*
@@ LUA_COMPAT_LOG10 defines the function 'log10' in the math library.
** You can rewrite 'log10(x)' as 'log(x, 10)'.
*/

/*
@@ LUA_COMPAT_LOADSTRING defines the function 'loadstring' in the base
** library. You can rewrite 'loadstring(s)' as 'load(s)'.
*/

/*
@@ LUA_COMPAT_MAXN defines the function 'maxn' in the table library.
*/

/*
@@ The following macros supply trivial compatibility for some
** changes in the API. The macros themselves document how to
** change your code to avoid using them.
*/

/*
@@ LUA_COMPAT_MODULE controls compatibility with previous
** module functions 'module' (Lua) and 'luaL_register' (C).
*/

/* } */

/*
@@ LUA_COMPAT_FLOATSTRING makes Lua format integral floats without a
@@ a float mark ('.0').
** This macro is not on by default even in compatibility mode,
** because this is not really an incompatibility.
*/
/* #define LUA_COMPAT_FLOATSTRING */

/* }================================================================== */

/*
** {==================================================================
** Configuration for Numbers.
** Change these definitions if no predefined LUA_FLOAT_* / LUA_INT_*
** satisfy your needs.
** ===================================================================
*/

/*
@@ LUA_NUMBER is the floating-point type used by Lua.
@@ LUAI_UACNUMBER is the result of a 'default argument promotion'
@@ over a floating number.
@@ l_mathlim(x) corrects limit name 'x' to the proper float type
** by prefixing it with one of FLT/DBL/LDBL.
@@ LUA_NUMBER_FRMLEN is the length modifier for writing floats.
@@ LUA_NUMBER_FMT is the format for writing floats.
@@ lua_number2str converts a float to a string.
@@ l_mathop allows the addition of an 'l' or 'f' to all math operations.
@@ l_floor takes the floor of a float.
@@ lua_str2number converts a decimal numeric string to a number.
*/

/* The following definitions are good for most cases here */

extern (D) auto l_floor(T)(auto ref T x)
{
    return l_mathop(floor)(x);
}

extern (D) auto lua_number2str(T0, T1, T2)(auto ref T0 s, auto ref T1 sz, auto ref T2 n)
{
    return l_sprintf(s, sz, LUA_NUMBER_FMT, double());
}

/*
@@ lua_numbertointeger converts a float number to an integer, or
** returns 0 if float is not within the range of a lua_Integer.
** (The range comparisons are tricky because of rounding. The tests
** here assume a two-complement representation, where MININTEGER always
** has an exact representation as a float; MAXINTEGER may not have one,
** and therefore its conversion to float may have an ill-defined value.)
*/

/* now the variable definitions */ /* { single float */ /* }{ long double */ /* }{ double */

enum LUA_NUMBER;// = double;

extern (D) string l_mathlim(T)(auto ref T n)
{
    import std.conv : to;

    return "DBL_" ~ to!string(n);
}

enum LUAI_UACNUMBER;// = double;

enum LUA_NUMBER_FRMLEN = "";
enum LUA_NUMBER_FMT = "%.14g";

extern (D) auto l_mathop(T)(auto ref T op)
{
    return op;
}

alias lua_str2number = strtod;

/* }{ */

/* } */

/*
@@ LUA_INTEGER is the integer type used by Lua.
**
@@ LUA_UNSIGNED is the unsigned version of LUA_INTEGER.
**
@@ LUAI_UACINT is the result of a 'default argument promotion'
@@ over a lUA_INTEGER.
@@ LUA_INTEGER_FRMLEN is the length modifier for reading/writing integers.
@@ LUA_INTEGER_FMT is the format for writing integers.
@@ LUA_MAXINTEGER is the maximum value for a LUA_INTEGER.
@@ LUA_MININTEGER is the minimum value for a LUA_INTEGER.
@@ lua_integer2str converts an integer to a string.
*/

/* The following definitions are good for most cases here */

enum LUAI_UACINT;// = LUA_INTEGER;

extern (D) auto lua_integer2str(T0, T1, T2)(auto ref T0 s, auto ref T1 sz, auto ref T2 n)
{
    return l_sprintf(s, sz, LUA_INTEGER_FMT, long());
}

/*
** use LUAI_UACINT here to avoid problems with promotions (which
** can turn a comparison between unsigneds into a signed comparison)
*/

/* now the variable definitions */ /* { int */ /* }{ long */ /* }{ long long */

/* use presence of macro LLONG_MAX as proxy for C99 compliance */ /* { */
/* use ISO C99 stuff */

enum LUA_INTEGER; //= long;
enum LUA_INTEGER_FRMLEN = "ll";

enum LUA_MAXINTEGER = LLONG_MAX;
enum LUA_MININTEGER = LLONG_MIN;

/* }{ */
/* in Windows, can use specific Windows types */

/* }{ */

/* } */

/* }{ */

/* } */

/* }================================================================== */

/*
** {==================================================================
** Dependencies with C99 and other C details
** ===================================================================
*/

/*
@@ l_sprintf is equivalent to 'snprintf' or 'sprintf' in C89.
** (All uses in Lua have only one format item.)
*/

alias l_sprintf = snprintf;

/*
@@ lua_strx2number converts an hexadecimal numeric string to a number.
** In C99, 'strtod' does that conversion. Otherwise, you can
** leave 'lua_strx2number' undefined and Lua will provide its own
** implementation.
*/

alias lua_strx2number = lua_str2number;

/*
@@ lua_pointer2str converts a pointer to a readable string in a
** non-specified way.
*/
extern (D) auto lua_pointer2str(T0, T1, T2)(auto ref T0 buff, auto ref T1 sz, auto ref T2 p)
{
    return l_sprintf(buff, sz, "%p", p);
}

/*
@@ lua_number2strx converts a float to an hexadecimal numeric string.
** In C99, 'sprintf' (with format specifiers '%a'/'%A') does that.
** Otherwise, you can leave 'lua_number2strx' undefined and Lua will
** provide its own implementation.
*/

/*
** 'strtof' and 'opf' variants for math functions are not valid in
** C89. Otherwise, the macro 'HUGE_VALF' is a good proxy for testing the
** availability of these variants. ('math.h' is already included in
** all files that use these macros.)
*/

/* variants not available */

/* no variant */

/*
@@ LUA_KCONTEXT is the type of the context ('ctx') for continuation
** functions.  It must be a numerical type; Lua will use 'intptr_t' if
** available, otherwise it will use 'ptrdiff_t' (the nearest thing to
** 'intptr_t' in C89)
*/
alias LUA_KCONTEXT = intptr_t; /* even in C99 this type is optional */

// enum LUA_KCONTEXT = intptr_t;

/*
@@ lua_getlocaledecpoint gets the locale "radix character" (decimal point).
** Change that if you do not want to use C locales. (Code using this
** macro must include header 'locale.h'.)
*/

extern (D) auto lua_getlocaledecpoint()
{
    return localeconv().decimal_point[0];
}

/* }================================================================== */

/*
** {==================================================================
** Language Variations
** =====================================================================
*/

/*
@@ LUA_NOCVTN2S/LUA_NOCVTS2N control how Lua performs some
** coercions. Define LUA_NOCVTN2S to turn off automatic coercion from
** numbers to strings. Define LUA_NOCVTS2N to turn off automatic
** coercion from strings to numbers.
*/
/* #define LUA_NOCVTN2S */
/* #define LUA_NOCVTS2N */

/*
@@ LUA_USE_APICHECK turns on several consistency checks on the C API.
** Define it as a help when debugging C code.
*/

/* }================================================================== */

/*
** {==================================================================
** Macros that affect the API and must be stable (that is, must be the
** same when you compile Lua and when you compile code that links to
** Lua). You probably do not want/need to change them.
** =====================================================================
*/

/*
@@ LUAI_MAXSTACK limits the size of the Lua stack.
** CHANGE it if you need a different limit. This limit is arbitrary;
** its only purpose is to stop Lua from consuming unlimited stack
** space (and to reserve some numbers for pseudo-indices).
*/
enum LUAI_MAXSTACK = 1000000;

/*
@@ LUA_EXTRASPACE defines the size of a raw memory area associated with
** a Lua state with very fast access.
** CHANGE it if you need a different size.
*/
enum LUA_EXTRASPACE = ptrdiff_t.sizeof;

/*
@@ LUA_IDSIZE gives the maximum size for the description of the source
@@ of a function in debug information.
** CHANGE it if you want a different size.
*/
enum LUA_IDSIZE = 60;

/*
@@ LUAL_BUFFERSIZE is the buffer size used by the lauxlib buffer system.
** CHANGE it if it uses too much C-stack space. (For long double,
** 'string.format("%.99f", -1e4932)' needs 5034 bytes, so a
** smaller buffer would force a memory allocation for each call to
** 'string.format'.)
*/

enum LUAL_BUFFERSIZE = cast(int) 0x80 * ptrdiff_t.sizeof * lua_Integer.sizeof;

/* }================================================================== */

/*
@@ LUA_QL describes how error messages quote program elements.
** Lua does not use these macros anymore; they are here for
** compatibility only.
*/
// enum LUA_QS = LUA_QL("%s");

/* =================================================================== */

/*
** Local configuration. You can use this space to add your redefinitions
** without modifying the main part of the file.
*/

