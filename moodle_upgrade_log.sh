#!/usr/bin/env bash

LOGDIR="../moodle_econcordia_com_upgrade_logs"
TODAY="$(date +%Y-%m-%d)"

# Save the current SHA1 (baseline for diff/log ranges).
oldsha1="$(git rev-parse HEAD)"
echo "Baseline (oldsha1): $oldsha1" | tee "$LOGDIR/${TODAY}_baseline.txt"

# Pull new updates.
git pull upstream MOODLE_405_STABLE | tee "$LOGDIR/${TODAY}_pull.txt"

# Log full diff stats since baseline.
git diff --stat=1000,1000 "$oldsha1" | tee "$LOGDIR/${TODAY}_fulldiff.txt"

# Log commits touching course and database module since baseline.
for path in course/ mod/data/; do
    git log "$oldsha1..HEAD" --no-merges --date-order --format="%n=====================================%ncommit %H%nDate: %ad%nSubject: %B" --date=short --name-only -- "$path" ':(exclude)*.min.js' ':(exclude)*.min.js.map' | tee "$LOGDIR/${TODAY}_${path//\//}_commits.txt"
done