cmake_minimum_required(VERSION 3.16)

#################################################################################################################################################################
##                                                                                                                                                              #
## CodeBlocks IDE cmake file based on CodeLite cmake file                                                                                                       #
##                                                                                                                                                              #
#################################################################################################################################################################

if (NOT CMAKE_VERSION VERSION_LESS 3.1) # THIS MUST STAY AT THE TOP OF THE FILE
    cmake_policy(VERSION 3.1) # Doing this prevents multiple, very verbose warnings about policy CMP0053 not being set
endif()

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

#############################################
## Defaults
#############################################
project( "CodeBlocks" )

set( CB_SRC_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

include(UtilsHelper)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated-declarations")

set ( CB_BUILD_DIRECTORY ${CMAKE_BINARY_DIR} )

message( "-- CB_BUILD_DIRECTORY is set to ${CB_BUILD_DIRECTORY}")

set (OS_NAME "WIN")
if (UNIX)
  execute_process(COMMAND uname -s OUTPUT_VARIABLE OS_NAME OUTPUT_STRIP_TRAILING_WHITESPACE)
endif()
message("-- OS name ${OS_NAME}")

set(WX_COMPONENTS "std aui propgrid stc ribbon richtext")

if (WITH_WX_CONFIG)
    set( CB_WX_CONFIG ${WITH_WX_CONFIG} )
else (WITH_WX_CONFIG)
    set( CB_WX_CONFIG wx-config )
endif()

if (UNIX OR MINGW)
    execute_process(COMMAND which ${CB_WX_CONFIG} OUTPUT_VARIABLE WX_TOOL OUTPUT_STRIP_TRAILING_WHITESPACE)
    if (NOT WX_TOOL)
        message(FATAL_ERROR
"\nNo functional wx_config script was found in your PATH.\nIs the wxWidgets development package installed?"
             )
    else()
        # cmake find_package() will try env var WX_CONFIG as wx-config tool path before checking its builtin hardcoded naming conbinations for wx-config tool
        set( ENV{WX_CONFIG} ${WX_TOOL} )
        execute_process(COMMAND sh ${WX_TOOL} --version OUTPUT_VARIABLE WX_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
        string(SUBSTRING "${WX_VERSION}" "0" "1" wxMAJOR_VERSION)
        string(SUBSTRING "${WX_VERSION}" "2" "1" wxMINOR_VERSION)
        string(SUBSTRING "${WX_VERSION}" "4" "1" wxRELEASE_NUMBER)
        if ( wxMAJOR_VERSION LESS 3 )
        message(FATAL_ERROR
"\nI'm afraid your wxWidgets version is too old.\nBuilding CodeBlocks requires at least wxWidgets-3.0.0"
             )
        endif()
        if (MINGW)
          execute_process(COMMAND sh ${WX_TOOL} --debug=no --rescomp OUTPUT_VARIABLE WX_RC_FLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
          string(REGEX REPLACE "windres" "" WX_RC_FLAGS ${WX_RC_FLAGS})
          set (CMAKE_RC_FLAGS "${CMAKE_RC_FLAGS} ${WX_RC_FLAGS}")
          add_definitions(-D__WXMSW__)
        endif (MINGW)
    endif()
    message("-- wx-config used is: ${WX_TOOL}")
    message("-- wxWidgets version is: ${WX_VERSION}")
    if (NOT APPLE AND NOT MINGW)
        # Is the wx we are using built on gtk2 or 3?
        execute_process(COMMAND ${WX_TOOL} --selected_config OUTPUT_VARIABLE WX_GTK_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
        string(SUBSTRING "${WX_GTK_VERSION}" "3" "1" GTK_VERSION)
        message("-- gtk version is: ${GTK_VERSION}")
    endif()
endif (UNIX OR MINGW)

########################################
## Override defaults with user input
########################################

# find wxWidgets once
find_package(wxWidgets COMPONENTS adv aui base core html propgrid xml xrc net stc ribbon richtext REQUIRED)

add_definitions(-DwxUSE_GUI=1)
set ( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11" )

#############################################
## Determine if 32 or 64 bit
#############################################

set(ARCH 32)
set(ARCH_NAME i386)
set(OS_CODENAME "unknown")

message("-- OS_CODENAME is set to ${OS_CODENAME}")

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  set(ARCH 64)
  set(ARCH_NAME x86_64)
endif()

message("-- ARCH ${ARCH}")
message("-- ARCH_NAME ${ARCH_NAME}")

###########################################
## Add the folders, the order matters here
###########################################

# build the Core part of CodeBlocks (regardless of the final target)
add_subdirectory(base/tinyxml)
#add_subdirectory(build_tools/autorevision)
#add_subdirectory(tools/ConsoleRunner)
#add_subdirectory(sdk)
#add_subdirectory(src)
#add_subdirectory(plugins)
