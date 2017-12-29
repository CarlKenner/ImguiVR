# Find the Oculus SDK
# This module defines:
# OCULUS_SDK_FOUND, if false do not try to link against the Oculus SDK
# OCULUS_SDK_LIBRARY, the name of the Oculus SDK library to link against
# OCULUS_SDK_INCLUDE_DIR, the Oculus SDK include directory
#
# You can also specify the environment variable OCULUS_SDK or define it with
# -DOCULUS_SDK=... to hint at the module where to search for the Oculus SDK if it's
# installed in a non-standard location.

find_path(OCULUS_SDK_INCLUDE_DIR OVR_CAPI.h
	HINTS
	$ENV{OCULUS_SDK}
	${OCULUS_SDK}
	PATH_SUFFIXES LibOVR/Include/
	# TODO: I don't know where these would be on Linux/OS X machines
	# Does the Oculus SDK even run on those OS's?
	PATHS
	~/Library/Frameworks
	/Library/Frameworks
	/usr/local/include/
	/usr/include/
	/sw # Fink
	/opt/local # DarwinPorts
	/opt/csw # Blastwave
	/opt
)

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
	set(BITSIZE "x64")
else()
	set(BITSIZE "Win32")
endif()

if (NOT MSVC)
	message(ERROR "Oculus SDK is only on Windows")
endif()

if (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER "18")
	set(VS_VERSION "VS2015")
elseif (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER "17")
	set(VS_VERSION "VS2013")
elseif (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER "16")
	set(VS_VERSION "VS2012")
elseif (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER "15")
	set(VS_VERSION "VS2010")
else ()
	message(ERROR "Unsupported MSVC version: ${CMAKE_CXX_COMPILER_VERSION}")
endif()

find_library(OCULUS_SDK_LIBRARY_TMP NAMES OVR LibOVR.lib
	HINTS
	$ENV{OCULUS_SDK}
	${OCULUS_SDK}
	PATH_SUFFIXES LibOVR/Lib/Windows/${BITSIZE}/Release/${VS_VERSION}/
	# TODO: I don't know where these would be on Linux/OS X machines
	# Does the Oculus SDK even run on those OS's?
	PATHS
	/sw
	/opt/local
	/opt/csw
	/opt
)

set(OCULUS_SDK_FOUND FALSE)
if (OCULUS_SDK_LIBRARY_TMP)
	set(OCULUS_SDK_LIBRARY ${OCULUS_SDK_LIBRARY_TMP} CACHE STRING "Which Oculus LibOVR to link against")
	set(OCULUS_SDK_LIBRARY_TMP ${OCULUS_SDK_LIBRARY_TMP} CACHE INTERNAL "")
	set(OCULUS_SDK_FOUND TRUE)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(OculusSDK REQUIRED_VARS OCULUS_SDK_LIBRARY OCULUS_SDK_INCLUDE_DIR)

