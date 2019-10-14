#!/usr/bin/env bash


# sync Upstairs to Downstairs
rsync -a --progress /Volumes/SEAGATE/* /Volumes/Seagate\ Backup\ Plus\ Drive/

# sync Downstairs to Upstairs
# rsync -a --progress --progress /Volumes/ Seagate\ Backup\ Plus\ Drive/* /Volumes/SEAGATE/