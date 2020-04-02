#!/bin/sh

export JAVA_HOME=$(/usr/libexec/java_home)

export JRE_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jre/Contents/Home

# Maven

export M2_HOME=$HOME/apache-maven-3.6.3
export PATH=$PATH:$M2_HOME/bin
