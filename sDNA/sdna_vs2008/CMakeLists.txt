cmake_minimum_required(VERSION 3.16.0 FATAL_ERROR)

set(CMAKE_SYSTEM_VERSION 10.0 CACHE STRING "" FORCE)

# set(VCPKG_TARGET_TRIPLET "x64-mingw-static")

# set(VCPKG_HOST_TRIPLET "x64-mingw-static")


# set(CMAKE_TOOLCHAIN_FILE "C:/msys64/home/drjam/vcpkg/scripts/buildsystems/vcpkg.cmake"
#     CACHE STRING "Vcpkg toolchain file")



project(sdna_vs2008 CXX)


# find_package(boost-algorithm CONFIG REQUIRED)
# find_package(boost-bimap CONFIG REQUIRED)
# find_package(boost-chrono CONFIG REQUIRED)
# find_package(boost-date-time CONFIG REQUIRED)
# find_package(boost-foreach CONFIG REQUIRED)
# find_package(boost-geometry CONFIG REQUIRED)
# find_package(boost-iterator CONFIG REQUIRED)
# find_package(boost-lexical-cast CONFIG REQUIRED)
# find_package(boost-math CONFIG REQUIRED)
# find_package(boost-mpl CONFIG REQUIRED)
# find_package(boost-numeric-conversion CONFIG REQUIRED)
# find_package(boost-pool CONFIG REQUIRED)
# find_package(boost-random CONFIG REQUIRED)
# find_package(boost-smart-ptr CONFIG REQUIRED)
# find_package(boost-static-assert CONFIG REQUIRED)
# find_package(boost-system CONFIG REQUIRED)
# find_package(boost-thread CONFIG REQUIRED)
# find_package(boost-type-traits CONFIG REQUIRED)
# find_package(boost-utility CONFIG REQUIRED)
# find_package(boost-variant CONFIG REQUIRED)





################################################################################
# Set target arch type if empty. Visual studio solution generator provides it.
################################################################################
if(NOT CMAKE_VS_PLATFORM_NAME)
    set(CMAKE_VS_PLATFORM_NAME "x64")
endif()
message("${CMAKE_VS_PLATFORM_NAME} architecture in use")

if(NOT ("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Any CPU"
     OR "${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Mixed Platforms"
     OR "${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32"
     OR "${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64"))
    message(FATAL_ERROR "${CMAKE_VS_PLATFORM_NAME} arch is not supported!")
endif()

################################################################################
# Global configuration types
################################################################################
set(CMAKE_CONFIGURATION_TYPES
    "benchmark_probroutes"
    "Debug"
    "Debug_speedup"
    "fast_debug"
    "parallel_debug"
    "release"
    "vtune"
    CACHE STRING "" FORCE
)



if(NOT CONFIG)
    set(CONFIG "release")
endif()
message("${CMAKE_VS_PLATFORM_NAME} architecture in use")


################################################################################
# Common utils
################################################################################
include(CMake/Utils.cmake)

################################################################################
# Additional Global Settings(add specific info there)
################################################################################
include(CMake/GlobalSettingsInclude.cmake OPTIONAL)

################################################################################
# Use solution folders feature
################################################################################
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

################################################################################
# Sub-projects
################################################################################






set(PROJECT_NAME sdna_vs2008)

################################################################################
# Source groups
################################################################################
set(Headers
    "calculation.h"
    "calculationbase.h"
    "config_string_parser.h"
    "dataacquisitionstrategy.h"
    "edge.h"
    "geos_sdna_wrapper.h"
    "linkdatasource.h"
    "metricevaluator.h"
    "net.h"
    "point.h"
    "prepareoperations.h"
    "random.h"
    "sdna.h"
    "sdna_arrays.h"
    "sdna_geometry_collections.h"
    "sdna_output_utils.h"
    "sdna_spatial_accumulators.h"
    "sDNACalculationFactory.h"
    "stdafx.h"
    "tables.h"
    "targetver.h"
    "unique_id.h"
    "version_template.h"
)
source_group("Headers" FILES ${Headers})

set(Sources
    "../muparser/drop/src/muParser.cpp"
    "../muparser/drop/src/muParserBase.cpp"
    "../muparser/drop/src/muParserBytecode.cpp"
    "../muparser/drop/src/muParserCallback.cpp"
    "../muparser/drop/src/muParserError.cpp"
    "../muparser/drop/src/muParserTokenReader.cpp"
    "calc_output_code.cpp"
    "calculation.cpp"
    "dijkstra.cpp"
    "dllmain.cpp"
    "edge.cpp"
    "geos_sdna_wrapper.cpp"
    "interface_funcs.cpp"
    "metricevaluator.cpp"
    "net.cpp"
    "prepareoperations.cpp"
    "random.cpp"
    "sdna_geometry_collections.cpp"
    "sDNACalculationFactory.cpp"
    "stdafx.cpp"
    "unit_tests.cpp"
)
source_group("Sources" FILES ${Sources})

set(ALL_FILES
    ${Headers}
    ${Sources}
)

################################################################################
# Target
################################################################################
add_library(${PROJECT_NAME} SHARED ${ALL_FILES})



target_precompile_headers(${PROJECT_NAME} PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/stdafx.h"
)

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
set(ROOT_NAMESPACE sdna_vs2008)


set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_BENCHMARK_PROBROUTES "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
    OUTPUT_DIRECTORY_DEBUG_SPEEDUP        "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
    OUTPUT_DIRECTORY_DEBUG                "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
    OUTPUT_DIRECTORY_FAST_DEBUG           "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
    OUTPUT_DIRECTORY_PARALLEL_DEBUG       "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
    OUTPUT_DIRECTORY_RELEASE              "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
    OUTPUT_DIRECTORY_VTUNE                "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
    )

set_target_properties(${PROJECT_NAME} PROPERTIES
    INTERPROCEDURAL_OPTIMIZATION_BENCHMARK_PROBROUTES "TRUE"
    INTERPROCEDURAL_OPTIMIZATION_FAST_DEBUG           "TRUE"
    INTERPROCEDURAL_OPTIMIZATION_RELEASE              "TRUE"
)

target_include_directories(${PROJECT_NAME} PUBLIC
    "C:/msys64/mingw64/include/"
    "${CMAKE_CURRENT_SOURCE_DIR}/../muparser/drop/include"
)
# target_include_directories(${PROJECT_NAME} PUBLIC
#     "C:/msys64/mingw64/include/"
#     "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../../Program Files/Boost;"
#     "${CMAKE_CURRENT_SOURCE_DIR}/../muparser/drop/include"
# )

# target_link_directories(${PROJECT_NAME} PUBLIC
#     "C:/Program Files/Boost/lib64-msvc-14.0"
#     )
    
target_link_directories(${PROJECT_NAME} PUBLIC
    "C:/msys64/mingw64/lib/"
    )