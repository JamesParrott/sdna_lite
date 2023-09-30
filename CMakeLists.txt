cmake_minimum_required(3.12)

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


# Setup output directories.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
