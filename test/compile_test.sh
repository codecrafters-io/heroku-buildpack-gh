#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testCompile()
{
  compile
  assertEquals 0 ${rtrn}
  assertEquals "" "`cat ${STD_ERR}`"

  assertContains "-----> Downloading gh-2.5.0"  "`cat ${STD_OUT}`"
  assertTrue "Should have cached gh `ls -la ${CACHE_DIR}`" "[ -f ${CACHE_DIR}/gh_2.5.0_linux_amd64.tar.gz ]"
  assertFileMD5 "2a0e411f5eda5db61f00fc20ef8bf67b" "${CACHE_DIR}/gh_2.5.0_linux_amd64.tar.gz"

  assertContains "-----> Installing gh-2.5.0"  "`cat ${STD_OUT}`"
  assertTrue "Should have installed shunit in build dir: `ls -la ${BUILD_DIR}`" "[ -d ${BUILD_DIR}/.gh ]"

  # Run again to ensure cache is used
  rm -rf "${BUILD_DIR}/*"

  compile
  assertNotContains "-----> Downloading gh"  "`cat ${STD_OUT}`"
  assertContains "-----> Installing gh"  "`cat ${STD_OUT}`"

  assertEquals 0 ${rtrn}
  assertEquals "" "`cat ${STD_ERR}`"
}
