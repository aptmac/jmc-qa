#!/bin/bash
source $(dirname "$0")/config.sh

cd $JMC_QA

# run the jetty server in the background
mvn jetty:run -f $JMC_THIRD_PARTY/pom.xml &
jetty_pid=$!;

# Addresses https://github.com/aptmac/jmc-qa/issues/16
# The RCP application will not display if not given mouse focus.
# Add a cursor placement for 0, 0 in the RCP application setup.
sed -i '53 i 		display.setCursorLocation(0, 0);' $RCP_APPLICATION_JAVA

# run ui tests; skip spotbugs because its run in the previous script
cd $JMC_ROOT
mvn verify --quiet -P uitests -Dspotbugs.skip=true || { $UITEST_ERROR; kill $jetty_pid; exit 1; };

# kill the jetty process
kill $jetty_pid;

exit 0;
