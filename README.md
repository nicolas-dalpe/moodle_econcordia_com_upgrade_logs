# Purpose
This repository stores the Core Moodle upgrade logs as we merge them into develop. The purpose of this is to track changes coming from Moodle that could affect our custom plugins (peershare, course format, theme, etc).

## This script is logging:
 - **YYYY-MM-DD_baseline.txt**\
   This is the commit hash we are starting from on the Moodle stable branch before issuing the pull command.
 - **YYYY-MM-DD_fulldiff.txt**\
   Lists all the files (full path) that has changed in this pull.
 - **YYYY-MM-DD_pull.txt**\
   Lists all the files (as git pull write it) that has changed in this pull.
 - **YYYY-MM-DD_course_commits.txt**\
   This file lists all the commits that affected files in the course/ directory.
 - **YYYY-MM-DD_moddata_commits.txt**\
   This file lists all the commits that affected files in the mod/data/ directory.
 - **YYYY-MM-DD_themeboost_commits.txt**\
   This file lists all the commits that affected files in the theme/boost/ directory.

## The script:
- **moodle_upgrade_log.sh**
    - This script is automating the commands to create the log files.
    - Everybody is encourage to review and suggest improvements.

## Script usage
- Checkout this repo in a folder one level up to the Moodle repo. The directory should be called moodle_econcordia_com_upgrade_logs.
    - ~/projects/moodle_econcordia_com_450
    - ~/projects/moodle_econcordia_com_upgrade_logs
- Checkout the Core Moodle branch your want to pull from
- Copy the .sh script into your Moodle root folder where you want to pull from Moodle (unupgraded branch).
- Add execute priviledge (chmod +x moodle_upgrade_log.sh)
- Execute the file ./moodle_upgrade_log.sh


