# Scripts

## JfrEventDiff

A Python script for spotting difference between two JFR metadata files.

## config.sh

This script contains common paths to be used in the following scripts.

## 1_setup_jmc.sh

This script downloads and builds Java Mission Control (JMC). It gets third party dependencies and puts them into a local p2 repo that is served by Jetty in a child process. While the p2 repo is available on localhost, JMC is built as outlined in the source documentation.

Source documentation: http://hg.openjdk.java.net/jmc/jmc/file/9aa7085f938b/README.md#l177

## 2_run_ui_tests.sh

This script runs the JMC build with uitests.

Source documentation: http://hg.openjdk.java.net/jmc/jmc/file/9aa7085f938b/README.md#l245
