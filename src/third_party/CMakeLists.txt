# smf + seastar
set(SMF_ENABLE_TESTS OFF  CACHE BOOL "disable tests for smf")
set(SMF_BUILD_PROGRAMS OFF CACHE BOOL "disable demo programs for smf")
set(SEASTAR_ENABLE_TESTS OFF CACHE BOOL "disable seastar tests")
set(SEASTAR_ENABLE_WERROR OFF CACHE BOOL "disable seastar -Werror")
add_subdirectory(smf)

# testing
add_subdirectory(smf/src/third_party/googletest/googletest)
set(BENCHMARK_ENABLE_GTEST_TESTS OFF CACHE BOOL "disable gtests in benchmark")
set(BENCHMARK_ENABLE_TESTING OFF CACHE BOOL "Disable Google benchmark testing")
set(BENCHMARK_ENABLE_INSTALL OFF CACHE BOOL "Disable installation")
add_subdirectory(smf/src/third_party/google_benchmark)
