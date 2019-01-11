find_package(smf)
include(smfc_generator)
smfc_gen(
  CPP
  TARGET_NAME demo_fbs
  OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
  SOURCES demo_service.fbs)

# server
add_executable(demo_server server/main.cc "${demo_fbs}")
target_link_libraries(demo_server smf::smf)
target_include_directories(demo_server PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

# client
add_executable(demo_client client/main.cc "${demo_fbs}")
target_link_libraries(demo_client smf::smf)
target_include_directories(demo_client PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

# helpers install
install(TARGETS
  demo_server
  demo_client
  DESTINATION bin)
