#!/bin/bash
#
#MIT License
#
#Copyright (c) 2019 dfighter1985
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
#
DSTDIR=./target
PROPFILE=$DSTDIR/repository.properties
JAVADIR=./src/main/java/hu/dfighter1985/extractversion
JAVAFILE=$JAVADIR/Version.java

echo "Revision extractor script running..."

if [ ! -d "$DSTDIR" ]
then
	echo "Creating directory $DSTDIR.."
	mkdir "$DSTDIR"
fi

echo "Extracting revision information..."

REMOTE=`git config --get remote.origin.url`
REVISION=`git log -1 --pretty=format:"%h"`
TIMESTAMP=`git log -1 --pretty=format:"%ct"`
DATE=`date -d @$TIMESTAMP +"%Y-%m-%d %H:%M:%S"`

if [ -z "$REMOTE" ]
then
    REMOTE="NO REMOTE"
fi

if [ -z "$REVISION" ]
then
    REVISION="NOREVISION"
fi

if [ -z "$DATE" ]
then
    DATE="NODATE"
fi

echo "Remote: $REMOTE"
echo "Revision: $REVISION"
echo "Date: $DATE"

echo "Writing these to $PROPFILE..."
echo "repository.remote=$REMOTE" > $PROPFILE
echo "repository.revision=$REVISION" >> $PROPFILE
echo "repository.date=$DATE" >> $PROPFILE

echo "package hu.dfighter1985.extractversion;" > $JAVAFILE
echo "" >> $JAVAFILE
echo "public class Version" >> $JAVAFILE
echo "{" >> $JAVAFILE
echo "	public final static String remote = \"$REMOTE\";" >> $JAVAFILE
echo "	public final static String version = \"$REVISION\";" >> $JAVAFILE
echo "	public final static String date = \"$DATE\";" >> $JAVAFILE
echo "}" >> $JAVAFILE
echo "" >> $JAVAFILE

echo "Done."

exit 0
