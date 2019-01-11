cooking_ingredient(smf
  COOKING_RECIPE wellknown
  COOKING_CMAKE_ARGS
    -DSMF_ENABLE_TESTS=OFF
    -DSMF_BUILD_PROGRAMS=OFF
  EXTERNAL_PROJECT_ARGS
    GIT_REPOSITORY https://github.com/smfrpc/smf.git
    GIT_TAG dfe2113
    )
