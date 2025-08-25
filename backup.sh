#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

targetDirectory=$1
destinationDirectory=$2 

echo "$targetDirectory"
echo "$destinationDirectory"

currentTS=$(date +%s)

backupFileName=$(echo -e "backup-$currentTS.tar.gz")

#Next:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# origAbsPath=$(pwd) is the same
origAbsPath=`pwd`

cd $destinationDirectory # <-
destDirAbsPath=`pwd`

cd $origAbsPath # <-
cd $targetDirectory # <-

yesterdayTS=$(($currentTS - 86400))

#create array
declare -a toBackup

# The asterisk * is a wildcard that matches every
# file and directory in the present working directory.
for file in * #
do
  if [[ `date -r $file +%s` -gt $yesterdayTS ]]
  then
     toBackup+=($file)
  fi
done

tar -czvf $backupFileName ${toBackup[@]}

mv $backupFileName $destDirAbsPath
