#!/bin/bash
# Log Analyzer — IT 612 Exercise
# Analyze server.log using command-line tools
#
# Run:  bash analyze.sh
# Save: bash analyze.sh | tee report.txt

LOG="server.log"

echo "=== Log Analysis Report ==="
echo ""

# ─────────────────────────────────────────────
# Step 1: Count the Basics
# Use grep and wc to count lines by log level.
# ─────────────────────────────────────────────
echo "--- Line Counts ---"

# TODO: Count total lines in the log file
# echo "Total lines: $( ... )"
echo "Total Lines: $(wc -l < server.log)"
# TODO: Count lines containing ERROR
# echo "Error lines: $( ... )"
echo "Error Lines: $(grep "ERROR" server.log | wc -l)"
# TODO: Count lines containing WARN
# echo "Warning lines: $( ... )"
echo "Warning Lines: $(grep "WARN" server.log | wc -l)"


# ─────────────────────────────────────────────
# Step 2: Extract Unique Errors
# Find all ERROR lines, extract the message,
# then remove duplicates.
# ─────────────────────────────────────────────
echo "--- Unique Error Messages ---"

# TODO: grep ERROR lines, extract the message part, sort, remove duplicates
# grep ... | awk ... | sort | uniq

echo "$(grep "ERROR" server.log | awk '{for(i=4;i<=NF;i++) printf "%s ", $i; print ""}' | sort | uniq)"

# ─────────────────────────────────────────────
# Step 3: Most Requested Endpoints
# Find GET/POST requests, count unique
# method+path combinations, rank by frequency.
# ─────────────────────────────────────────────
echo "--- Top Endpoints ---"

# TODO: grep for GET or POST, extract method and path, count and rank
# grep ... | awk ... | sort | uniq -c | sort -rn

echo "$(grep -E "GET|POST" server.log | awk '{for(i=4;i<=NF;i++) printf "%s ", $i; print ""}' | sort | uniq -c | sort -rn )"

# ─────────────────────────────────────────────
# Step 4: Who Logged In?
# Find login sessions and count per user.
# ─────────────────────────────────────────────
echo "--- User Logins ---"

# TODO: grep for session lines, extract usernames, count and rank
# grep ... | grep -o ... | sort | uniq -c | sort -rn

echo "$(grep "session created for user=" server.log |grep -o 'user=[a-z]*' server.log | sort | uniq -c | sort -rn)"

# ─────────────────────────────────────────────
# Step 5: Save the Report
# Add a timestamp line so you know when this ran.
# ─────────────────────────────────────────────

# TODO: Print a line showing when this report was generated
# echo "Report generated: $( ... )"
echo "Report generated: $(date)"

