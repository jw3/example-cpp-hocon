include(ExternalProject)

set(HOCON_INSTALL cpphocon)
set(HOCON_LIBRARY libcpphocon)

ExternalProject_Add(
        ${HOCON_INSTALL}
        URL https://github.com/puppetlabs/cpp-hocon/archive/master.zip
        UPDATE_COMMAND ""
        INSTALL_COMMAND ""
        LOG_DOWNLOAD ON
        LOG_CONFIGURE ON
        LOG_BUILD ON)

ExternalProject_Get_Property(${HOCON_INSTALL} source_dir binary_dir)
message(STATUS "hocon: ${source_dir} / ${binary_dir} / ${Leatherman_DIR}")

# hocon library
set(HOCON_INCLUDES "${source_dir}/lib/inc")
set(HOCON_LIBRARY_PATH ${binary_dir}/lib/${CMAKE_FIND_LIBRARY_PREFIXES}cpp-hocon.a)
add_library(${HOCON_LIBRARY} UNKNOWN IMPORTED)
set_target_properties(${HOCON_LIBRARY} PROPERTIES
        IMPORTED_LOCATION ${HOCON_LIBRARY_PATH})
add_dependencies(${HOCON_LIBRARY} ${HOCON_INSTALL})
