# repos
JMC_REPO=https://github.com/openjdk/jmc.git

# jmc
JMC_QA=$(dirname "$0")/..
JMC_ROOT=$JMC_QA/jmc
JMC_CORE=$JMC_ROOT/core
JMC_THIRD_PARTY=$JMC_ROOT/releng/third-party

# ui test 
RCP_APPLICATION_JAVA=$JMC_ROOT/application/org.openjdk.jmc.rcp.application/src/main/java/org/openjdk/jmc/rcp/application/Application.java

# error messages
CLONE_ERROR="Something happened while cloning the jmc repo."
P2_ERROR="Something happened while setting up the p2 repo."
JMC_CORE_BUILD_ERROR="Something happened while building jmc-core."
JMC_BUILD_ERROR="Something happened while building jmc."
UITEST_ERROR="Something happened while running uitests."
