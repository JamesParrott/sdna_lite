cmake_minimum_required(VERSION 3.16.0 FATAL_ERROR)

set(CMAKE_SYSTEM_VERSION 10.0 CACHE STRING "" FORCE)

set(VCPKG_TARGET_TRIPLET "x64-mingw-static")

set(VCPKG_HOST_TRIPLET "x64-mingw-static")


set(CMAKE_TOOLCHAIN_FILE "C:/msys64/home/drjam/vcpkg/scripts/buildsystems/vcpkg.cmake"
    CACHE STRING "Vcpkg toolchain file")



project(sdna_vs2008 CXX)


find_package(boost-algorithm CONFIG REQUIRED)
find_package(boost-bimap CONFIG REQUIRED)
find_package(boost-chrono CONFIG REQUIRED)
find_package(boost-date-time CONFIG REQUIRED)
find_package(boost-foreach CONFIG REQUIRED)
find_package(boost-geometry CONFIG REQUIRED)
find_package(boost-iterator CONFIG REQUIRED)
find_package(boost-lexical-cast CONFIG REQUIRED)
find_package(boost-math CONFIG REQUIRED)
find_package(boost-mpl CONFIG REQUIRED)
find_package(boost-numeric-conversion CONFIG REQUIRED)
find_package(boost-pool CONFIG REQUIRED)
find_package(boost-random CONFIG REQUIRED)
find_package(boost-smart-ptr CONFIG REQUIRED)
find_package(boost-static-assert CONFIG REQUIRED)
find_package(boost-system CONFIG REQUIRED)
find_package(boost-thread CONFIG REQUIRED)
find_package(boost-type-traits CONFIG REQUIRED)
find_package(boost-utility CONFIG REQUIRED)
find_package(boost-variant CONFIG REQUIRED)





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
    "Release"
    "vtune"
    CACHE STRING "" FORCE
)

################################################################################
# Global compiler options
################################################################################
if(MSVC)
    # remove default flags provided with CMake for MSVC
    set(CMAKE_CXX_FLAGS "")
    set(CMAKE_CXX_FLAGS_BENCHMARK_PROBROUTES "")
    set(CMAKE_CXX_FLAGS_DEBUG "")
    set(CMAKE_CXX_FLAGS_DEBUG_SPEEDUP "")
    set(CMAKE_CXX_FLAGS_FAST_DEBUG "")
    set(CMAKE_CXX_FLAGS_PARALLEL_DEBUG "")
    set(CMAKE_CXX_FLAGS_RELEASE "")
    set(CMAKE_CXX_FLAGS_VTUNE "")
endif()

