#!/bin/bash
source $(dirname "$0")/config.sh

# # if a jmc folder already exists, remove it prior to cloning
if [ -d $JMC_ROOT ]; then
    rm -rf $JMC_ROOT;
fi

# clone the jmc repo
git clone $JMC_REPO $JMC_ROOT || { echo $CLONE_ERROR; exit 1; };

# apply the local patch
cd $JMC_ROOT;
git apply ../patches/0-run-jfr.patch;
cd ..;

# setup the p2 repository
mvn p2:site -f $JMC_THIRD_PARTY/pom.xml || { echo $P2_ERROR; exit 1; };

# run the jetty server in the background
mvn jetty:run -f $JMC_THIRD_PARTY/pom.xml &
jetty_pid=$!;

# build jmc-core
mvn clean install -f $JMC_CORE/pom.xml || { echo $JMC_CORE_BUILD_ERROR; kill $jetty_pid; exit 1; };

# build jmc w/spotbugs enabled
cd $JMC_ROOT;
mvn verify || { echo $JMC_BUILD_ERROR; kill $jetty_pid; exit 1;}

# kill the jetty process
kill $jetty_pid;

exit 0;
