#!/bin/bash

# Linux System Audit Script
# Purpose: Automate basic security and system health checks
# Author: Dodou O Nying

# Redirect all output to a report, use timestamps, and prevent messy stdout usage
REPORT_DIR="reports"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="$REPORT_DIR/audit_$TIMESTAMP.txt"

mkdir -p "$REPORT_DIR"
EXEC > "$REPORT_FILE" 2>&1

#System identification section to capture hostname,OS,kernel, and uptime

echo "=== SYSTEM INFORMATION ==="
hostnamectl
echo
uptime
echo

#Disk usage check

echo "=== DISK USAGE CHECK ==="
df -h | awk 'NR>1 &&  $5+0 >= 80 {print "WARNING: High disk usage ->", $0}'
echo

#CPU and Memory snapshot

echo "=== CPU & MEMORY USAGE ===="
top -b -n1 | head -n 10
echo

# Fake Login Detection and brute-force indicator

echo "===== FAILED LOGIN ATTEMPTS ====="

grep -Ei "authentication failure|sudo:.*failure|pam_unix" /var/log/auth.log | tail -n 10 || echo "No authentication failures logged"
echo


#Sudo activity monitoring, privilege escalation usage and audit traail awareness

echo "===== RECENT SUDO ACTIVITY ====="
grep "sudo" /var/log/auth.log | tail -n 5
echo

# New user account check
 
echo "===== RECENT USER ACCOUNTS ====="
awk -F: '$3 >= 1000 {print $1, $3, $6}' /etc/passwd
echo

# Final status message

echo "===== AUDIT COMPLETED ====="
echo "Report saved to $REPORT_FILE"
:






















