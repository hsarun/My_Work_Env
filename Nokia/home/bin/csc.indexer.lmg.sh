#! /bin/sh
###############################################################################
#
# File:         cscope-indexer
# Description:  Script to index files for cscope
#
#       This script generates a list of files to index
#       (cscope.out), which is then (optionally) used to
#       generate a cscope database.  You can use this script
#       to just build a list of files, or it can be used to
#       build a list and database.  This script is not used to
#       just build a database (skipping the list of files
#       step), as this can be simply done by just calling
#       "cscope -b".
#
#       Normally, cscope will do its own indexing, but this
#       script can be used to force indexing.  This is useful
#       if you need to recurse into subdirectories, or have
#       many files to index (you can run this script from a
#       cron job, during the night).  It is especially useful
#       for large projects, which can constantly have source
#       files added and deleted; by using this script, the
#       changing sources files are automatically handled.
#
#       Currently, any paths containing "/CVS/" or "/RCS/" are
#       stripped out (ignored).
#
#       This script is written to use only basic shell features, as
#       not all shells have advanced features.
#
# Author:       Darryl Okahata
# Created:      Thu Apr 27 17:12:14 2000
# Modified:     Tue Jun 19 09:47:45 2001 (Darryl Okahata) darrylo@soco.agilent.com
#
# (C) Copyright 2000, Darryl Okahata, all rights reserved.
#
###############################################################################
#
# Usage:
#
#     cscope-indexer [ -v ] [ -l ] [DIR]
#
# where:
#
#    DIR  defaults to '.'
#
#     -l
#          Suppress the generation/updating of the cscope database
#          file.  Only a list of files is generated.
#
#     -v
#          Be verbose.  Output simple progress messages.
#
#
###############################################################################
set -e

# May have to edit this:
if [ -n "$CSCOPE_PATH" ]; then
    PATH="$CSCOPE_PATH:$PATH"
    export PATH
else
    PATH="/usr/local/bin:/sbin:/usr/sbin:/bin:/usr/bin:$PATH"
    export PATH
fi

LIST_ONLY=
DIR='.'
LIST_FILE='cscope.files'
DATABASE_FILE='cscope.out'
RECURSE=1
VERBOSE=0

export DIR RECURSE          # Need to pass these to subprocesses

while [ -n "$1" ]
do
    case "$1" in
    -l)
        LIST_ONLY=1
        ;;
    -v)
        VERBOSE=1
        ;;
    *)
        DIR="$1"
        ;;
    esac
    shift
done

if [ -f 'make/get_output_dir.sh' ]; then
    GEN_DIR_BASE=$(make/get_output_dir.sh gen)
    SKIP_DIRS="! -path \"${DIR}/gen*/*\""
fi

cd $DIR

[ $VERBOSE -ne "0" ] && echo "Creating list of files to index ..."

(
    if [ "X$RECURSE" = "X" ]
    then
        # Ugly, inefficient, but it works.
        [ -d panos ] && EXTRA=panos/
        [ -d gash ] && EXTRA=gash/
        for f in ${EXTRA}*
        do
            echo "${DIR}/${EXTRA}$f"
        done
    else
        eval "find $DIR $SKIP_DIRS \( -type f \)"
        [ -n "$GEN_DIR_BASE" ] && find $GEN_DIR_BASE \( -type f \)
    fi
) | \
    egrep -i '\.([chlys](xx|pp)*|cc|hh|tcl|inc|pasm)$' | \
    sed -e '/\/CVS\//d' -e '/\/RCS\//d' -e 's/^\.\///' -r -e '/^(panos\/)?(lib.*|bin.*|deps.*|objs.*|\.git|\.hg)\//d' -e '/gen.*\/.*\/work\//d' | \
    sort > $LIST_FILE

[ $VERBOSE -ne "0" ] &&  echo "Creating list of files to index ... done"

if [ "X$LIST_ONLY" != "X" ]
then
    exit 0
fi

[ $VERBOSE -ne "0" ] &&  echo "Indexing files ..." && cscope --version

cscope -b -q -k -i $LIST_FILE

[ $VERBOSE -ne "0" ] &&  echo "Indexing files ... done"

exit 0

