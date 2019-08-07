#!/bin/bash
echo "build start"

JAR_PATH=lib
BIN_PATH=bin
SRC_PATH=src

# java list
SRC_FILE_LIST_PATH=src/sources.list

#remove old list and create new list
rm -f $SRC_PATH/sources
find $SRC_PATH/ -name *.java > $SRC_FILE_LIST_PATH

#remove old .class file and compile new class
rm -rf $BIN_PATH/
mkdir $BIN_PATH/

#link jar
for file in  ${JAR_PATH}/*.jar;
do
jarfile=${jarfile}:${file}
done
echo "jarfile = "$jarfile

#compile
javac -d $BIN_PATH/ -cp $jarfile @$SRC_FILE_LIST_PATH

#run
java -cp $BIN_PATH$jarfile a4/comp2150/pos/main/test