################################################################################
# Global linker options
################################################################################
if(MSVC)
    # remove default flags provided with CMake for MSVC
    set(CMAKE_EXE_LINKER_FLAGS "")
    set(CMAKE_MODULE_LINKER_FLAGS "")
    set(CMAKE_SHARED_LINKER_FLAGS "")
    set(CMAKE_STATIC_LINKER_FLAGS "")
    set(CMAKE_EXE_LINKER_FLAGS_BENCHMARK_PROBROUTES "${CMAKE_EXE_LINKER_FLAGS}")
    set(CMAKE_MODULE_LINKER_FLAGS_BENCHMARK_PROBROUTES "${CMAKE_MODULE_LINKER_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS_BENCHMARK_PROBROUTES "${CMAKE_SHARED_LINKER_FLAGS}")
    set(CMAKE_STATIC_LINKER_FLAGS_BENCHMARK_PROBROUTES "${CMAKE_STATIC_LINKER_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS}")
    set(CMAKE_MODULE_LINKER_FLAGS_DEBUG "${CMAKE_MODULE_LINKER_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "${CMAKE_SHARED_LINKER_FLAGS}")
    set(CMAKE_STATIC_LINKER_FLAGS_DEBUG "${CMAKE_STATIC_LINKER_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS_DEBUG_SPEEDUP "${CMAKE_EXE_LINKER_FLAGS}")
    set(CMAKE_MODULE_LINKER_FLAGS_DEBUG_SPEEDUP "${CMAKE_MODULE_LINKER_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS_DEBUG_SPEEDUP "${CMAKE_SHARED_LINKER_FLAGS}")
    set(CMAKE_STATIC_LINKER_FLAGS_DEBUG_SPEEDUP "${CMAKE_STATIC_LINKER_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS_FAST_DEBUG "${CMAKE_EXE_LINKER_FLAGS}")
    set(CMAKE_MODULE_LINKER_FLAGS_FAST_DEBUG "${CMAKE_MODULE_LINKER_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS_FAST_DEBUG "${CMAKE_SHARED_LINKER_FLAGS}")
    set(CMAKE_STATIC_LINKER_FLAGS_FAST_DEBUG "${CMAKE_STATIC_LINKER_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS_PARALLEL_DEBUG "${CMAKE_EXE_LINKER_FLAGS}")
    set(CMAKE_MODULE_LINKER_FLAGS_PARALLEL_DEBUG "${CMAKE_MODULE_LINKER_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS_PARALLEL_DEBUG "${CMAKE_SHARED_LINKER_FLAGS}")
    set(CMAKE_STATIC_LINKER_FLAGS_PARALLEL_DEBUG "${CMAKE_STATIC_LINKER_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS}")
    set(CMAKE_MODULE_LINKER_FLAGS_RELEASE "${CMAKE_MODULE_LINKER_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS}")
    set(CMAKE_STATIC_LINKER_FLAGS_RELEASE "${CMAKE_STATIC_LINKER_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS_VTUNE "${CMAKE_EXE_LINKER_FLAGS}")
    set(CMAKE_MODULE_LINKER_FLAGS_VTUNE "${CMAKE_MODULE_LINKER_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS_VTUNE "${CMAKE_SHARED_LINKER_FLAGS}")
    set(CMAKE_STATIC_LINKER_FLAGS_VTUNE "${CMAKE_STATIC_LINKER_FLAGS}")
endif()

################################################################################
# Nuget packages function stub.
################################################################################
function(use_package TARGET PACKAGE VERSION)
    message(WARNING "No implementation of use_package. Create yours. "
                    "Package \"${PACKAGE}\" with version \"${VERSION}\" "
                    "for target \"${TARGET}\" is ignored!")
endfunction()

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


target_link_libraries(${PROJECT_NAME} PRIVATE fmt::fmt)

target_precompile_headers(${PROJECT_NAME} PRIVATE
    "$<$<COMPILE_LANGUAGE:CXX>:${CMAKE_CURRENT_SOURCE_DIR}/stdafx.h>"
)

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")
set(ROOT_NAMESPACE sdna_vs2008)

set_target_properties(${PROJECT_NAME} PROPERTIES
    VS_GLOBAL_KEYWORD "Win32Proj"
)
################################################################################
# Output directory
################################################################################
if("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Any CPU")
    set_target_properties(${PROJECT_NAME} PROPERTIES
        OUTPUT_DIRECTORY_BENCHMARK_PROBROUTES "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_DEBUG_SPEEDUP        "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_DEBUG                "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_FAST_DEBUG           "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_PARALLEL_DEBUG       "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
        OUTPUT_DIRECTORY_RELEASE              "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_VTUNE                "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Mixed Platforms")
    set_target_properties(${PROJECT_NAME} PROPERTIES
        OUTPUT_DIRECTORY_BENCHMARK_PROBROUTES "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_DEBUG_SPEEDUP        "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_DEBUG                "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_FAST_DEBUG           "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_PARALLEL_DEBUG       "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
        OUTPUT_DIRECTORY_RELEASE              "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_VTUNE                "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32")
    set_target_properties(${PROJECT_NAME} PROPERTIES
        OUTPUT_DIRECTORY_BENCHMARK_PROBROUTES "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_DEBUG_SPEEDUP        "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_DEBUG                "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_FAST_DEBUG           "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_PARALLEL_DEBUG       "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_RELEASE              "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
        OUTPUT_DIRECTORY_VTUNE                "${CMAKE_SOURCE_DIR}/$<CONFIG>/"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64")
    set_target_properties(${PROJECT_NAME} PROPERTIES
        OUTPUT_DIRECTORY_BENCHMARK_PROBROUTES "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
        OUTPUT_DIRECTORY_DEBUG_SPEEDUP        "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
        OUTPUT_DIRECTORY_DEBUG                "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
        OUTPUT_DIRECTORY_FAST_DEBUG           "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
        OUTPUT_DIRECTORY_PARALLEL_DEBUG       "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
        OUTPUT_DIRECTORY_RELEASE              "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
        OUTPUT_DIRECTORY_VTUNE                "${CMAKE_SOURCE_DIR}/${CMAKE_VS_PLATFORM_NAME}/$<CONFIG>/"
    )
endif()
if("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Any CPU")
    set_target_properties(${PROJECT_NAME} PROPERTIES
        INTERPROCEDURAL_OPTIMIZATION_BENCHMARK_PROBROUTES "TRUE"
        INTERPROCEDURAL_OPTIMIZATION_FAST_DEBUG           "TRUE"
        INTERPROCEDURAL_OPTIMIZATION_RELEASE              "TRUE"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Mixed Platforms")
    set_target_properties(${PROJECT_NAME} PROPERTIES
        INTERPROCEDURAL_OPTIMIZATION_BENCHMARK_PROBROUTES "TRUE"
        INTERPROCEDURAL_OPTIMIZATION_FAST_DEBUG           "TRUE"
        INTERPROCEDURAL_OPTIMIZATION_RELEASE              "TRUE"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32")
    set_target_properties(${PROJECT_NAME} PROPERTIES
        INTERPROCEDURAL_OPTIMIZATION_BENCHMARK_PROBROUTES "TRUE"
        INTERPROCEDURAL_OPTIMIZATION_FAST_DEBUG           "TRUE"
        INTERPROCEDURAL_OPTIMIZATION_RELEASE              "TRUE"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64")
    set_target_properties(${PROJECT_NAME} PROPERTIES
        INTERPROCEDURAL_OPTIMIZATION_BENCHMARK_PROBROUTES "TRUE"
        INTERPROCEDURAL_OPTIMIZATION_FAST_DEBUG           "TRUE"
        INTERPROCEDURAL_OPTIMIZATION_RELEASE              "TRUE"
    )
endif()
################################################################################
# MSVC runtime library
################################################################################
get_property(MSVC_RUNTIME_LIBRARY_DEFAULT TARGET ${PROJECT_NAME} PROPERTY MSVC_RUNTIME_LIBRARY)
if("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Any CPU")
    string(CONCAT "MSVC_RUNTIME_LIBRARY_STR"
        $<$<CONFIG:benchmark_probroutes>:
            MultiThreaded
        >
        $<$<CONFIG:Debug_speedup>:
            MultiThreadedDebug
        >
        $<$<CONFIG:Debug>:
            MultiThreadedDebug
        >
        $<$<CONFIG:fast_debug>:
            MultiThreaded
        >
        $<$<CONFIG:parallel_debug>:
            MultiThreadedDebug
        >
        $<$<CONFIG:Release>:
            MultiThreaded
        >
        $<$<CONFIG:vtune>:
            MultiThreadedDebug
        >
        $<$<NOT:$<OR:$<CONFIG:benchmark_probroutes>,$<CONFIG:Debug_speedup>,$<CONFIG:Debug>,$<CONFIG:fast_debug>,$<CONFIG:parallel_debug>,$<CONFIG:Release>,$<CONFIG:vtune>>>:${MSVC_RUNTIME_LIBRARY_DEFAULT}>
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Mixed Platforms")
    string(CONCAT "MSVC_RUNTIME_LIBRARY_STR"
        $<$<CONFIG:benchmark_probroutes>:
            MultiThreaded
        >
        $<$<CONFIG:Debug_speedup>:
            MultiThreadedDebug
        >
        $<$<CONFIG:Debug>:
            MultiThreadedDebug
        >
        $<$<CONFIG:fast_debug>:
            MultiThreaded
        >
        $<$<CONFIG:parallel_debug>:
            MultiThreadedDebug
        >
        $<$<CONFIG:Release>:
            MultiThreaded
        >
        $<$<CONFIG:vtune>:
            MultiThreadedDebug
        >
        $<$<NOT:$<OR:$<CONFIG:benchmark_probroutes>,$<CONFIG:Debug_speedup>,$<CONFIG:Debug>,$<CONFIG:fast_debug>,$<CONFIG:parallel_debug>,$<CONFIG:Release>,$<CONFIG:vtune>>>:${MSVC_RUNTIME_LIBRARY_DEFAULT}>
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32")
    string(CONCAT "MSVC_RUNTIME_LIBRARY_STR"
        $<$<CONFIG:benchmark_probroutes>:
            MultiThreaded
        >
        $<$<CONFIG:Debug_speedup>:
            MultiThreadedDebug
        >
        $<$<CONFIG:Debug>:
            MultiThreadedDebug
        >
        $<$<CONFIG:fast_debug>:
            MultiThreaded
        >
        $<$<CONFIG:parallel_debug>:
            MultiThreadedDebug
        >
        $<$<CONFIG:Release>:
            MultiThreaded
        >
        $<$<CONFIG:vtune>:
            MultiThreadedDebug
        >
        $<$<NOT:$<OR:$<CONFIG:benchmark_probroutes>,$<CONFIG:Debug_speedup>,$<CONFIG:Debug>,$<CONFIG:fast_debug>,$<CONFIG:parallel_debug>,$<CONFIG:Release>,$<CONFIG:vtune>>>:${MSVC_RUNTIME_LIBRARY_DEFAULT}>
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64")
    string(CONCAT "MSVC_RUNTIME_LIBRARY_STR"
        $<$<CONFIG:benchmark_probroutes>:
            MultiThreaded
        >
        $<$<CONFIG:Debug_speedup>:
            MultiThreadedDebug
        >
        $<$<CONFIG:Debug>:
            MultiThreadedDebug
        >
        $<$<CONFIG:fast_debug>:
            MultiThreaded
        >
        $<$<CONFIG:parallel_debug>:
            MultiThreadedDebug
        >
        $<$<CONFIG:Release>:
            MultiThreaded
        >
        $<$<CONFIG:vtune>:
            MultiThreadedDebug
        >
        $<$<NOT:$<OR:$<CONFIG:benchmark_probroutes>,$<CONFIG:Debug_speedup>,$<CONFIG:Debug>,$<CONFIG:fast_debug>,$<CONFIG:parallel_debug>,$<CONFIG:Release>,$<CONFIG:vtune>>>:${MSVC_RUNTIME_LIBRARY_DEFAULT}>
    )
endif()
set_target_properties(${PROJECT_NAME} PROPERTIES MSVC_RUNTIME_LIBRARY ${MSVC_RUNTIME_LIBRARY_STR})

################################################################################
# Include directories
################################################################################
if("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Any CPU")
    target_include_directories(${PROJECT_NAME} PUBLIC
        "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../../Program Files/Boost;"
        "${CMAKE_CURRENT_SOURCE_DIR}/../muparser/drop/include"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Mixed Platforms")
    target_include_directories(${PROJECT_NAME} PUBLIC
        "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../../Program Files/Boost;"
        "${CMAKE_CURRENT_SOURCE_DIR}/../muparser/drop/include"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32")
    target_include_directories(${PROJECT_NAME} PUBLIC
        "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../../Program Files/Boost;"
        "${CMAKE_CURRENT_SOURCE_DIR}/../muparser/drop/include"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64")
    target_include_directories(${PROJECT_NAME} PUBLIC
        "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../../Program Files/Boost;"
        "${CMAKE_CURRENT_SOURCE_DIR}/../muparser/drop/include"
    )
endif()

################################################################################
# Compile definitions
################################################################################
if("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Any CPU")
    target_compile_definitions(${PROJECT_NAME} PRIVATE
        "$<$<CONFIG:benchmark_probroutes>:"
            "NDEBUG;"
            "BENCHMARK;"
            "PROB_ROUTE_CODE"
        ">"
        "$<$<CONFIG:Debug_speedup>:"
            "_DEBUG"
        ">"
        "$<$<CONFIG:Debug>:"
            "_DEBUG;"
            "_SDNADEBUG"
        ">"
        "$<$<CONFIG:fast_debug>:"
            "NDEBUG"
        ">"
        "$<$<CONFIG:parallel_debug>:"
            "_DEBUG;"
            "_SDNADEBUG"
        ">"
        "$<$<CONFIG:Release>:"
            "NDEBUG"
        ">"
        "$<$<CONFIG:vtune>:"
            "_DEBUG"
        ">"
        "WIN32;"
        "_WINDOWS;"
        "_USRDLL;"
        "SDNA_VS2008_EXPORTS;"
        "UNICODE;"
        "_UNICODE"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Mixed Platforms")
    target_compile_definitions(${PROJECT_NAME} PRIVATE
        "$<$<CONFIG:benchmark_probroutes>:"
            "NDEBUG;"
            "BENCHMARK;"
            "PROB_ROUTE_CODE"
        ">"
        "$<$<CONFIG:Debug_speedup>:"
            "_DEBUG"
        ">"
        "$<$<CONFIG:Debug>:"
            "_DEBUG;"
            "_SDNADEBUG"
        ">"
        "$<$<CONFIG:fast_debug>:"
            "NDEBUG"
        ">"
        "$<$<CONFIG:parallel_debug>:"
            "_DEBUG;"
            "_SDNADEBUG"
        ">"
        "$<$<CONFIG:Release>:"
            "NDEBUG"
        ">"
        "$<$<CONFIG:vtune>:"
            "_DEBUG"
        ">"
        "WIN32;"
        "_WINDOWS;"
        "_USRDLL;"
        "SDNA_VS2008_EXPORTS;"
        "UNICODE;"
        "_UNICODE"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32")
    target_compile_definitions(${PROJECT_NAME} PRIVATE
        "$<$<CONFIG:benchmark_probroutes>:"
            "NDEBUG;"
            "BENCHMARK;"
            "PROB_ROUTE_CODE"
        ">"
        "$<$<CONFIG:Debug_speedup>:"
            "_DEBUG"
        ">"
        "$<$<CONFIG:Debug>:"
            "_DEBUG;"
            "_SDNADEBUG"
        ">"
        "$<$<CONFIG:fast_debug>:"
            "NDEBUG"
        ">"
        "$<$<CONFIG:parallel_debug>:"
            "_DEBUG;"
            "_SDNADEBUG"
        ">"
        "$<$<CONFIG:Release>:"
            "NDEBUG"
        ">"
        "$<$<CONFIG:vtune>:"
            "_DEBUG"
        ">"
        "WIN32;"
        "_WINDOWS;"
        "_USRDLL;"
        "SDNA_VS2008_EXPORTS;"
        "UNICODE;"
        "_UNICODE"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64")
    target_compile_definitions(${PROJECT_NAME} PRIVATE
        "$<$<CONFIG:benchmark_probroutes>:"
            "NDEBUG;"
            "BENCHMARK;"
            "PROB_ROUTE_CODE"
        ">"
        "$<$<CONFIG:Debug_speedup>:"
            "_DEBUG"
        ">"
        "$<$<CONFIG:Debug>:"
            "_DEBUG;"
            "_SDNADEBUG"
        ">"
        "$<$<CONFIG:fast_debug>:"
            "NDEBUG"
        ">"
        "$<$<CONFIG:parallel_debug>:"
            "_DEBUG;"
            "_SDNADEBUG"
        ">"
        "$<$<CONFIG:Release>:"
            "NDEBUG"
        ">"
        "$<$<CONFIG:vtune>:"
            "_DEBUG"
        ">"
        "WIN32;"
        "_WINDOWS;"
        "_USRDLL;"
        "SDNA_VS2008_EXPORTS;"
        "UNICODE;"
        "_UNICODE"
    )
endif()

################################################################################
# Compile and link options
################################################################################
if(MSVC)
    if("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Any CPU")
        target_compile_options(${PROJECT_NAME} PRIVATE
            $<$<CONFIG:benchmark_probroutes>:
                /O2;
                /Ob2;
                /Oi;
                /Gy-;
                /Zi;
                /Ot;
                /GR-;
                /GS-;
                /openmp
            >
            $<$<CONFIG:Debug_speedup>:
                /O2;
                /Zi;
                /Ot;
                /openmp
            >
            $<$<CONFIG:Debug>:
                /Od;
                /RTC1;
                /Zi;
                
            >
            $<$<CONFIG:fast_debug>:
                /O2;
                /Ob2;
                /Oi;
                /Gy-;
                /Zi;
                /Ot;
                /GR-;
                /GS-;
                /openmp
            >
            $<$<CONFIG:parallel_debug>:
                /Od;
                /RTC1;
                /Zi;
                
            >
            $<$<CONFIG:Release>:
                /O2;
                /Ob2;
                /Oi;
                /Gy-;
                /Zi;
                /Ot;
                /GR-;
                /GS-;
                /openmp
            >
            $<$<CONFIG:vtune>:
                /Od;
                /RTC1;
                /ZI;
                
            >
            /Gm-;
            /W3;
            /fp:precise;
            /Zm140;
            ${DEFAULT_CXX_EXCEPTION_HANDLING}
        )
    elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Mixed Platforms")
        target_compile_options(${PROJECT_NAME} PRIVATE
            $<$<CONFIG:benchmark_probroutes>:
                /O2;
                /Ob2;
                /Oi;
                /Gy-;
                /Zi;
                /Ot;
                /GR-;
                /GS-;
                /openmp
            >
            $<$<CONFIG:Debug_speedup>:
                /O2;
                /Zi;
                /Ot;
                /openmp
            >
            $<$<CONFIG:Debug>:
                /Od;
                /RTC1;
                /Zi;
                
            >
            $<$<CONFIG:fast_debug>:
                /O2;
                /Ob2;
                /Oi;
                /Gy-;
                /Zi;
                /Ot;
                /GR-;
                /GS-;
                /openmp
            >
            $<$<CONFIG:parallel_debug>:
                /Od;
                /RTC1;
                /Zi;
                
            >
            $<$<CONFIG:Release>:
                /O2;
                /Ob2;
                /Oi;
                /Gy-;
                /Zi;
                /Ot;
                /GR-;
                /GS-;
                /openmp
            >
            $<$<CONFIG:vtune>:
                /Od;
                /RTC1;
                /ZI;
                
            >
            /Gm-;
            /W3;
            /fp:precise;
            /Zm140;
            ${DEFAULT_CXX_EXCEPTION_HANDLING}
        )
    elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32")
        target_compile_options(${PROJECT_NAME} PRIVATE
            $<$<CONFIG:benchmark_probroutes>:
                /O2;
                /Ob2;
                /Oi;
                /Gy-;
                /Zi;
                /Ot;
                /GR-;
                /GS-;
                /openmp
            >
            $<$<CONFIG:Debug_speedup>:
                /O2;
                /Zi;
                /Ot;
                /openmp
            >
            $<$<CONFIG:Debug>:
                /Od;
                /RTC1;
                /Zi;
                
            >
            $<$<CONFIG:fast_debug>:
                /O2;
                /Ob2;
                /Oi;
                /Gy-;
                /Zi;
                /Ot;
                /GR-;
                /GS-;
                /openmp
            >
            $<$<CONFIG:parallel_debug>:
                /Od;
                /RTC1;
                /Zi;
                /openmp
            >
            $<$<CONFIG:Release>:
                /O2;
                /Ob2;
                /Oi;
                /Gy-;
                /Zi;
                /Ot;
                /GR-;
                /GS-;
                /openmp
            >
            $<$<CONFIG:vtune>:
                /Od;
                /RTC1;
                /ZI;
                
            >
            /Gm-;
            /W3;
            /fp:precise;
            /Zm140;
            ${DEFAULT_CXX_EXCEPTION_HANDLING}
        )
    elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64")
        target_compile_options(${PROJECT_NAME} PRIVATE
            $<$<CONFIG:benchmark_probroutes>:
                /O2;
                /Ob2;
                /Oi;
                /Gy-;
                /Ot;
                /GR-;
                /GS-;
                /openmp
            >
            $<$<CONFIG:Debug_speedup>:
                /O2;
                /Ot;
                /openmp
            >
            $<$<CONFIG:Debug>:
                /Od;
                /RTC1;
                
            >
            $<$<CONFIG:fast_debug>:
                /O2;
                /Ob2;
                /Oi;
                /Gy-;
                /Ot;
                /GR-;
                /GS-;
                /openmp
            >
            $<$<CONFIG:parallel_debug>:
                /Od;
                /RTC1;
                
            >
            $<$<CONFIG:Release>:
                /O2;
                /Ob2;
                /Oi;
                /Gy-;
                /Ot;
                /GR;
                /GS-;
                /openmp
            >
            $<$<CONFIG:vtune>:
                /Od;
                /RTC1;
                
            >
            /Gm-;
            /W3;
            /Zi;
            /fp:precise;
            /Zm140;
            ${DEFAULT_CXX_EXCEPTION_HANDLING}
        )
    endif()
    if("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Any CPU")
        string(CONCAT FILE_CL_OPTIONS
            "/Zm140"
        )
    elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Mixed Platforms")
        string(CONCAT FILE_CL_OPTIONS
            "/Zm140"
        )
    elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32")
        string(CONCAT FILE_CL_OPTIONS
            "/Zm140"
        )
    elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64")
        string(CONCAT FILE_CL_OPTIONS
            "/Zm140"
        )
    endif()
    source_file_compile_options(stdafx.cpp ${FILE_CL_OPTIONS})
    if("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Any CPU")
        target_link_options(${PROJECT_NAME} PRIVATE
            $<$<CONFIG:benchmark_probroutes>:
                /MACHINE:X86;
                /OPT:REF;
                /OPT:ICF;
                /INCREMENTAL:NO
            >
            $<$<CONFIG:Debug_speedup>:
                /MACHINE:X86;
                /INCREMENTAL
            >
            $<$<CONFIG:Debug>:
                /MACHINE:X86;
                /INCREMENTAL
            >
            $<$<CONFIG:fast_debug>:
                /MACHINE:X86;
                /OPT:REF;
                /OPT:ICF;
                /INCREMENTAL:NO
            >
            $<$<CONFIG:parallel_debug>:
                /MACHINE:X64;
                /INCREMENTAL
            >
            $<$<CONFIG:Release>:
                /MACHINE:X86;
                /OPT:REF;
                /OPT:ICF;
                /INCREMENTAL:NO
            >
            $<$<CONFIG:vtune>:
                /MACHINE:X86;
                /INCREMENTAL
            >
            /DEBUG;
            /SUBSYSTEM:WINDOWS
        )
    elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Mixed Platforms")
        target_link_options(${PROJECT_NAME} PRIVATE
            $<$<CONFIG:benchmark_probroutes>:
                /MACHINE:X86;
                /OPT:REF;
                /OPT:ICF;
                /INCREMENTAL:NO
            >
            $<$<CONFIG:Debug_speedup>:
                /MACHINE:X86;
                /INCREMENTAL
            >
            $<$<CONFIG:Debug>:
                /MACHINE:X86;
                /INCREMENTAL
            >
            $<$<CONFIG:fast_debug>:
                /MACHINE:X86;
                /OPT:REF;
                /OPT:ICF;
                /INCREMENTAL:NO
            >
            $<$<CONFIG:parallel_debug>:
                /MACHINE:X64;
                /INCREMENTAL
            >
            $<$<CONFIG:Release>:
                /MACHINE:X86;
                /OPT:REF;
                /OPT:ICF;
                /INCREMENTAL:NO
            >
            $<$<CONFIG:vtune>:
                /MACHINE:X86;
                /INCREMENTAL
            >
            /DEBUG;
            /SUBSYSTEM:WINDOWS
        )
    elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32")
        target_link_options(${PROJECT_NAME} PRIVATE
            $<$<CONFIG:benchmark_probroutes>:
                /OPT:REF;
                /OPT:ICF;
                /INCREMENTAL:NO
            >
            $<$<CONFIG:Debug_speedup>:
                /INCREMENTAL
            >
            $<$<CONFIG:Debug>:
                /INCREMENTAL
            >
            $<$<CONFIG:fast_debug>:
                /OPT:REF;
                /OPT:ICF;
                /INCREMENTAL:NO
            >
            $<$<CONFIG:parallel_debug>:
                /INCREMENTAL
            >
            $<$<CONFIG:Release>:
                /OPT:REF;
                /OPT:ICF;
                /INCREMENTAL:NO
            >
            $<$<CONFIG:vtune>:
                /INCREMENTAL
            >
            /DEBUG;
            /MACHINE:X86;
            /SUBSYSTEM:WINDOWS
        )
    elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64")
        target_link_options(${PROJECT_NAME} PRIVATE
            $<$<CONFIG:benchmark_probroutes>:
                /OPT:REF;
                /OPT:ICF;
                /INCREMENTAL:NO
            >
            $<$<CONFIG:Debug_speedup>:
                /INCREMENTAL
            >
            $<$<CONFIG:Debug>:
                /INCREMENTAL
            >
            $<$<CONFIG:fast_debug>:
                /OPT:REF;
                /OPT:ICF;
                /INCREMENTAL:NO
            >
            $<$<CONFIG:parallel_debug>:
                /INCREMENTAL
            >
            $<$<CONFIG:Release>:
                /OPT:REF;
                /OPT:ICF;
                /INCREMENTAL:NO
            >
            $<$<CONFIG:vtune>:
                /INCREMENTAL
            >
            /DEBUG;
            /MACHINE:X64;
            /SUBSYSTEM:WINDOWS
        )
    endif()
endif()

################################################################################
# Pre build events
################################################################################
if("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Any CPU")
    add_custom_command_if(
        TARGET ${PROJECT_NAME}
        PRE_BUILD
        COMMANDS
        COMMAND $<CONFIG:benchmark_probroutes> for /f "usebackq tokens=*" %25%25i in (`C:\\Program Files\\Git\\bin\\git.exe rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND        $<CONFIG:Debug_speedup> for /f "usebackq tokens=*" %25%25i in (`C:\\Program Files\\Git\\bin\\git.exe rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND                $<CONFIG:Debug> for /f "usebackq tokens=*" %25%25i in (`"C:\\Program Files\\Git\\bin\\git.exe" rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND           $<CONFIG:fast_debug> for /f "usebackq tokens=*" %25%25i in (`C:\\Program Files\\Git\\bin\\git.exe rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND       $<CONFIG:parallel_debug> for /f "usebackq tokens=*" %25%25i in (`git rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND              $<CONFIG:Release> for /f "usebackq tokens=*" %25%25i in (`"C:\\Program Files\\Git\\bin\\git.exe" rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND                $<CONFIG:vtune> for /f "usebackq tokens=*" %25%25i in (`C:\\Program Files\\Git\\bin\\git.exe rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMENT "Getting version number"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Mixed Platforms")
    add_custom_command_if(
        TARGET ${PROJECT_NAME}
        PRE_BUILD
        COMMANDS
        COMMAND $<CONFIG:benchmark_probroutes> for /f "usebackq tokens=*" %25%25i in (`C:\\Program Files\\Git\\bin\\git.exe rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND        $<CONFIG:Debug_speedup> for /f "usebackq tokens=*" %25%25i in (`C:\\Program Files\\Git\\bin\\git.exe rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND                $<CONFIG:Debug> for /f "usebackq tokens=*" %25%25i in (`"C:\\Program Files\\Git\\bin\\git.exe" rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND           $<CONFIG:fast_debug> for /f "usebackq tokens=*" %25%25i in (`C:\\Program Files\\Git\\bin\\git.exe rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND       $<CONFIG:parallel_debug> for /f "usebackq tokens=*" %25%25i in (`git rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND              $<CONFIG:Release> for /f "usebackq tokens=*" %25%25i in (`"C:\\Program Files\\Git\\bin\\git.exe" rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND                $<CONFIG:vtune> for /f "usebackq tokens=*" %25%25i in (`C:\\Program Files\\Git\\bin\\git.exe rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMENT "Getting version number"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32")
    add_custom_command_if(
        TARGET ${PROJECT_NAME}
        PRE_BUILD
        COMMANDS
        COMMAND $<CONFIG:benchmark_probroutes> for /f "usebackq tokens=*" %25%25i in (`C:\\Program Files\\Git\\bin\\git.exe rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND        $<CONFIG:Debug_speedup> for /f "usebackq tokens=*" %25%25i in (`C:\\Program Files\\Git\\bin\\git.exe rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND                $<CONFIG:Debug> for /f "usebackq tokens=*" %25%25i in (`"C:\\Program Files\\Git\\bin\\git.exe" rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND           $<CONFIG:fast_debug> for /f "usebackq tokens=*" %25%25i in (`C:\\Program Files\\Git\\bin\\git.exe rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND       $<CONFIG:parallel_debug> for /f "usebackq tokens=*" %25%25i in (`C:\\Program Files\\Git\\bin\\git.exe rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND              $<CONFIG:Release> for /f "usebackq tokens=*" %25%25i in (`"C:\\Program Files\\Git\\bin\\git.exe" rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND                $<CONFIG:vtune> for /f "usebackq tokens=*" %25%25i in (`C:\\Program Files\\Git\\bin\\git.exe rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMENT "Getting version number"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64")
    add_custom_command_if(
        TARGET ${PROJECT_NAME}
        PRE_BUILD
        COMMANDS
        COMMAND $<CONFIG:benchmark_probroutes> for /f "usebackq tokens=*" %25%25i in (`git rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND        $<CONFIG:Debug_speedup> for /f "usebackq tokens=*" %25%25i in (`git rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND                $<CONFIG:Debug> for /f "usebackq tokens=*" %25%25i in (`git rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND           $<CONFIG:fast_debug> for /f "usebackq tokens=*" %25%25i in (`git rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND       $<CONFIG:parallel_debug> for /f "usebackq tokens=*" %25%25i in (`git rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND              $<CONFIG:Release> for /f "usebackq tokens=*" %25%25i in (`git rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMAND                $<CONFIG:vtune> for /f "usebackq tokens=*" %25%25i in (`git rev-parse HEAD`) do sed %27s/#GITHASH#/%25%25i/%27 <version_template.h >version_generated.h
        COMMENT "Getting version number"
    )
endif()

################################################################################
# Post build events
################################################################################
if("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Any CPU")
    add_custom_command_if(
        TARGET ${PROJECT_NAME}
        POST_BUILD
        COMMANDS
        COMMAND $<CONFIG:benchmark_probroutes> copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\
        COMMAND        $<CONFIG:Debug_speedup> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND        $<CONFIG:Debug_speedup> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:Debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:Debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND           $<CONFIG:fast_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND           $<CONFIG:fast_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND       $<CONFIG:parallel_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND       $<CONFIG:parallel_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND              $<CONFIG:Release> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND              $<CONFIG:Release> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:vtune> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:vtune> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMENT "copy to output tree"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Mixed Platforms")
    add_custom_command_if(
        TARGET ${PROJECT_NAME}
        POST_BUILD
        COMMANDS
        COMMAND $<CONFIG:benchmark_probroutes> copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\
        COMMAND        $<CONFIG:Debug_speedup> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND        $<CONFIG:Debug_speedup> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:Debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:Debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND           $<CONFIG:fast_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND           $<CONFIG:fast_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND       $<CONFIG:parallel_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND       $<CONFIG:parallel_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND              $<CONFIG:Release> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND              $<CONFIG:Release> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:vtune> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:vtune> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMENT "copy to output tree"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32")
    add_custom_command_if(
        TARGET ${PROJECT_NAME}
        POST_BUILD
        COMMANDS
        COMMAND $<CONFIG:benchmark_probroutes> copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\
        COMMAND        $<CONFIG:Debug_speedup> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND        $<CONFIG:Debug_speedup> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:Debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:Debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND           $<CONFIG:fast_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND           $<CONFIG:fast_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND       $<CONFIG:parallel_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND       $<CONFIG:parallel_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND              $<CONFIG:Release> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND              $<CONFIG:Release> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:vtune> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:vtune> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMENT "copy to output tree"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64")
    add_custom_command_if(
        TARGET ${PROJECT_NAME}
        POST_BUILD
        COMMANDS
        COMMAND $<CONFIG:benchmark_probroutes> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND $<CONFIG:benchmark_probroutes> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND        $<CONFIG:Debug_speedup> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND        $<CONFIG:Debug_speedup> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:Debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:Debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND           $<CONFIG:fast_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND           $<CONFIG:fast_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND       $<CONFIG:parallel_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND       $<CONFIG:parallel_debug> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND              $<CONFIG:Release> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:vtune> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMAND                $<CONFIG:vtune> IF "${CMAKE_VS_PLATFORM_NAME}"=="x64" ( copy ${OUTPUT_DIRECTORY}\\geos_c.dll $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\x64\\ ) ELSE ( copy $<SHELL_PATH:$<TARGET_FILE:${PROJECT_NAME}>> $<SHELL_PATH:${CMAKE_CURRENT_SOURCE_DIR}/>\\..\\..\\output\\$<CONFIG>\\)
        COMMENT "copy to output tree"
    )
endif()

################################################################################
# Custom build events
################################################################################
if("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Any CPU")
    add_custom_command_if(
        OUTPUT "$(OutDir)geos_c.dll;%(Outputs)"
        COMMANDS
        COMMAND        $<CONFIG:Debug_speedup> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND                $<CONFIG:Debug> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND           $<CONFIG:fast_debug> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND       $<CONFIG:parallel_debug> copy ..\\geos\\x64\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND              $<CONFIG:Release> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND                $<CONFIG:vtune> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMENT "copying geos dll"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Mixed Platforms")
    add_custom_command_if(
        OUTPUT "$(OutDir)geos_c.dll;%(Outputs)"
        COMMANDS
        COMMAND        $<CONFIG:Debug_speedup> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND                $<CONFIG:Debug> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND           $<CONFIG:fast_debug> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND       $<CONFIG:parallel_debug> copy ..\\geos\\x64\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND              $<CONFIG:Release> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND                $<CONFIG:vtune> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMENT "copying geos dll"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32")
    add_custom_command_if(
        OUTPUT "$(OutDir)geos_c.dll;%(Outputs)"
        COMMANDS
        COMMAND        $<CONFIG:Debug_speedup> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND                $<CONFIG:Debug> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND           $<CONFIG:fast_debug> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND       $<CONFIG:parallel_debug> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND              $<CONFIG:Release> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND                $<CONFIG:vtune> copy ..\\geos\\x86\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMENT "copying geos dll"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64")
    add_custom_command_if(
        OUTPUT "$(OutDir)geos_c.dll;%(Outputs)"
        COMMANDS
        COMMAND $<CONFIG:benchmark_probroutes> copy ..\\geos\\x64\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND        $<CONFIG:Debug_speedup> copy ..\\geos\\x64\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND                $<CONFIG:Debug> copy ..\\geos\\x64\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND           $<CONFIG:fast_debug> copy ..\\geos\\x64\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND       $<CONFIG:parallel_debug> copy ..\\geos\\x64\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMAND                $<CONFIG:vtune> copy ..\\geos\\x64\\src\\geos_c.dll $<SHELL_PATH:${OUTPUT_DIRECTORY}>
        COMMENT "copying geos dll"
    )
endif()

if("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Any CPU")
    target_link_directories(${PROJECT_NAME} PUBLIC
        "C:/Program Files/Boost/lib64-msvc-14.0"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Mixed Platforms")
    target_link_directories(${PROJECT_NAME} PUBLIC
        "C:/Program Files/Boost/lib64-msvc-14.0"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "Win32")
    target_link_directories(${PROJECT_NAME} PUBLIC
        "C:/Program Files/Boost/lib64-msvc-14.0"
    )
elseif("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64")
    target_link_directories(${PROJECT_NAME} PUBLIC
        "C:/Program Files/Boost/lib64-msvc-14.0"
    )
endif()

