
cmake_minimum_required(VERSION 3.12)

project(sdna_lite)

set(CMAKE_CXX_STANDARD 03)

set(SOURCES=
  sDNA/muparser/drop/docs/html/misc/calc.cpp
  sDNA/muparser/drop/docs/html/misc/listvar.cpp
  sDNA/muparser/drop/docs/html/misc/list_expr_var.cpp
  sDNA/muparser/drop/samples/example1/example1.cpp
  sDNA/muparser/drop/src/muParser.cpp
  sDNA/muparser/drop/src/muParserBase.cpp
  sDNA/muparser/drop/src/muParserBytecode.cpp
  sDNA/muparser/drop/src/muParserCallback.cpp
  sDNA/muparser/drop/src/muParserDLL.cpp
  sDNA/muparser/drop/src/muParserError.cpp
  sDNA/muparser/drop/src/muParserInt.cpp
  sDNA/muparser/drop/src/muParserTest.cpp
  sDNA/muparser/drop/src/muParserTokenReader.cpp
  sDNA/sdnacomwrapper/Calculation.cpp
  sDNA/sdnacomwrapper/dllmain.cpp
  sDNA/sdnacomwrapper/globalwindow.cpp
  sDNA/sdnacomwrapper/sdnacomwrapper.cpp
  sDNA/sdnacomwrapper/SDNAWindow.cpp
  sDNA/sdnacomwrapper/SpatialNet.cpp
  sDNA/sdnacomwrapper/stdafx.cpp
  sDNA/sdnacomwrapper/utils.cpp
  sDNA/sdna_vs2008/calculation.cpp
  sDNA/sdna_vs2008/calc_output_code.cpp
  sDNA/sdna_vs2008/dijkstra.cpp
  sDNA/sdna_vs2008/dllmain.cpp
  sDNA/sdna_vs2008/edge.cpp
  sDNA/sdna_vs2008/geos_sdna_wrapper.cpp
  sDNA/sdna_vs2008/interface_funcs.cpp
  sDNA/sdna_vs2008/metricevaluator.cpp
  sDNA/sdna_vs2008/net.cpp
  sDNA/sdna_vs2008/prepareoperations.cpp
  sDNA/sdna_vs2008/random.cpp
  sDNA/sdna_vs2008/sDNACalculationFactory.cpp
  sDNA/sdna_vs2008/sdna_geometry_collections.cpp
  sDNA/sdna_vs2008/stdafx.cpp
  sDNA/sdna_vs2008/unit_tests.cpp
  sDNA/sdna_vs2008/IteratorTypeErasure/documentation/any_iterator_demo.cpp
  )

set(HEADERS=
  sDNA/muparser/drop/include/muParser.h
  sDNA/muparser/drop/include/muParserBase.h
  sDNA/muparser/drop/include/muParserBytecode.h
  sDNA/muparser/drop/include/muParserCallback.h
  sDNA/muparser/drop/include/muParserDef.h
  sDNA/muparser/drop/include/muParserDLL.h
  sDNA/muparser/drop/include/muParserError.h
  sDNA/muparser/drop/include/muParserFixes.h
  sDNA/muparser/drop/include/muParserInt.h
  sDNA/muparser/drop/include/muParserStack.h
  sDNA/muparser/drop/include/muParserTemplateMagic.h
  sDNA/muparser/drop/include/muParserTest.h
  sDNA/muparser/drop/include/muParserToken.h
  sDNA/muparser/drop/include/muParserTokenReader.h
  sDNA/sdnacomwrapper/Calculation.h
  sDNA/sdnacomwrapper/DispatchPtr.h
  sDNA/sdnacomwrapper/dllmain.h
  sDNA/sdnacomwrapper/globalwindow.h
  sDNA/sdnacomwrapper/resource.h
  sDNA/sdnacomwrapper/SDNAWindow.h
  sDNA/sdnacomwrapper/SpatialNet.h
  sDNA/sdnacomwrapper/stdafx.h
  sDNA/sdnacomwrapper/targetver.h
  sDNA/sdnacomwrapper/utils.h
  sDNA/sdna_vs2008/calculation.h
  sDNA/sdna_vs2008/calculationbase.h
  sDNA/sdna_vs2008/config_string_parser.h
  sDNA/sdna_vs2008/dataacquisitionstrategy.h
  sDNA/sdna_vs2008/dummy_doxygen_containers.h
  sDNA/sdna_vs2008/edge.h
  sDNA/sdna_vs2008/geos_sdna_wrapper.h
  sDNA/sdna_vs2008/linkdatasource.h
  sDNA/sdna_vs2008/metricevaluator.h
  sDNA/sdna_vs2008/net.h
  sDNA/sdna_vs2008/point.h
  sDNA/sdna_vs2008/prepareoperations.h
  sDNA/sdna_vs2008/random.h
  sDNA/sdna_vs2008/sdna.h
  sDNA/sdna_vs2008/sDNACalculationFactory.h
  sDNA/sdna_vs2008/sdna_arrays.h
  sDNA/sdna_vs2008/sdna_geometry_collections.h
  sDNA/sdna_vs2008/sdna_output_utils.h
  sDNA/sdna_vs2008/sdna_spatial_accumulators.h
  sDNA/sdna_vs2008/stdafx.h
  sDNA/sdna_vs2008/tables.h
  sDNA/sdna_vs2008/targetver.h
  sDNA/sdna_vs2008/unique_id.h
  sDNA/sdna_vs2008/version_template.h
  )

# Setup output directories.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)

# Add a shared library target
add_library(MySharedLib SHARED ${SOURCES} ${HEADERS})


