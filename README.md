
# Linux System Audit & Activity Monitoring Script

## Overview

Bash-based Linux system audit script to monitor system health, user activity, authentication failures, and privileged commands, generating timestamped audit reports. Developed on Ubuntu 24.04 (WSL2).


## Key Features

* System Info: Hostname, OS, kernel, architecture, uptime, load
* Disk Usage: Mounted filesystem usage and alerts
* CPU & Memory: Resource utilization and top processes
* Failed Login Attempts: Detects sudo/authentication failures
* Recent Sudo Activity: Tracks privileged commands executed
* User Accounts: Lists local users and home directories



## Output

* Terminal display + timestamped report in `reports/audit_YYYY-MM-DD_HH-MM-SS.txt`
* Clear, structured sections for **system monitoring and audit review**



## Skills Demonstrated

* Bash scripting
* Linux system administration
* Log analysis and authentication auditing
* Privilege monitoring and operational reporting



## Usage


chmod +x system_audit.sh
sudo ./system_audit.sh


> `sudo` required to access authentication logs and system info


